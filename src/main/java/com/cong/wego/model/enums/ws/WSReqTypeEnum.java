package com.cong.wego.model.enums.ws;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Description: ws前端请求类型枚举
 * @author cong
 * @date 2024/02/18
 */
@AllArgsConstructor
@Getter
public enum WSReqTypeEnum {
    LOGIN(1, "请求登录"),
    CHAT(2, "发送消息"),
    AUTHORIZE(3, "登录认证"),
    HEARTBEAT(4, "心跳包"),
    VIDEO_CALL(5, "视频通话请求"),
    VIDEO_ACCEPT(6, "接受视频通话"),
    VIDEO_REJECT(7, "拒绝视频通话"),
    VIDEO_SIGNAL(8, "WebRTC 信令交换");


    ;

    private final Integer type;
    private final String desc;

    private static final Map<Integer, WSReqTypeEnum> CACHE;

    static {
        CACHE = Arrays.stream(WSReqTypeEnum.values()).collect(Collectors.toMap(WSReqTypeEnum::getType, Function.identity()));
    }

    public static WSReqTypeEnum of(Integer type) {
        return CACHE.get(type);
    }
}
