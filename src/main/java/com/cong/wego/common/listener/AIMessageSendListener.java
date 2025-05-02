package com.cong.wego.common.listener;

import com.cong.wego.common.event.AIMessageSendEvent;
import com.cong.wego.model.entity.Message;
import com.cong.wego.model.entity.Room;
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.model.vo.ws.response.WSBaseResp;
import com.cong.wego.service.RoomService;
import com.cong.wego.websocket.adapter.WSAdapter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AIMessageSendListener {
    private final RoomService roomService;


    @Async
    @EventListener(AIMessageSendEvent.class)
    public void handleMessageSendEvent(AIMessageSendEvent event) {
        // 通过WebSocket推送消息到客户端
       
        Long roomId = event.getRoomId();
        Message message = event.getMessage();
        Room room = Room.builder()
                .id(roomId)
                .lastMsgId(message.getId())
                .updateTime(message.getUpdateTime())
                .build();
        roomService.updateById(room);
    }
}
