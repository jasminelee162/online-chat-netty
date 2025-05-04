package com.cong.wego;

import com.cong.wego.config.WxOpenConfig;
import javax.annotation.Resource;

import com.cong.wego.service.RoomService;
import com.cong.wego.service.impl.AIChatServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 主类测试
 *
 * # @author <a href="https://github.com/lhccong">程序员聪</a>
 */
@SpringBootTest
class ChatApplicationTests {

    @Resource
    private WxOpenConfig wxOpenConfig;

    @Autowired
    private RoomService roomService;

    @Autowired
    private AIChatServiceImpl aiChatService;

    @Test
    void contextLoads() {
        System.out.println(wxOpenConfig);
    }

    @Test
    void contextLoads2() {
        System.out.println(roomService.addRoom(1,"中南大学",null));
    }

    @Test
    void contextLoads3() {
        Long userId = 6L;
        System.out.println(aiChatService.addAI(userId,"总裁","欧浩辰","霸道、果断、深情"));
    }
}
