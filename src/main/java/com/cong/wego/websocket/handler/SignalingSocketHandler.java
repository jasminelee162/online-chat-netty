package com.cong.wego.websocket.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.ChannelPromise;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import lombok.Getter;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;
@Component
public class SignalingSocketHandler extends ChannelInboundHandlerAdapter {

    // 存储 WebSocket 会话，使用 userId 作为键
    private final Map<String, ChannelHandlerContext> sessions = new ConcurrentHashMap<>();

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        // 获取用户ID并将该会话添加到sessions中
        String userId = getUserIdFromContext(ctx);
        if (userId != null) {
            sessions.put(userId, ctx);
            System.out.println("Client [" + userId + "] connected");
        } else {
            ctx.close();
            System.out.println("Connection rejected: missing userId");
        }
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        // 处理收到的消息（假设是 WebSocket 的 TextWebSocketFrame 类型消息）
        if (msg instanceof TextWebSocketFrame) {
            String payload = ((TextWebSocketFrame) msg).text();
            VideoSignalMessage signalMessage = parseMessage(payload);
            String fromUserId = signalMessage.getFrom();
            String toUserId = signalMessage.getTo();
            String signalType = signalMessage.getType();

            // 查找目标用户的 ChannelHandlerContext
            ChannelHandlerContext targetCtx = sessions.get(toUserId);

            if (targetCtx != null && targetCtx.channel().isActive()) {
                // 根据信令类型进行不同的处理
                if (WSReqTypeEnum.VIDEO_CALL.name().equals(signalType)) {
                    // 发起视频通话请求，转发给接收方
                    targetCtx.writeAndFlush(new TextWebSocketFrame(payload));
                } else if (WSReqTypeEnum.VIDEO_ACCEPT.name().equals(signalType) ||
                        WSReqTypeEnum.VIDEO_REJECT.name().equals(signalType)) {
                    // 接受或拒绝视频通话请求，转发给发起方
                    ChannelHandlerContext senderCtx = sessions.get(fromUserId);
                    if (senderCtx != null && senderCtx.channel().isActive()) {
                        senderCtx.writeAndFlush(new TextWebSocketFrame(payload));
                    }
                } else {
                    // 其他类型的信令
                    System.out.println("Unknown signal type: " + signalType);
                }
            } else {
                System.out.println("Target user " + toUserId + " is not online.");
            }
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        // WebSocket 连接关闭时，移除该会话
        sessions.entrySet().removeIf(entry -> entry.getValue().equals(ctx));
        System.out.println("Client disconnected: " + ctx.channel().id());
    }

    // 从上下文中获取用户ID，这里假设通过某种方式获取用户ID
    private String getUserIdFromContext(ChannelHandlerContext ctx) {
        // 你可以根据实际情况从 ctx 或者消息中提取用户ID
        // 例如：从URI中提取参数、消息中提取等
        return null; // 假设用户ID从某种方式获得
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

    // 发送信令消息的方法
    public void sendSignalMessage(VideoSignalMessage message) {
        String toUserId = message.getTo();
        ChannelHandlerContext targetCtx = sessions.get(toUserId);

        if (targetCtx != null && targetCtx.channel().isActive()) {
            try {
                targetCtx.writeAndFlush(new TextWebSocketFrame(new ObjectMapper().writeValueAsString(message)));
            } catch (IOException e) {
                System.out.println("Error sending signal message: " + e.getMessage());
            }
        } else {
            System.out.println("Target user " + toUserId + " is not online.");
        }
    }
}
