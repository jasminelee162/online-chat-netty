package com.cong.wego.service.impl;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cong.wego.model.dto.ws.PrivateMessageDTO;
import com.cong.wego.model.entity.*;
import com.cong.wego.model.enums.chat.MessageTypeEnum;
import com.cong.wego.model.vo.ws.response.ChatMessageResp;
import com.cong.wego.model.vo.ws.response.WSBaseResp;
import com.cong.wego.service.*;
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
import org.springframework.util.DigestUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.context.ApplicationEventPublisher;

import java.util.*;

import static com.cong.wego.constant.SystemConstants.SALT;
import static com.cong.wego.constant.UserConstant.DEFAULT_AVATAR;

@Slf4j
@Service
@RequiredArgsConstructor
public class AIChatServiceImpl implements AIChatService {
    private final MessageService messageService;
    private final ZhipuConfig zhipuConfig; // 改为使用ZhipuConfig
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;
    private final WSAdapter wsAdapter;
    private final WebSocketServiceImpl webSocketService;
    private final RoomService roomService;
    private final UserService userService;

    private String callAIApi(List<Message> historyMessages, String currentMessage, User aiUser) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", zhipuConfig.getApiKey());
            
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", zhipuConfig.getModel());
            requestBody.put("messages", formatMessages(historyMessages, currentMessage, aiUser));
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

    private List<Map<String, String>> formatMessages(List<Message> historyMessages, String currentMessage, User aiUser) {
        List<Map<String, String>> messages = new ArrayList<>();
        
        // 添加AI性格设定
        Map<String, String> systemMessage = new HashMap<>();
        systemMessage.put("role", "system");
        systemMessage.put("content", "你现在是一个聊天对象，"+"你的名字是"+aiUser.getUserName()+"你的身份是"+ aiUser.getUserAccount()+"你的性格为"+aiUser.getUserProfile()
                +"，你是一个非常有个性的人，你会根据你的身份和性格来回复用户的消息，进行互动，请沉浸在这个身份和性格中，根据以往的聊天记录继续聊天。");
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
        // 获取历史对话
        List<Message> historyMessages = messageService.getRoomMessages(roomId, 10);


        // 调用AI接口获取回复
        String aiReply = callAIApi(historyMessages, content, aiUser);
        
        // 保存AI回复消息
        Message aiMessage = Message.builder()
                .fromUid(aiUser.getId())
                .content(aiReply)
                .roomId(roomId)
                .createTime(new Date())
                .updateTime(new Date())
                .build();

        messageService.save(aiMessage);

        // 构建私聊消息DTO
        PrivateMessageDTO privateMessageDTO = PrivateMessageDTO.builder()
                .content(aiReply)
                .fromUserId(aiUser.getId())
                .toUserId(fromUser.getId())
                .build();

        // 构建WebSocket响应并发送
        WSBaseResp<ChatMessageResp> baseResp = wsAdapter.buildPrivateMessageResp(privateMessageDTO);
        webSocketService.sendToUid(baseResp, fromUser.getId());

        Room room = Room.builder()
                .id(roomId)
                .lastMsgId(aiMessage.getId())
                .updateTime(aiMessage.getUpdateTime())
                .build();
        roomService.updateById(room);
        
        return aiMessage;
    }

    @Override
    public Long addAI(Long userId, String AIAccount, String AIName, String AIProfile) {
        String encryptPassword = DigestUtils.md5DigestAsHex((SALT + "AI").getBytes());
        User aiUser = User.builder()
               .userAccount(AIAccount)
                .userAvatar(DEFAULT_AVATAR)
                .userPassword(encryptPassword)
               .userName(AIName)
                .userRole("AI")
               .userProfile(AIProfile).build();
        userService.save(aiUser);
        Long aiId = aiUser.getId();
        Long roomId = roomService.addAIChatRoom(aiId, userId);
        return roomId;
    }
}