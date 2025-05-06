package com.cong.wego.websocket.client;

import javax.websocket.*;
import java.net.URI;

@ClientEndpoint
public class VideoCallWebSocketClient {

    private Session session;

    public void connectToServer(String uri) throws Exception {
        WebSocketContainer container = ContainerProvider.getWebSocketContainer();
        container.connectToServer(this, new URI(uri));
    }

    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        System.out.println("Connected to server");
        sendMessage("{\"from\":\"user1\", \"to\":\"user2\", \"type\":\"VIDEO_CALL\"}");
    }

    @OnMessage
    public void onMessage(String message) {
        System.out.println("Received message: " + message);
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        System.out.println("Connection closed: " + reason.getReasonPhrase());
    }

    public void sendMessage(String message) {
        this.session.getAsyncRemote().sendText(message);
    }
}
