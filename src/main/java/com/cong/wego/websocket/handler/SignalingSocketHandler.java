package com.cong.wego.websocket.handler;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.jwt.Claims;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import com.cong.wego.websocket.utils.NettyUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.netty.channel.*;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.QueryStringDecoder;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.security.SignatureException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import static com.cong.wego.websocket.NettyWebSocketServer.HTTP_REQUEST_KEY;

@Component
public class SignalingSocketHandler extends ChannelInboundHandlerAdapter {

    private static final Logger log = LoggerFactory.getLogger(SignalingSocketHandler.class);

    // 存储 WebSocket 会话，使用 userId 作为键
    private final Map<String, Channel> sessions = new ConcurrentHashMap<>();

    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        if (evt instanceof WebSocketServerProtocolHandler.HandshakeComplete) {
            FullHttpRequest request = ctx.channel().attr(HTTP_REQUEST_KEY).get();
            if (request != null) {
                String uri = request.uri();
                QueryStringDecoder decoder = new QueryStringDecoder(uri);

                String token = NettyUtil.getAttr(ctx.channel(), NettyUtil.TOKEN);
                String ip = NettyUtil.getAttr(ctx.channel(), NettyUtil.IP);

                // 检查 token 是否存在
                if (token == null || token.isEmpty()) {
                    ctx.close();
                    log.warn("Connection rejected: token missing");
                    return;
                }

                // 尝试从 token 解码或获取 userId
                Long userId = NettyUtil.getAttr(ctx.channel(), NettyUtil.UID);
                if (userId == null) {
                    // 如果没有从 channel 获取到 userId，则从 token 或 URI 中获取
                    List<String> userIdList = decoder.parameters().get("userId");

                }

                if (userId == null) {
                    log.warn("Connection rejected: invalid or missing userId");
                    ctx.close();
                    return;
                }

                // 将 session 存储到 sessions 中，使用 userId 作为 key
                sessions.put(userId.toString(), ctx.channel());
                log.info("User [{}] connected from IP: {}, channel: {}", userId, ip, ctx.channel().id().asShortText());
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
        if (msg instanceof TextWebSocketFrame) {
            String payload = ((TextWebSocketFrame) msg).text();
            try {
                VideoSignalMessage signalMessage = parseMessage(payload);
                handleSignalMessage(signalMessage, ctx);
            } catch (IOException e) {
                log.error("Failed to parse message: {}", payload, e);
            }
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        // 清除断开连接的客户端的会话信息
        sessions.entrySet().removeIf(entry -> entry.getValue().equals(ctx.channel()));
        log.info("Client disconnected: {}", ctx.channel().id().asShortText());
    }

    private void handleSignalMessage(VideoSignalMessage signalMessage, ChannelHandlerContext ctx) {
        String fromUserId = signalMessage.getFrom();
        String toUserId = signalMessage.getTo();
        String signalType = signalMessage.getType();

        Channel targetChannel = sessions.get(toUserId);

        if (targetChannel != null && targetChannel.isActive()) {
            if (WSReqTypeEnum.VIDEO_CALL.name().equals(signalType)) {
                forwardSignalMessage(signalMessage, targetChannel);
            } else if (WSReqTypeEnum.VIDEO_ACCEPT.name().equals(signalType)
                    || WSReqTypeEnum.VIDEO_REJECT.name().equals(signalType)) {
                Channel fromChannel = sessions.get(fromUserId);
                forwardSignalMessage(signalMessage, fromChannel);
            } else {
                log.warn("Unknown signal type: {}", signalType);
            }
        } else {
            log.info("Target user {} is not online.", toUserId);
        }
    }

    private void forwardSignalMessage(VideoSignalMessage message, Channel channel) {
        try {
            if (channel != null && channel.isActive()) {
                String jsonMessage = new ObjectMapper().writeValueAsString(message);
                channel.writeAndFlush(new TextWebSocketFrame(jsonMessage));
                log.info("Forwarded signal message: {} -> {}", message.getFrom(), message.getTo());
            }
        } catch (IOException e) {
            log.error("Error forwarding signal message: {}", e.getMessage(), e);
        }
    }

    private VideoSignalMessage parseMessage(String payload) throws IOException {
        return new ObjectMapper().readValue(payload, VideoSignalMessage.class);
    }

    @Getter
    @Setter
    @NoArgsConstructor
    public static class VideoSignalMessage {
        private String from;
        private String to;
        private String type;

        // 构造函数
        public VideoSignalMessage(String fromUserId, String toUserId, String type) {
            this.from = fromUserId;
            this.to = toUserId;
            this.type = type;
        }
    }

    // 用于发送信号消息的方法
    public void sendSignalMessage(VideoSignalMessage message) {
        Channel targetChannel = sessions.get(message.getTo());
        forwardSignalMessage(message, targetChannel);
    }
}
