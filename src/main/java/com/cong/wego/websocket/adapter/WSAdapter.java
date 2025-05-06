package com.cong.wego.websocket.adapter;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cong.wego.model.dto.ws.GroupMessageDTO;
import com.cong.wego.model.dto.ws.PrivateMessageDTO;
import com.cong.wego.model.entity.Message;
import com.cong.wego.model.entity.RoomFriend;
import com.cong.wego.model.entity.User;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.model.vo.ws.response.WSBaseResp;
import com.cong.wego.service.RoomFriendService;
import com.cong.wego.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import com.cong.wego.model.vo.message.ChatMessageVo.FileInfo;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * ws适配器
 *
 * @author cong
 * @date 2024/02/18
 */
@Component
public class WSAdapter {
    @Resource
    private UserService userService;
    @Resource
    private RoomFriendService roomFriendService;
    public WSBaseResp<ChatMessageResp> buildPrivateMessageResp(PrivateMessageDTO privateMessageDTO) {
        // 获取私信的发送者
        Long loginUserId = privateMessageDTO.getFromUserId();
        //发送信息
        String content = privateMessageDTO.getContent();
        ChatMessageResp chatMessageResp = getMessageVo(loginUserId, content);
        // 创建WSBaseResp对象
        WSBaseResp<ChatMessageResp> wsBaseResp = new WSBaseResp<>();
        // 设置房间ID
        Long toUserId = privateMessageDTO.getToUserId();
        long uid1 = loginUserId > toUserId ? toUserId : loginUserId;
        long uid2 = loginUserId > toUserId ? loginUserId : toUserId;
        RoomFriend roomFriend = roomFriendService.getOne(new LambdaQueryWrapper<RoomFriend>()
                .eq(RoomFriend::getUid1, uid1).eq(RoomFriend::getUid2, uid2));
        if (roomFriend != null) {
            chatMessageResp.setRoomId(roomFriend.getRoomId());
        }
        // 设置数据和类型
        wsBaseResp.setData(chatMessageResp);
        wsBaseResp.setType(WSReqTypeEnum.CHAT.getType());
        return wsBaseResp;
    }

    public WSBaseResp<ChatMessageResp> buildGroupMessageResp(GroupMessageDTO groupMessageDTO) {
        // 获取私信的发送者
        Long loginUserId = groupMessageDTO.getFromUserId();
        //发送信息
        String content = groupMessageDTO.getContent();
        ChatMessageResp chatMessageResp = getMessageVo(loginUserId, content);
        // 创建WSBaseResp对象
        WSBaseResp<ChatMessageResp> wsBaseResp = new WSBaseResp<>();
        // 设置房间ID
        chatMessageResp.setRoomId(groupMessageDTO.getToRoomId());
        // 设置数据和类型
        wsBaseResp.setData(chatMessageResp);
        wsBaseResp.setType(WSReqTypeEnum.CHAT.getType());
        return wsBaseResp;
    }

    @NotNull
    public ChatMessageResp getMessageVo(Long loginUserId, String content) {
        // 创建ChatMessageResp对象
        ChatMessageResp chatMessageResp = new ChatMessageResp();
        // 获取登录用户的信息
        User user = userService.getById(loginUserId);
        // 创建UserInfo对象
        ChatMessageResp.UserInfo userInfo = new ChatMessageResp.UserInfo();
        // 设置用户名、ID和头像
        userInfo.setUsername(user.getUserName());
        userInfo.setUid(user.getId());
        userInfo.setAvatar(user.getUserAvatar());
        // 和发送者信息
        chatMessageResp.setFromUser(userInfo);
        // 创建Message对象
        ChatMessageResp.Message message = new ChatMessageResp.Message();
        // 设置私信内容
        message.setContent(content);
        // 设置消息对象
        chatMessageResp.setMessage(message);

        return chatMessageResp;
    }


    public ChatMessageResp getMessageVo(Long loginUserId, Message messageEntity) {
        ChatMessageResp chatMessageResp = new ChatMessageResp();

        // 设置发送者信息
        User user = userService.getById(loginUserId);
        ChatMessageResp.UserInfo userInfo = new ChatMessageResp.UserInfo();
        userInfo.setUsername(user.getUserName());
        userInfo.setUid(user.getId());
        userInfo.setAvatar(user.getUserAvatar());
        chatMessageResp.setFromUser(userInfo);

        // 设置消息信息
        ChatMessageResp.Message message = new ChatMessageResp.Message();
        message.setContent(messageEntity.getContent());
        message.setType(messageEntity.getType());
        message.setId(messageEntity.getId());

        // ✅ 处理文件消息的 extra 字段
        if (messageEntity.getType() == 6 && messageEntity.getExtra() != null) {
            try {
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode extra = objectMapper.readTree(messageEntity.getExtra());

                FileInfo fileInfo = new FileInfo();
                fileInfo.setName(extra.get("fileName").asText());
                fileInfo.setUrl(extra.get("fileUrl").asText());
                if (extra.has("size")) {
                    fileInfo.setSize(extra.get("size").asLong());
                }
                if (extra.has("type")) {
                    fileInfo.setType(extra.get("type").asText());
                }

                extracted(message, fileInfo);
            } catch (Exception e) {
//                log.error("解析文件消息 extra 失败", e);
            }
        }

        chatMessageResp.setMessage(message);
        return chatMessageResp;
    }

    private static void extracted(ChatMessageResp.Message message, FileInfo fileInfo) {
        message.setFile(fileInfo); // 你需要确保 ChatMessageResp.Message 有这个字段和 setter
    }


    public WSBaseResp<ChatMessageResp> buildPrivateMessageResp(PrivateMessageDTO dto, Message messageEntity) {
        Long loginUserId = dto.getFromUserId();
        ChatMessageResp chatMessageResp = getMessageVo(loginUserId, messageEntity);

        Long toUserId = dto.getToUserId();
        long uid1 = Math.min(loginUserId, toUserId);
        long uid2 = Math.max(loginUserId, toUserId);
        RoomFriend roomFriend = roomFriendService.getOne(new LambdaQueryWrapper<RoomFriend>()
                .eq(RoomFriend::getUid1, uid1).eq(RoomFriend::getUid2, uid2));
        if (roomFriend != null) {
            chatMessageResp.setRoomId(roomFriend.getRoomId());
        }

        WSBaseResp<ChatMessageResp> wsBaseResp = new WSBaseResp<>();
        wsBaseResp.setData(chatMessageResp);
        wsBaseResp.setType(WSReqTypeEnum.CHAT.getType());
        return wsBaseResp;
    }

}
