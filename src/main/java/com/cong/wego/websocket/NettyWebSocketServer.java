package com.cong.wego.websocket;

import com.cong.wego.websocket.handler.HttpHeadersHandler;
import com.cong.wego.websocket.handler.NettyWebSocketServerHandler;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import io.netty.handler.ssl.util.SelfSignedCertificate;
import io.netty.handler.stream.ChunkedWriteHandler;
import io.netty.handler.timeout.IdleStateHandler;
import io.netty.util.AttributeKey;
import io.netty.util.concurrent.Future;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.net.ssl.KeyManagerFactory;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.SecureRandom;

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

    // 创建线程池执行器
    private final EventLoopGroup bossGroup = new NioEventLoopGroup(1);
    private final EventLoopGroup workerGroup = new NioEventLoopGroup(8);

    /**
     * 启动 ws server
     *
     * @throws Exception 异常
     */
    @PostConstruct
    public void start() throws Exception {
        run();
    }

    /**
     * 销毁
     */
    @PreDestroy
    public void destroy() {
        Future<?> future = bossGroup.shutdownGracefully();
        Future<?> future1 = workerGroup.shutdownGracefully();
        future.syncUninterruptibly();
        future1.syncUninterruptibly();
        log.info("关闭 ws server 成功");
    }

    /**
     * 启动
     *
     * @throws Exception 异常
     */
    public void run() throws Exception {
        // 加载密钥库
        KeyStore ks = KeyStore.getInstance("JKS");
        try (InputStream ksInputStream = getClass().getClassLoader().getResourceAsStream("gornix.jks")) {
            if (ksInputStream == null) {
                throw new IllegalArgumentException("未找到 gornix.jks 文件");
            }
            ks.load(ksInputStream, "123456".toCharArray());
        }

        // 初始化 KeyManagerFactory
        KeyManagerFactory kmf = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
        kmf.init(ks, "654321".toCharArray());

        // 初始化 SSLContext
        SslContext sslContext = SslContextBuilder.forServer(kmf)
                .build();

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
                        // 添加 SSL 处理器
                        pipeline.addFirst(sslContext.newHandler(socketChannel.alloc()));
                        //30秒客户端没有向服务器发送心跳则关闭连接
                        pipeline.addLast(new IdleStateHandler(30, 0, 0));
                        // 因为使用http协议，所以需要使用http的编码器，解码器
                        pipeline.addLast(new HttpServerCodec());
                        // 以块方式写，添加 chunkedWriter 处理器 支持大数据流
                        pipeline.addLast(new ChunkedWriteHandler());
                        //对http消息做聚合操作，产生两个对象 FullHttpRequest、FullHttpResponse
                        pipeline.addLast(new HttpObjectAggregator(8192));
                        //保存用户ip
                        pipeline.addLast(new HttpHeadersHandler());
                        //websocket
                        pipeline.addLast(new WebSocketServerProtocolHandler("/"));
                        // 自定义handler ，处理业务逻辑
                        pipeline.addLast(new NettyWebSocketServerHandler());
                    }
                });
        // 启动服务器，监听端口，阻塞直到启动成功
        serverBootstrap.bind(WEB_SOCKET_PORT).sync();
        log.info("Netty启动成功");
    }
}