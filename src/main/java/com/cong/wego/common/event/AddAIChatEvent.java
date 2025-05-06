package com.cong.wego.common.event;

import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class AddAIChatEvent extends ApplicationEvent {
    private final Long aiId;
    private final Long userId;

    public AddAIChatEvent(Object source, Long aiId, Long userId) {
        super(source);
        this.aiId = aiId;
        this.userId = userId;
    }
}