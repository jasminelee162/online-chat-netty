package com.cong.wego.controller;

import com.cong.wego.model.enums.ws.WSReqTypeEnum;

import com.cong.wego.websocket.handler.NettyWebSocketServerHandler;
import com.cong.wego.websocket.handler.SignalingSocketHandler;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/chat")
public class VideoCallController {




    @PostMapping("/video/call")
    public ResponseEntity<Object> initiateVideoCall(@RequestBody VideoCallRequest request) {
        String fromUserId = request.getFromUserId();
        String toUserId = request.getToUserId();

        // ✅ 返回 Java 对象，让 Spring 自动转成 application/json
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("message", "视频通话请求已发送");
        return ResponseEntity.ok(responseMap);
    }

    @Getter
    @Setter
    static class VideoCallRequest {
        private String fromUserId;
        private String toUserId;
    }

}
