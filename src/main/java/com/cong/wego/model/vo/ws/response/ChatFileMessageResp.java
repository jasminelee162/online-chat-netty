package com.cong.wego.model.vo.ws.response;

import com.cong.wego.model.vo.message.ChatMessageVo;  // 引用 ChatMessageVo.FileInfo
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatFileMessageResp {

    @ApiModelProperty("发送者信息")
    private ChatMessageResp.UserInfo fromUser;

    @ApiModelProperty("文件消息详情")
    private FileMessage fileMessage;

    @ApiModelProperty("房间id")
    private Long roomId;

    @Data
    public static class FileMessage {
        @ApiModelProperty("消息id")
        private Long id;

        @ApiModelProperty("发送时间")
        private Date sendTime;

        @ApiModelProperty("文件下载链接")
        private String fileUrl;

        @ApiModelProperty("文件名")
        private String fileName;

        @ApiModelProperty("文件大小（单位：字节）")
        private Long fileSize;

        @ApiModelProperty("消息类型 4表示文件类型消息")
        private Integer type = 4;
    }

    // 使用 ChatMessageVo.FileInfo 来统一类型
    private ChatMessageVo.FileInfo fileInfo;  // 统一使用 ChatMessageVo.FileInfo

}
