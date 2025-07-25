package com.cong.wego.service.impl;

import cn.hutool.core.collection.ListUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cong.wego.model.dto.chat.MessageQueryRequest;
import com.cong.wego.model.entity.Message;
import com.cong.wego.model.vo.message.ChatMessageVo;
import com.cong.wego.model.vo.ws.response.ChatFileMessageResp;  // 引用正确的类型
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.service.MessageService;
import com.cong.wego.mapper.MessageMapper;
import com.cong.wego.websocket.adapter.WSAdapter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 聪
 * @description 针对表【message(消息表)】的数据库操作Service实现
 * @createDate 2024-02-18 10:45:29
 */
@Service
@RequiredArgsConstructor
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

    private final WSAdapter wsAdapter;
    private final ObjectMapper objectMapper;

    @Override
    public Page<ChatMessageResp> listMessageVoByPage(MessageQueryRequest messageQueryRequest) {
        Long roomId = messageQueryRequest.getRoomId();

        // 获取当前页码
        int current = messageQueryRequest.getCurrent();
        // 获取每页大小
        int size = messageQueryRequest.getPageSize();
        if (roomId == null) {
            // 创建新的分页对象，用于存储转换后的消息对象
            Page<ChatMessageResp> messageVoPage = new Page<>(0, size, 0);
            // 将转换后的消息对象列表设置为新的分页对象的记录
            messageVoPage.setRecords(null);
            return messageVoPage;
        }
        // 创建分页对象
        Page<Message> messagePage = this.page(new Page<>(current, size),
                // 创建查询条件对象
                new LambdaQueryWrapper<Message>().eq(Message::getRoomId, roomId).orderByDesc(Message::getCreateTime));
        // 获取分页结果中的消息列表 翻转
        List<Message> messageList = ListUtil.reverse(messagePage.getRecords());
        // 将消息列表转换为ChatMessageResp对象列表
        List<ChatMessageResp> chatMessageRespList = messageList.stream().map(item ->
                        wsAdapter.getMessageVo(item.getFromUid(), item.getContent(), item.getCreateTime()))
                .collect(Collectors.toList());
        // 创建新的分页对象，用于存储转换后的消息对象
        Page<ChatMessageResp> messageVoPage = new Page<>(current, size, messagePage.getTotal());
        // 将转换后的消息对象列表设置为新的分页对象的记录
        messageVoPage.setRecords(chatMessageRespList);
        // 返回新的分页对象
        return messageVoPage;
    }

    @Override
    public boolean save(Message message) {
        // 自定义逻辑，或调用 MyBatis-Plus 提供的 save 方法
        return super.save(message);
    }

    /**
     * 获取分页的聊天消息（包括文本消息、文件消息等）
     * @param messageQueryRequest 查询条件
     * @return 分页结果
     */
    @Override
    public Page<ChatMessageResp> listTextMessageVoByPage(MessageQueryRequest messageQueryRequest) {
        Long roomId = messageQueryRequest.getRoomId();

        // 获取当前页码
        int current = messageQueryRequest.getCurrent();
        // 获取每页大小
        int size = messageQueryRequest.getPageSize();
        if (roomId == null) {
            // 创建新的分页对象，用于存储转换后的消息对象
            Page<ChatMessageResp> messageVoPage = new Page<>(0, size, 0);
            // 将转换后的消息对象列表设置为新的分页对象的记录
            messageVoPage.setRecords(null);
            return messageVoPage;
        }
        // 创建分页对象
        Page<Message> messagePage = this.page(new Page<>(current, size),
                // 创建查询条件对象
                new LambdaQueryWrapper<Message>().eq(Message::getRoomId, roomId).orderByDesc(Message::getCreateTime));
        // 获取分页结果中的消息列表 翻转
        List<Message> messageList = ListUtil.reverse(messagePage.getRecords());

        List<ChatMessageResp> chatMessageRespList = messageList.stream().map(item -> {
            // 获取 ChatMessageResp
            return wsAdapter.getMessageVo(item.getFromUid(), item);
//            return wsAdapter.getMessageVo(item.getFromUid(), item.getContent());
        }).collect(Collectors.toList());

        // 返回文本消息的分页数据
        Page<ChatMessageResp> messageVoPage = new Page<>(current, size, messagePage.getTotal());
        // 将转换后的消息对象列表设置为新的分页对象的记录
        messageVoPage.setRecords(chatMessageRespList);
        return messageVoPage;
    }

    /**
     * 获取分页的文件消息
     * @param messageQueryRequest 查询条件
     * @return 分页结果
     */
    @Override
    public Page<ChatFileMessageResp> listFileMessageVoByPage(MessageQueryRequest messageQueryRequest) {
        Long roomId = messageQueryRequest.getRoomId();
        int current = messageQueryRequest.getCurrent();
        int size = messageQueryRequest.getPageSize();

        if (roomId == null) {
            return new Page<>(0, size, 0);
        }

        // 获取分页信息
        Page<Message> messagePage = this.page(new Page<>(current, size),
                new LambdaQueryWrapper<Message>().eq(Message::getRoomId, roomId).orderByDesc(Message::getCreateTime));

        List<Message> messageList = ListUtil.reverse(messagePage.getRecords());

        List<ChatFileMessageResp> chatFileMessageRespList = messageList.stream()
                .filter(item -> item.getType() == 6) // 仅处理文件消息
                .map(item -> {
                    try {
                        String extraJson = (String) item.getExtra();
                        ChatMessageVo.FileInfo fileInfo = objectMapper.readValue(extraJson, ChatMessageVo.FileInfo.class);

                        // 创建 ChatFileMessageResp 并手动设置字段
                        ChatFileMessageResp fileResp = new ChatFileMessageResp();
                        ChatMessageResp resp = wsAdapter.getMessageVo(item.getFromUid(), item);
//                        ChatMessageResp resp = wsAdapter.getMessageVo(item.getFromUid(), item.getContent());
                        fileResp.setFromUser(resp.getFromUser());
                        fileResp.setRoomId(item.getRoomId());
                        fileResp.setFileInfo(fileInfo);

                        // 设置文件详细信息
                        ChatFileMessageResp.FileMessage fileMessage = new ChatFileMessageResp.FileMessage();
                        fileMessage.setFileName(fileInfo.getName());
                        fileMessage.setFileUrl(fileInfo.getUrl());
                        fileMessage.setFileSize(fileInfo.getSize());
                        fileResp.setFileMessage(fileMessage);

                        return fileResp;

                    } catch (Exception e) {
                        // 记录错误并跳过此文件消息
                        log.error("Error parsing file message", e);
                        return null;
                    }
                })
                .filter(item -> item != null) // 过滤掉返回 null 的消息
                .collect(Collectors.toList());

        // 返回文件消息的分页数据
        Page<ChatFileMessageResp> messageVoPage = new Page<>(current, size, messagePage.getTotal());
        messageVoPage.setRecords(chatFileMessageRespList);
        return messageVoPage;
    }

    @Override
    public List<Message> getRoomMessages(Long roomId, Integer limit) {
        return this.list(new LambdaQueryWrapper<Message>()
                .eq(Message::getRoomId, roomId)
                .orderByDesc(Message::getCreateTime)
                .last("LIMIT " + limit)
        );
    }
}




