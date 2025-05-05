package com.cong.wego.websocket;

import com.cong.wego.websocket.handler.HttpHeadersHandler;
import com.cong.wego.websocket.handler.NettyWebSocketServerHandler;
import com.cong.wego.websocket.handler.SignalingSocketHandler;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.http.*;
import io.netty.handler.codec.http.cors.CorsConfig;
import io.netty.handler.codec.http.cors.CorsConfigBuilder;
import io.netty.handler.codec.http.cors.CorsHandler;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.stream.ChunkedWriteHandler;
import io.netty.handler.timeout.IdleStateHandler;
import io.netty.util.AttributeKey;
import io.netty.util.concurrent.Future;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Netty Web 套接字服务器
 *
 * @author liuhuaicong
 * @date 2023/10/27
 */
@Slf4j
@Configuration
public class NettyWebSocketServer {
    public static final int WEB_SOCKET_PORT = 8089;
    // 定义 AttributeKey 用于存储 HTTP 请求对象
    public static final AttributeKey<FullHttpRequest> HTTP_REQUEST_KEY = AttributeKey.valueOf("HTTP_REQUEST");
    private final EventLoopGroup bossGroup = new NioEventLoopGroup(1);
    private final EventLoopGroup workerGroup = new NioEventLoopGroup(8);
    private static final Map<String, ChannelHandlerContext> userChannelMap = new ConcurrentHashMap<>();

    /**
     * 启动 ws server
     *
     * @throws InterruptedException 中断异常
     */
    @PostConstruct
    public void start() throws InterruptedException {
        run();
    }

    /**
     * 销毁
     */
    @PreDestroy
    public void destroy() {
        Future<?> bossFuture = bossGroup.shutdownGracefully();
        Future<?> workerFuture = workerGroup.shutdownGracefully();
        try {
            bossFuture.sync();
            workerFuture.sync();
            log.info("关闭 ws server 成功");
        } catch (InterruptedException e) {
            log.error("关闭 ws server 时发生中断异常", e);
            Thread.currentThread().interrupt();
        }
    }

    /**
     * 启动
     *
     * @throws InterruptedException 中断异常
     */
    public void run() throws InterruptedException {
        // 服务器启动引导对象
        ServerBootstrap serverBootstrap = new ServerBootstrap();
        serverBootstrap.group(bossGroup, workerGroup)
                .channel(NioServerSocketChannel.class)
                .option(ChannelOption.SO_BACKLOG, 128)
                .option(ChannelOption.SO_KEEPALIVE, true)
                .handler(new LoggingHandler(LogLevel.INFO)) // 为 bossGroup 添加 日志处理器
                .childHandler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel socketChannel) throws Exception {
                        ChannelPipeline pipeline = socketChannel.pipeline();

                        // 添加 CORS 支持
                        CorsConfig corsConfig = CorsConfigBuilder.forAnyOrigin()
                                .allowNullOrigin()
                                .allowCredentials()
                                .allowedRequestHeaders("*")
                                .allowedRequestMethods(HttpMethod.GET, HttpMethod.POST)
                                .build();
                        pipeline.addLast(new CorsHandler(corsConfig));

                        // 30秒客户端没有向服务器发送心跳则关闭连接
                        pipeline.addLast(new IdleStateHandler(30, 0, 0));
                        // 因为使用http协议，所以需要使用http的编码器，解码器
                        pipeline.addLast(new HttpServerCodec());
                        // 以块方式写，添加 chunkedWriter 处理器 支持大数据流
                        pipeline.addLast(new ChunkedWriteHandler());
                        // 对http消息做聚合操作，产生两个对象 FullHttpRequest、FullHttpResponse
                        pipeline.addLast(new HttpObjectAggregator(8192));
                        // 存储 HTTP 请求对象到 Channel 的属性中
                        pipeline.addLast("httpRequestSaver", new ChannelInboundHandlerAdapter() {
                            @Override
                            public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
                                if (msg instanceof FullHttpRequest) {
                                    FullHttpRequest request = (FullHttpRequest) msg;
                                    // retain 引用计数 +1，避免 WebSocket 协议处理器释放它
                                    request.retain();
                                    ctx.channel().attr(NettyWebSocketServer.HTTP_REQUEST_KEY).set(request);
                                }
                                super.channelRead(ctx, msg);
                            }
                        });
                        // 保存用户ip
                        pipeline.addLast(new HttpHeadersHandler());
                        // websocket
                        pipeline.addLast(new WebSocketServerProtocolHandler("/"));
                        pipeline.addLast(new SignalingSocketHandler()); // 添加消息处理器
                        // 自定义handler ，处理业务逻辑
                        pipeline.addLast(new NettyWebSocketServerHandler());
                    }
                });
        // 启动服务器，监听端口，阻塞直到启动成功
        serverBootstrap.bind(WEB_SOCKET_PORT).sync();
        log.info("Netty启动成功");
    }
}