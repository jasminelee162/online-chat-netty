package com.cong.wego.common.listener;

import com.cong.wego.common.event.AddAIChatEvent;
import com.cong.wego.service.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AddAIChatListener {
    
    private final RoomService roomService;

    @EventListener
    @Async
    public void handleAddAIChat(AddAIChatEvent event) {
        roomService.addAIChatRoom(event.getAiId(), event.getUserId());
    }
}