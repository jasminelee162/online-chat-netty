package com.cong.wego.controller;

import com.cong.wego.model.enums.ws.WSReqTypeEnum;

import com.cong.wego.websocket.handler.SignalingSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chat")
public class VideoCallController {

    private final SignalingSocketHandler signalingSocketHandler;

    @Autowired
    public VideoCallController(SignalingSocketHandler signalingSocketHandler) {
        this.signalingSocketHandler = signalingSocketHandler;
    }

    @PostMapping("/video/call")
    public ResponseEntity<String> initiateVideoCall(@RequestParam String fromUserId, @RequestParam String toUserId) {
        // 构造信令消息
        SignalingSocketHandler.VideoSignalMessage message = new SignalingSocketHandler.VideoSignalMessage(fromUserId, toUserId, WSReqTypeEnum.VIDEO_CALL.name());
        // 使用 SignalingSocketHandler 发送信令
        signalingSocketHandler.sendSignalMessage(message);
        return ResponseEntity.ok("视频通话请求已发送");
    }
}
