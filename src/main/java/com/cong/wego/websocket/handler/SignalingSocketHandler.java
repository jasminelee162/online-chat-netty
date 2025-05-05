package com.cong.wego.websocket.handler;

import cn.hutool.core.collection.CollUtil;
import com.cong.wego.model.vo.ws.response.WSBaseResp;
import com.cong.wego.websocket.NettyWebSocketServer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.QueryStringDecoder;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.util.AttributeKey;
import lombok.Getter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class SignalingSocketHandler extends ChannelInboundHandlerAdapter {

    private static final Logger log = LoggerFactory.getLogger(SignalingSocketHandler.class);

    // 存储 WebSocket 会话，使用 userId 作为键
    private final Map<String, ChannelHandlerContext> sessions = new ConcurrentHashMap<>();
    // 假设 NettyWebSocketServer 中定义了 HTTP_REQUEST_KEY
    public static final AttributeKey<FullHttpRequest> HTTP_REQUEST_KEY = AttributeKey.valueOf("HTTP_REQUEST");


    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        if (evt instanceof WebSocketServerProtocolHandler.HandshakeComplete) {
            FullHttpRequest request = ctx.channel().attr(HTTP_REQUEST_KEY).get();
            if (request != null) {
                String uri = request.uri();
                QueryStringDecoder decoder = new QueryStringDecoder(uri);
                String userId = decoder.parameters().getOrDefault("userId", List.of()).stream().findFirst().orElse(null);

                if (userId != null) {
                    // 记录连接的 Channel ID
                    sessions.put(userId, ctx);
                    log.info("Client [{}] connected with Channel ID: {}", userId, ctx.channel().id().asLongText());
                } else {
                    ctx.close();
                    log.warn("Connection rejected: missing userId");
                }
            } else {
                ctx.close();
                log.warn("Connection rejected: missing HTTP request");
            }
        } else {
            super.userEventTriggered(ctx, evt);
        }
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        // 处理收到的消息（假设是 WebSocket 的 TextWebSocketFrame 类型消息）
        if (msg instanceof TextWebSocketFrame) {
            String payload = ((TextWebSocketFrame) msg).text();
            try {
                // 解析信令消息
                VideoSignalMessage signalMessage = parseMessage(payload);
                handleSignalMessage(signalMessage, ctx);
            } catch (IOException e) {
                log.error("Failed to parse message: {}", payload, e);
                // 可以发送错误反馈给前端
            }
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        // WebSocket 连接关闭时，移除该会话
        sessions.entrySet().removeIf(entry -> entry.getValue().equals(ctx));
        log.info("Client disconnected: {}", ctx.channel().id());
    }

    private void handleSignalMessage(VideoSignalMessage signalMessage, ChannelHandlerContext ctx) {
        String fromUserId = signalMessage.getFrom();
        String toUserId = signalMessage.getTo();
        String signalType = signalMessage.getType();

        ChannelHandlerContext targetCtx = sessions.get(toUserId);

        if (targetCtx != null && targetCtx.channel().isActive()) {
            if (WSReqTypeEnum.VIDEO_CALL.name().equals(signalType)) {
                // 转发视频呼叫请求
                forwardSignalMessage(signalMessage, targetCtx);
            } else if (WSReqTypeEnum.VIDEO_ACCEPT.name().equals(signalType) ||
                    WSReqTypeEnum.VIDEO_REJECT.name().equals(signalType)) {
                // 接受/拒绝视频通话请求
                forwardSignalMessage(signalMessage, sessions.get(fromUserId));
            } else {
                log.info("Unknown signal type: {}", signalType);
                // 可以发送错误反馈给前端
            }
        } else {
            log.info("Target user {} is not online.", toUserId);
            // 可以发送目标用户不在线的错误反馈给前端
        }
    }

    private void forwardSignalMessage(VideoSignalMessage message, ChannelHandlerContext targetCtx) {
        try {
            String jsonMessage = new ObjectMapper().writeValueAsString(message);
            targetCtx.writeAndFlush(new TextWebSocketFrame(jsonMessage));
            log.info("Forwarded signal message of type {} from {} to {}", message.getType(), message.getFrom(), message.getTo());
        } catch (IOException e) {
            log.error("Error forwarding signal message: {}", e.getMessage(), e);
            // 可以发送错误反馈给前端
        }
    }

    // 获取请求路径
    private String getUserIdFromContext(ChannelHandlerContext ctx) {
        FullHttpRequest req = ctx.channel().attr(HTTP_REQUEST_KEY).get();
        if (req != null) {
            QueryStringDecoder queryStringDecoder = new QueryStringDecoder(req.uri());
            List<String> userIdList = queryStringDecoder.parameters().get("userId");
            if (userIdList != null && !userIdList.isEmpty()) {
                return userIdList.get(0);
            }
        }
        return null;
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
                // 直接发送消息的JSON格式
                String jsonMessage = new ObjectMapper().writeValueAsString(message);
                targetCtx.writeAndFlush(new TextWebSocketFrame(jsonMessage));
                log.info("Sent signal message of type {} from {} to {}", message.getType(), message.getFrom(), toUserId);
            } catch (IOException e) {
                log.error("Error sending signal message: {}", e.getMessage(), e);
            }
        } else {
            log.info("Target user {} is not online.", toUserId);
            // 可以添加错误反馈到前端，通知用户目标用户不在线
        }
    }
}
