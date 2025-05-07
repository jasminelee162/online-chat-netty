package com.cong.wego.model.dto.ws;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 扩展的私信 DTO，包含 type 和 extra 字段
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class ExtendedPrivateMessageDTO extends PrivateMessageDTO {

    /**
     * 消息类型，如 text、file 等
     */
    private String type;

    /**
     * 扩展字段，例如文件名、文件大小等
     */
    private String extra;

    @Builder(builderMethodName = "extendedBuilder")
    public ExtendedPrivateMessageDTO(Long fromUserId, Long toUserId, String content, String type, String extra) {
        super(fromUserId, toUserId, content);
        this.type = type;
        this.extra = extra;
    }
}
