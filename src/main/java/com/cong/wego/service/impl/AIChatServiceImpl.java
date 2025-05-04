package com.cong.wego.service.impl;

import com.cong.wego.model.dto.ws.PrivateMessageDTO;
import com.cong.wego.model.entity.Message;
import com.cong.wego.model.entity.User;
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.model.vo.ws.response.WSBaseResp;
import com.cong.wego.service.AIChatService;
import com.cong.wego.service.MessageService;
import com.cong.wego.config.ZhipuConfig;
import com.cong.wego.websocket.adapter.WSAdapter;
import com.cong.wego.websocket.service.WebSocketService;
import com.cong.wego.websocket.service.impl.WebSocketServiceImpl;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.cong.wego.common.event.AIMessageSendEvent;
import org.springframework.context.ApplicationEventPublisher;

import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class AIChatServiceImpl implements AIChatService {
    private final MessageService messageService;
    private final ZhipuConfig zhipuConfig; // 改为使用ZhipuConfig
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;
    private final ApplicationEventPublisher applicationEventPublisher; // 添加事件发布器
    private User aiUser;
    private final WSAdapter wsAdapter;
    private final WebSocketServiceImpl webSocketService;

    private String callAIApi(List<Message> historyMessages, String currentMessage, String aiProfile) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", zhipuConfig.getApiKey());
            
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", zhipuConfig.getModel());
            requestBody.put("messages", formatMessages(historyMessages, currentMessage, aiProfile));
            // 添加智谱API特有的参数
            requestBody.put("temperature", 0.7);
            requestBody.put("top_p", 0.7);
            requestBody.put("stream", false);

            log.debug("Request body: {}", objectMapper.writeValueAsString(requestBody));

            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
            
            ResponseEntity<Map> responseEntity = restTemplate.postForEntity(
                zhipuConfig.getUrl(), 
                request, 
                Map.class
            );
            
            Map<String, Object> response = responseEntity.getBody();
            if (response != null && response.containsKey("choices")) {
                List<Map<String, Object>> choices = (List<Map<String, Object>>) response.get("choices");
                if (!choices.isEmpty()) {
                    Map<String, Object> firstChoice = choices.get(0);
                    Map<String, Object> message = (Map<String, Object>) firstChoice.get("message");
                    if (message != null && message.containsKey("content")) {
                        return message.get("content").toString();
                    }
                }
            }
            
            return "对不起，我现在无法回复。";
            
        } catch (Exception e) {
            log.error("调用智谱API失败", e);
            return "对不起，发生了一些错误。";
        }
    }

    private List<Map<String, String>> formatMessages(List<Message> historyMessages, String currentMessage, String aiProfile) {
        List<Map<String, String>> messages = new ArrayList<>();
        
        // 添加AI性格设定
        Map<String, String> systemMessage = new HashMap<>();
        systemMessage.put("role", "system");
        systemMessage.put("content", "你现在是一个聊天对象，你的身份是"+aiProfile);
        messages.add(systemMessage);
        
        // 添加历史消息
        for (Message msg : historyMessages) {
            Map<String, String> messageMap = new HashMap<>();
            messageMap.put("role", msg.getFromUid().equals(aiUser.getId()) ? "assistant" : "user");
            messageMap.put("content", msg.getContent());
            messages.add(messageMap);
        }
        
        // 添加当前消息
        Map<String, String> userMessage = new HashMap<>();
        userMessage.put("role", "user");
        userMessage.put("content", currentMessage);
        messages.add(userMessage);
        
        return messages;
    }

    @Override
    public Message handleAIChat(User fromUser, User aiUser, String content, Long roomId) {
        this.aiUser = aiUser;
        // 1. 获取历史对话
        List<Message> historyMessages = messageService.getRoomMessages(roomId, 10);
        
        // 2. 构建AI请求
        String aiProfile = aiUser.getUserProfile(); // AI的性格设定

        // 3. 调用AI接口获取回复
        String aiReply = callAIApi(historyMessages, content, aiProfile);
        
        // 4. 保存AI回复消息
        Message aiMessage = Message.builder()
                .fromUid(aiUser.getId())
                .content(aiReply)
                .roomId(roomId)
                .createTime(new Date())
                .updateTime(new Date())
                .build();

        messageService.save(aiMessage);

        // 5. 构建私聊消息DTO
        PrivateMessageDTO privateMessageDTO = PrivateMessageDTO.builder()
                .content(aiReply)
                .fromUserId(aiUser.getId())
                .toUserId(fromUser.getId())
                .build();

        // 6. 构建WebSocket响应并发送
        WSBaseResp<ChatMessageResp> baseResp = wsAdapter.buildPrivateMessageResp(privateMessageDTO);
        webSocketService.sendToUid(baseResp, fromUser.getId());
        
        // 5. 发布消息发送事件，触发WebSocket推送
        applicationEventPublisher.publishEvent(new AIMessageSendEvent(
            this,
            aiMessage,
            fromUser.getId(),
            roomId
        ));
        
        return aiMessage;
    }
}