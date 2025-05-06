package com.cong.wego.model.vo.ws.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("视频通话请求参数")
public class VideoCallRequest {

    @ApiModelProperty("发起方用户ID")
    private String fromUserId;

    @ApiModelProperty("接收方用户ID")
    private String toUserId;
}
