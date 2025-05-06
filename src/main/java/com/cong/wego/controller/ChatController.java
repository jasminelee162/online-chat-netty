package com.cong.wego.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cong.wego.common.BaseResponse;
import com.cong.wego.common.ResultUtils;
import com.cong.wego.model.dto.chat.MessageQueryRequest;
import com.cong.wego.model.dto.chat.RoomQueryRequest;
import com.cong.wego.model.dto.friend.FriendQueryRequest;
import com.cong.wego.model.vo.friend.AddFriendVo;
import com.cong.wego.model.vo.friend.FriendContentVo;
import com.cong.wego.model.vo.friend.FriendVo;
import com.cong.wego.model.vo.room.RoomVo;
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.service.MessageService;
import com.cong.wego.service.RoomService;
import com.cong.wego.service.impl.AIChatServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 聊天控制器
 *
 * @author cong
 * @date 2024/02/19
 */
@RestController
@RequestMapping("/chat")
@Slf4j
@RequiredArgsConstructor
@Api(value = "聊天")
public class ChatController {

    private final RoomService roomService;
    private final MessageService messageService;
    private final AIChatServiceImpl aIChatServiceImpl;

    @PostMapping("/list/page/vo")
    @ApiOperation(value = "分页获取用户房间会话列表")
    public BaseResponse<Page<RoomVo>> listRoomVoByPage(@RequestBody RoomQueryRequest roomQueryRequest) {
        Page<RoomVo> roomVoPage = roomService.listRoomVoByPage(roomQueryRequest);
        return ResultUtils.success(roomVoPage);
    }

    @PostMapping("/message/page/vo")
    @ApiOperation(value = "分页获取用户房间消息列表")
    public BaseResponse<Page<ChatMessageResp>> listMessageVoByPage(@RequestBody MessageQueryRequest messageQueryRequest) {
        Page<ChatMessageResp> messageVoPage = messageService.listMessageVoByPage(messageQueryRequest);
        return ResultUtils.success(messageVoPage);
    }

    @PostMapping("/friend/list/vo")
    @ApiOperation(value = "获取好友列表")
    public BaseResponse<List<FriendContentVo>> listFriendContentVo() {
        List<FriendContentVo> list = roomService.listFriendContentVo();
        return ResultUtils.success(list);
    }

    /*@PostMapping("/search/friend/vo")
    @ApiOperation(value = "获取群聊或者用户信息")
    public BaseResponse<List<AddFriendVo>> searchFriendVo(FriendQueryRequest friendQueryRequest) {
        return ResultUtils.success(roomService.searchFriendVo(friendQueryRequest));
    }*/

    @PostMapping("/search/friend/vo")
    @ApiOperation(value = "获取群聊或者用户信息")
    public BaseResponse<AddFriendVo> searchFriendVo(FriendQueryRequest friendQueryRequest) {
        return ResultUtils.success(roomService.searchFriendVo(friendQueryRequest));
    }

    @PostMapping("/room")
    @ApiOperation(value = "新建群聊房间")
    public BaseResponse<Long> addRoom(@RequestParam long fromUserID,
                                      @RequestParam String groupName,
                                      @RequestParam String groupAvatar) {
        return ResultUtils.success(roomService.addRoom(fromUserID, groupName, groupAvatar));
    }

    @PostMapping("/room/invite")
    @ApiOperation(value = "邀请用户加入群聊房间")
    public BaseResponse<Long> invite(@RequestParam long roomID,
                                     @RequestParam long fromUserID) {
        return ResultUtils.success(roomService.addFriend(roomID, fromUserID));
    }

    @GetMapping("/room/users")
    @ApiOperation(value = "获取未在群聊房间好友列表")
    public BaseResponse<List<FriendVo>> getUsersNotInGroup(@RequestParam long roomID,
                                                            @RequestParam long userID) {
        return ResultUtils.success(roomService.getUsersNotInGroup(roomID, userID));
    }
    /*
    * name是AI的名字
    * account是AI的身份
    * profile是AI的简介即性格
    * */
    @PostMapping("/AI")
    @ApiOperation(value = "新增AI")
    public BaseResponse<Long> AI(@RequestParam long userID,
                                   @RequestParam String name,
                                   @RequestParam String account,
                                   @RequestParam String profile) {
        return ResultUtils.success(aIChatServiceImpl.addAI(userID,account,name,profile));
    }
}
