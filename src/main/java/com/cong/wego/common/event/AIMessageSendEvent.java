package com.cong.wego.common.event;

import com.cong.wego.model.entity.Message;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class AIMessageSendEvent extends ApplicationEvent {
    private final Message message;
    private final Long toUserId;
    private final Long roomId;

    public AIMessageSendEvent(Object source, Message message, Long toUserId, Long roomId) {
        super(source);
        this.message = message;
        this.toUserId = toUserId;
        this.roomId = roomId;
    }
}
