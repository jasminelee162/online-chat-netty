package com.cong.wego.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cong.wego.manager.FriendSearchFacade;
import com.cong.wego.mapper.RoomMapper;
import com.cong.wego.model.dto.chat.RoomQueryRequest;
import com.cong.wego.model.dto.friend.FriendQueryRequest;
import com.cong.wego.model.entity.*;
import com.cong.wego.model.enums.chat.FriendSearchTypeEnum;
import com.cong.wego.model.enums.chat.FriendTargetTypeEnum;
import com.cong.wego.model.enums.chat.MessageTypeEnum;
import com.cong.wego.model.enums.chat.RoomTypeEnum;
import com.cong.wego.model.vo.friend.AddFriendVo;
import com.cong.wego.model.vo.friend.FriendContentVo;
import com.cong.wego.model.vo.friend.FriendVo;
import com.cong.wego.model.vo.room.RoomVo;
import com.cong.wego.service.*;
import com.cong.wego.utils.CommonUtils;
import lombok.RequiredArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author 聪
 * @description 针对表【room(房间表)】的数据库操作Service实现
 * @createDate 2024-02-18 10:45:29
 */
@Service
@RequiredArgsConstructor
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room>
        implements RoomService {

    private final UserRoomRelateService userRoomRelateService;
    private final MessageService messageService;
    private final RoomFriendService roomFriendService;
    private final UserService userService;
    private final RoomGroupService roomGroupService;
    private final UserFriendRelateService userFriendRelateService;
    private final FriendSearchFacade friendSearchFacade;

    @Resource
    private DrawAvatarService drawAvatarService;

    @Override
    public Page<RoomVo> listRoomVoByPage(RoomQueryRequest roomQueryRequest) {
        int size = roomQueryRequest.getPageSize();
        int current = roomQueryRequest.getCurrent();
        //当前登陆用户id
        User loginUser = userService.getLoginUser();
        Long loginUserId = loginUser.getId();
        //1、查询用户下的房间，后面可改为游标查询
        Page<UserRoomRelate> page = userRoomRelateService.page(new Page<>(current, size), new LambdaQueryWrapper<UserRoomRelate>().eq(UserRoomRelate::getUserId, loginUserId)
                .orderByDesc(UserRoomRelate::getUpdateTime));
        List<UserRoomRelate> userRoomRelateList = page.getRecords();
        //房间id集合
        Map<Long, RoomVo> roomVoMap = new HashMap<>();
        userRoomRelateList.forEach(item -> {
            Long roomId = item.getRoomId();
            RoomVo roomVo = new RoomVo();
            roomVo.setId(roomId);
            roomVoMap.put(roomId, roomVo);
        });

        //2、查询房间信息
        List<Room> roomList = this.listByIds(roomVoMap.keySet());
        for (Room item : roomList) {
            RoomVo roomVo = roomVoMap.get(item.getId());
            Long lastMsgId = item.getLastMsgId();
            //3、查询数据信息
            Message message = messageService.getById(lastMsgId);
            if (message != null) {
                roomVo.setContent(message.getContent());
            }
            roomVo.setActiveTime(item.getActiveTime());
            roomVo.setType(item.getType());

            //判断房间类型
            if (Objects.equals(item.getType(), RoomTypeEnum.GROUP.getType())) {
                //群聊
                RoomGroup roomGroup = roomGroupService.getOne(new LambdaQueryWrapper<RoomGroup>().eq(RoomGroup::getRoomId, item.getId()));
                roomVo.setAvatar(roomGroup.getAvatar());
                roomVo.setRoomName(roomGroup.getName());
                roomVo.setUserId(roomGroup.getOwnerId());
            } else {
                //4、查询私聊房间信息
                RoomFriend roomFriend = roomFriendService.getOne(new LambdaQueryWrapper<RoomFriend>().eq(RoomFriend::getRoomId, item.getId()));
                Long userId = Objects.equals(roomFriend.getUid1(), loginUserId) ? roomFriend.getUid2() : roomFriend.getUid1();
                //5、查询好友信息
                User user = userService.getById(userId);
                roomVo.setAvatar(user.getUserAvatar());
                roomVo.setRoomName(user.getUserName());
                roomVo.setUserId(userId);
            }

        }
        Page<RoomVo> roomVoPage = new Page<>(current, size, page.getTotal());
        List<RoomVo> roomVoList = new ArrayList<>(roomVoMap.values());
        roomVoPage.setRecords(roomVoList);
        return roomVoPage;
    }

    @Override
    public List<FriendContentVo> listFriendContentVo() {
        // 获取当前登录用户的ID
        Long loginUserId = Long.valueOf(StpUtil.getLoginId().toString());
        // 查询当前登录用户的所有好友关系
        List<UserFriendRelate> userFriendRelates = userFriendRelateService.list(new LambdaQueryWrapper<UserFriendRelate>().eq(UserFriendRelate::getUserId, loginUserId));

        List<FriendContentVo> friendContentVos = new ArrayList<>();
        Map<Integer, List<Long>> roomTypeMap = new HashMap<>();
        // 根据关系类型分组好友关系，以便后续处理
        for (UserFriendRelate userFriendRelate : userFriendRelates) {
            roomTypeMap.computeIfAbsent(userFriendRelate.getRelateType(), k -> new ArrayList<>()).add(userFriendRelate.getRelateId());
        }
        // 遍历分组后的关系类型，为每种关系类型调用搜索服务，将结果添加到返回列表中
        roomTypeMap.keySet().forEach(item -> {
            FriendContentVo friendContentVo = friendSearchFacade.searchAll(item, roomTypeMap.get(item));
            friendContentVos.add(friendContentVo);
        });
        return friendContentVos;

    }

/*    @Override
    public List<AddFriendVo> searchFriendVo(FriendQueryRequest friendQueryRequest) {

        List<AddFriendVo> addFriendVoList = new ArrayList<>();
        String id = friendQueryRequest.getId();
        // 判断ID是否为纯数字或以数字开头的字符串
        *//*if (!CommonUtils.isNumeric(id) && !CommonUtils.isNumericExceptLastS(id)) {
            return null;
        }*//*
        Long uid = Long.valueOf(id);
        User user = userService.getById(uid);
        if (user == null) {
            return null;
        }
        // 查询用户和房间的关系，以确定是否为好友
        RoomFriend roomFriend = roomFriendService.getRoomFriend(uid);
        AddFriendVo addFriendVo = getAddFriendVo(user, roomFriend);
        addFriendVoList.add(addFriendVo);
        List<User> users = userService.getUsersByName(id);
        users.forEach(item -> {
            RoomFriend roomFriend1 = roomFriendService.getRoomFriend(item.getId());
            AddFriendVo addFriendVo1 = getAddFriendVo(item, roomFriend1);
            addFriendVoList.add(addFriendVo1);
        });
        return addFriendVoList;
    }*/

    @Override
    public AddFriendVo searchFriendVo(FriendQueryRequest friendQueryRequest) {

        List<AddFriendVo> addFriendVoList = new ArrayList<>();
        String id = friendQueryRequest.getId();
        // 判断ID是否为纯数字或以数字开头的字符串
        /*if (!CommonUtils.isNumeric(id) && !CommonUtils.isNumericExceptLastS(id)) {
            return null;
        }*/
        Long uid = Long.valueOf(id);
        User user = userService.getById(uid);
        if (user == null) {
            return null;
        }
        // 查询用户和房间的关系，以确定是否为好友
        RoomFriend roomFriend = roomFriendService.getRoomFriend(uid);
        AddFriendVo addFriendVo = getAddFriendVo(user, roomFriend);
        addFriendVoList.add(addFriendVo);
        List<User> users = userService.getUsersByName(id);
        users.forEach(item -> {
            RoomFriend roomFriend1 = roomFriendService.getRoomFriend(item.getId());
            AddFriendVo addFriendVo1 = getAddFriendVo(item, roomFriend1);
            addFriendVoList.add(addFriendVo1);
        });
        return addFriendVoList.get(0);
    }

    @NotNull
    private static AddFriendVo getAddFriendVo(User user, RoomFriend roomFriend) {
        AddFriendVo addFriendVo = new AddFriendVo();
        addFriendVo.setAvatar(user.getUserAvatar()); // 设置用户头像
        addFriendVo.setUid(user.getId()); // 设置用户ID
        addFriendVo.setType(FriendSearchTypeEnum.FRIEND.getType()); // 设置查询类型为好友
        addFriendVo.setName(user.getUserName()); // 设置用户昵称
        if (roomFriend != null) {
            // 如果用户存在房间关系，则设置房间ID和好友目标类型
            addFriendVo.setRoomId(roomFriend.getRoomId());
            addFriendVo.setFriendTarget(FriendTargetTypeEnum.JOIN.getType());
        }
        return addFriendVo;
    }


    @Override
    public Long addRoom(long fromUserID, String groupName, String groupAvatar) {
        Room room = Room.builder().type(MessageTypeEnum.GROUP.getType()).build();
        this.save(room);
        RoomGroup roomGroup;
        if(groupAvatar == null || groupAvatar.isEmpty()){
            roomGroup = RoomGroup.builder().roomId(room.getId()).ownerId(fromUserID).name(groupName)
                    .avatar("data:image/png;base64,"+ drawAvatarService.generateImageBase64(groupName, 50)).build();
        }else{
            roomGroup = RoomGroup.builder().roomId(room.getId()).ownerId(fromUserID).name(groupName).avatar(groupAvatar).build();
        }
        roomGroupService.save(roomGroup);
        UserRoomRelate userRoomRelate = UserRoomRelate.builder().userId(fromUserID).roomId(room.getId()).build();
        userRoomRelateService.save(userRoomRelate);
        return room.getId();
    }

    @Override
    public Long addFriend(long roomID, long userID) {
        UserRoomRelate userRoomRelate = userRoomRelateService.getOne(new LambdaQueryWrapper<UserRoomRelate>()
               .eq(UserRoomRelate::getUserId, userID)
               .eq(UserRoomRelate::getRoomId, roomID));
        if (userRoomRelate == null) {
            userRoomRelate = UserRoomRelate.builder().userId(userID).roomId(roomID).build();
            userRoomRelateService.save(userRoomRelate);
            return userRoomRelate.getId();
        }
        return null;
    }

    @Override
    public Long addAIChatRoom(Long AIId, Long userId) {
        long uid1 = Math.min(AIId, userId);
        long uid2 = Math.max(AIId, userId);
        // 1、保存房间
        Room room = Room.builder().type(MessageTypeEnum.PRIVATE.getType()).build();
        this.save(room);
        // 2、保存私聊房间
        RoomFriend roomFriend = RoomFriend.builder().roomKey(uid1 + "_" + uid2).uid1(uid1).uid2(uid2).roomId(room.getId()).build();
        roomFriendService.save(roomFriend);
        //3.保存两个房间与用户关系
        ArrayList<UserRoomRelate> userRoomRelates = new ArrayList<>();
        UserRoomRelate userRoomRelate1 = UserRoomRelate.builder().userId(uid1).roomId(room.getId()).build();
        UserRoomRelate userRoomRelate2 = UserRoomRelate.builder().userId(uid2).roomId(room.getId()).build();
        userRoomRelates.add(userRoomRelate1);
        userRoomRelates.add(userRoomRelate2);
        userRoomRelateService.saveBatch(userRoomRelates);

        return room.getId();
    }

    @Override
    public List<FriendVo> getUsersNotInGroup(long roomID, long userID) {
        // 1. 获取该用户的所有好友关系
        List<UserFriendRelate> friendRelates = userFriendRelateService.list(
            new LambdaQueryWrapper<UserFriendRelate>()
                .eq(UserFriendRelate::getUserId, userID)
        );
        
        if (CollUtil.isEmpty(friendRelates)) {
            return new ArrayList<>();
        }
        
        // 2. 获取已在群聊中的用户ID列表
        List<Long> groupMemberIds = userRoomRelateService.list(
            new LambdaQueryWrapper<UserRoomRelate>()
                .eq(UserRoomRelate::getRoomId, roomID)
        ).stream().map(UserRoomRelate::getUserId).collect(Collectors.toList());
        
        // 3. 筛选出不在群聊中的好友ID
        List<Long> friendIds = friendRelates.stream()
            .map(UserFriendRelate::getRelateId)
            .filter(id -> !groupMemberIds.contains(id))
            .collect(Collectors.toList());
        
        if (CollUtil.isEmpty(friendIds)) {
            return new ArrayList<>();
        }
        
        // 4. 查询这些好友的用户信息
        List<User> users = userService.listByIds(friendIds);
        
        // 5. 转换为FriendVo列表
        return users.stream().map(user -> {
            FriendVo friendVo = new FriendVo();
            friendVo.setUid(user.getId());
            friendVo.setName(user.getUserName());
            friendVo.setAvatar(user.getUserAvatar());
            return friendVo;
        }).collect(Collectors.toList());
    }
}




