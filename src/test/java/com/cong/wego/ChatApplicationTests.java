package com.cong.wego;

import com.cong.wego.config.WxOpenConfig;
import javax.annotation.Resource;

import com.cong.wego.model.entity.RoomFriend;
import com.cong.wego.model.entity.User;
import com.cong.wego.model.vo.friend.AddFriendVo;
import com.cong.wego.service.RoomFriendService;
import com.cong.wego.service.RoomService;
import com.cong.wego.service.UserService;
import com.cong.wego.service.impl.AIChatServiceImpl;
import com.cong.wego.service.impl.RoomServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    @Autowired
    private UserService userService;

    @Autowired
    private RoomFriendService roomFriendService;

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

    @Test
    void contextLoads4() {
        //String name="小";
        //List<User> users = userService.getUsersByName(name);
        /*users.forEach(item -> {
            RoomFriend roomFriend1 = roomFriendService.getRoomFriend(item.getId());
            AddFriendVo addFriendVo1 = RoomServiceImpl.getAddFriendVo(item, roomFriend1);
            System.out.println(addFriendVo1);
        });*/
        Long userId = 1L;
        Long roomId = 9L;
        System.out.println(roomService.getUsersNotInGroup(roomId,userId));
    }
}
