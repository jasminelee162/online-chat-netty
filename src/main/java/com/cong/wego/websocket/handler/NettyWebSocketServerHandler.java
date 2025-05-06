package com.cong.wego.websocket.handler;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.json.JSONUtil;
import com.cong.wego.model.enums.ws.WSReqTypeEnum;
import com.cong.wego.model.vo.ws.request.WSBaseReq;
import com.cong.wego.websocket.service.WebSocketService;
import com.cong.wego.websocket.utils.NettyUtil;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.QueryStringDecoder;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;




/**
 * Netty Web 套接字服务器处理程序
 *
 * @author liuhuaicong
 * @date 2023/10/27
 */
@Slf4j
public class NettyWebSocketServerHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    // 当web客户端连接后，触发该方法
    @Override
    public void handlerAdded(ChannelHandlerContext ctx){
        getService().connect(ctx.channel());
    }

    // 客户端离线
    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) {
        userOffLine(ctx);
    }

    /**
     * 取消绑定
     *
     * @param ctx CTX系列
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        log.info("Channel inactive: {}", ctx.channel().id().asShortText());
        super.channelInactive(ctx);
    }

    /**
     * 用户离线
     *
     * @param ctx CTX系列
     */
    private void userOffLine(ChannelHandlerContext ctx) {
        getService().removed(ctx.channel());
        ctx.channel().close();
    }

    /**
     * 心跳检查
     *
     * @param ctx CTX系列
     * @param evt EVT
     * @throws Exception 例外
     */
    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        if (evt instanceof IdleStateEvent) {
            IdleStateEvent idleStateEvent = (IdleStateEvent) evt;
            // 读空闲
            if (idleStateEvent.state() == IdleState.READER_IDLE) {
                // 关闭用户的连接
                userOffLine(ctx);
            }
        }
        super.userEventTriggered(ctx, evt);
    }

    // 处理异常
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause){
        log.warn("异常发生，异常消息 ={}", cause.getMessage());
        ctx.channel().close();
    }
    private WebSocketService getService() {
        return SpringUtil.getBean(WebSocketService.class);
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) {
        WSBaseReq wsBaseReq = JSONUtil.toBean(msg.text(), WSBaseReq.class);
        WSReqTypeEnum wsReqTypeEnum = WSReqTypeEnum.of(wsBaseReq.getType());

        switch (wsReqTypeEnum) {
            case LOGIN:
                getService().handleLoginReq(ctx.channel());
                break;
            case HEARTBEAT:
                break;
            case CHAT:
                getService().sendMessage(ctx.channel(), wsBaseReq);
                break;

            case VIDEO_CALL:
            case  VIDEO_ACCEPT:
            case VIDEO_REJECT:
            case VIDEO_SIGNAL:
                getService().handleVideoSignal(ctx.channel(), wsBaseReq);
                break;
            default:
                log.warn("未知类型: {}", wsBaseReq.getType());
        }
    }


}