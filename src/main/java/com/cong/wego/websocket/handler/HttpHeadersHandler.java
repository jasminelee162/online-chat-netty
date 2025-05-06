package com.cong.wego.websocket.handler;

import cn.hutool.core.net.url.UrlBuilder;
import com.cong.wego.websocket.utils.NettyUtil;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpHeaders;
import io.netty.handler.codec.http.QueryStringDecoder;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.InetSocketAddress;
import java.util.List;
import java.util.Optional;

/**
 * WebSocket 握手前处理器：统一处理 userId、token、IP
 */
public class HttpHeadersHandler extends ChannelInboundHandlerAdapter {

    private static final Logger log = LoggerFactory.getLogger(HttpHeadersHandler.class);

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof FullHttpRequest) {
            FullHttpRequest req = (FullHttpRequest) msg;
            String uri = req.uri(); // /ws?userId=123&token=abc
            QueryStringDecoder decoder = new QueryStringDecoder(uri);

            // 1. 获取 userId
            List<String> userIds = decoder.parameters().get("userId");
            if (userIds == null || userIds.isEmpty()) {
                log.warn("❌ Connection rejected: invalid or missing userId");
                ctx.close();
                return;
            }
            Long userId = Long.parseLong(userIds.get(0));
            NettyUtil.setAttr(ctx.channel(), NettyUtil.UID, userId);
            log.info("✅ 设置 userId={} 到 channel 属性", userId);

            // 2. 获取 token
            UrlBuilder urlBuilder = UrlBuilder.ofHttp(uri);
            String token = Optional.ofNullable(urlBuilder.getQuery())
                    .map(q -> q.get("token"))
                    .map(CharSequence::toString)
                    .orElse("");
            NettyUtil.setAttr(ctx.channel(), NettyUtil.TOKEN, token);
            log.info("✅ 设置 token={} 到 channel 属性", token);

            // 3. 获取 IP
            HttpHeaders headers = req.headers();
            String ip = headers.get("X-Real-IP");
            if (StringUtils.isEmpty(ip)) {
                InetSocketAddress address = (InetSocketAddress) ctx.channel().remoteAddress();
                ip = address.getAddress().getHostAddress();
            }
            NettyUtil.setAttr(ctx.channel(), NettyUtil.IP, ip);
            log.info("✅ 设置 ip={} 到 channel 属性", ip);

            // 移除自己，继续流程（例如交给 WebSocket 握手）
            ctx.pipeline().remove(this);
            ctx.fireChannelRead(req.retain());
        } else {
            ctx.fireChannelRead(msg);
        }
    }
}
