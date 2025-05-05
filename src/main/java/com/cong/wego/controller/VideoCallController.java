package com.cong.wego.controller;

import com.cong.wego.model.enums.ws.WSReqTypeEnum;

import com.cong.wego.websocket.handler.SignalingSocketHandler;
import lombok.Getter;
import lombok.Setter;
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
    public ResponseEntity<String> initiateVideoCall(@RequestBody VideoCallRequest request) {
        String fromUserId = request.getFromUserId();
        String toUserId = request.getToUserId();
        SignalingSocketHandler.VideoSignalMessage message = new SignalingSocketHandler.VideoSignalMessage(fromUserId, toUserId, WSReqTypeEnum.VIDEO_CALL.name());
        signalingSocketHandler.sendSignalMessage(message);
        return ResponseEntity.ok("{\"message\": \"视频通话请求已发送\"}");

    }

    @Getter
    @Setter
    static class VideoCallRequest {
        private String fromUserId;
        private String toUserId;
    }

}
