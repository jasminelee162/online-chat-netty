package com.cong.wego.service;

import com.cong.wego.model.entity.Message;
import com.cong.wego.model.entity.User;

public interface AIChatService {
    /**
     * 处理AI聊天消息
     *
     * @param fromUser 发送消息的用户
     * @param aiUser AI用户
     * @param content 消息内容
     * @param roomId 房间ID
     * @return AI的回复消息
     */
    Message handleAIChat(User fromUser, User aiUser, String content, Long roomId);
}