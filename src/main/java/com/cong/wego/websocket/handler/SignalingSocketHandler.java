package com.cong.wego.websocket.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import lombok.Getter;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;

public class SignalingSocketHandler extends TextWebSocketHandler {

    // 存储 WebSocket 会话，使用 sessionId 作为键
    private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        // 建立 WebSocket 连接时将会话保存到 sessions
        sessions.put(session.getId(), session);
        System.out.println("Client connected: " + session.getId());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 模拟解析收到的信令消息 (解析发起方、接收方、信令类型)
        String payload = message.getPayload();
        VideoSignalMessage signalMessage = parseMessage(payload);
        String fromUserId = signalMessage.getFrom();
        String toUserId = signalMessage.getTo();
        String signalType = signalMessage.getType();

        // 查找目标用户的 WebSocket 会话
        WebSocketSession targetSession = sessions.get(toUserId);

        if (targetSession != null && targetSession.isOpen()) {
            // 根据信令类型进行不同的处理
            if (WSReqTypeEnum.VIDEO_CALL.name().equals(signalType)) {
                // 发起视频通话请求，转发给接收方
                targetSession.sendMessage(new TextMessage(payload));
            } else if (WSReqTypeEnum.VIDEO_ACCEPT.name().equals(signalType) ||
                    WSReqTypeEnum.VIDEO_REJECT.name().equals(signalType)) {
                // 接受或拒绝视频通话请求，转发给发起方
                WebSocketSession senderSession = sessions.get(fromUserId);
                if (senderSession != null && senderSession.isOpen()) {
                    senderSession.sendMessage(new TextMessage(payload));
                }
            } else {
                // 其他类型的信令
                System.out.println("Unknown signal type: " + signalType);
            }
        } else {
            System.out.println("Target user " + toUserId + " is not online.");
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        // WebSocket 连接关闭时，移除该会话
        sessions.remove(session.getId());
        System.out.println("Client disconnected: " + session.getId());
    }

    // 解析信令消息的方法
    private VideoSignalMessage parseMessage(String payload) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(payload, VideoSignalMessage.class);
    }

    // 视频信令消息类
    @Getter
    public static class VideoSignalMessage {
        private String from;
        private String to;
        private String type;

        public VideoSignalMessage(String from, String to, String type) {
            this.from = from;
            this.to = to;
            this.type = type;
        }
    }
}
