package com.cong.wego.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cong.wego.model.dto.chat.RoomQueryRequest;
import com.cong.wego.model.dto.friend.FriendQueryRequest;
import com.cong.wego.model.entity.Room;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cong.wego.model.vo.friend.AddFriendVo;
import com.cong.wego.model.vo.friend.FriendContentVo;
import com.cong.wego.model.vo.friend.FriendVo;
import com.cong.wego.model.vo.room.RoomVo;

import java.util.List;

/**
* @author 聪
* @description 针对表【room(房间表)】的数据库操作Service
* @createDate 2024-02-18 10:45:29
*/
public interface RoomService extends IService<Room> {

    /**
     * 按页面列出房间 VO
     *
     * @param roomQueryRequest 房间查询请求
     * @return {@link Page}<{@link RoomVo}>
     */
    Page<RoomVo> listRoomVoByPage(RoomQueryRequest roomQueryRequest);

    /**
     * 列出好友内容 vo
     *
     * @return {@link List}<{@link FriendContentVo}>
     */
    List<FriendContentVo> listFriendContentVo();

    /**
     * 搜索好友 vo
     *
     * @param friendQueryRequest 好友查询请求
     * @return {@link AddFriendVo}
     */
    List<AddFriendVo> searchFriendVo(FriendQueryRequest friendQueryRequest);

    Long addRoom(long fromUserID, String groupName, String groupAvatar);

    Long addFriend(long roomID, long userID);

    Long addAIChatRoom(Long AIId, Long userId);

    public List<FriendVo> getUsersNotInGroup(long roomID, long userID) ;
}
