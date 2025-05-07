package com.cong.wego.websocket.utils;

import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshaker;
import io.netty.util.Attribute;
import io.netty.util.AttributeKey;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Description: Netty 工具类
 * 功能：封装属性设置、Channel 映射管理等
 *
 * @author cong
 * @date 2024/02/18
 */
@Slf4j
public class NettyUtil {

    private NettyUtil() {}

    public static final AttributeKey<String> TOKEN = AttributeKey.valueOf("token");
    public static final AttributeKey<String> IP = AttributeKey.valueOf("ip");
    public static final AttributeKey<Long> UID = AttributeKey.valueOf("uid");
    public static final AttributeKey<WebSocketServerHandshaker> HANDSHAKER_ATTR_KEY =
            AttributeKey.valueOf(WebSocketServerHandshaker.class, "HANDSHAKER");

    // UID 到 Channel 的映射
    private static final Map<Long, Channel> uidChannelMap = new ConcurrentHashMap<>();

    /** 设置通用属性 */
    public static <T> void setAttr(Channel channel, AttributeKey<T> attributeKey, T data) {
        Attribute<T> attr = channel.attr(attributeKey);
        attr.set(data);
    }

    /** 获取通用属性 */
    public static <T> T getAttr(Channel channel, AttributeKey<T> key) {
        return channel.attr(key).get();
    }

    /** 设置 UID 并注册 Channel */
    public static void bindUid(Channel channel, Long uid) {
        setAttr(channel, UID, uid);
        uidChannelMap.put(uid, channel);
        log.info("绑定 UID [{}] 与 Channel [{}]", uid, channel.id().asShortText());
    }

    /** 移除 UID → Channel 映射 */
    public static void unbindUid(Channel channel) {
        Long uid = getAttr(channel, UID);
        if (uid != null) {
            uidChannelMap.remove(uid);
            log.info("解绑 UID [{}] 与 Channel [{}]", uid, channel.id().asShortText());
        }
    }

    /** 根据 UID 获取 Channel */
    public static Channel getChannelByUid(Long uid) {
        return uidChannelMap.get(uid);
    }

    /** 获取 UID */
    public static Long getUid(Channel channel) {
        return getAttr(channel, UID);
    }

    /** 判断用户是否在线 */
    public static boolean isUidOnline(Long uid) {
        Channel channel = getChannelByUid(uid);
        return channel != null && channel.isActive();
    }


}
