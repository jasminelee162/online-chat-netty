package com.cong.wego.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cong.wego.model.dto.chat.MessageQueryRequest;
import com.cong.wego.model.entity.Message;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cong.wego.model.vo.ws.response.ChatFileMessageResp;  // 使用正确的类型
import com.cong.wego.model.vo.ws.response.ChatMessageResp;  // 如果需要文本消息

import java.util.List;

/**
* @author 聪
* @description 针对表【message(消息表)】的数据库操作Service
* @createDate 2024-02-18 10:45:29
*/
public interface MessageService extends IService<Message> {

    /**
     * 按页面列出文本消息 VO
     *
     * @param messageQueryRequest 消息查询请求
     * @return {@link Page}<{@link ChatMessageResp}>
     */
    Page<ChatMessageResp> listTextMessageVoByPage(MessageQueryRequest messageQueryRequest);

    /**
     * 按页面列出文件消息 VO
     *
     * @param messageQueryRequest 消息查询请求
     * @return {@link Page}<{@link ChatFileMessageResp}>  // 返回文件消息类型
     */
    Page<ChatFileMessageResp> listFileMessageVoByPage(MessageQueryRequest messageQueryRequest);
    Page<ChatMessageResp> listMessageVoByPage(MessageQueryRequest messageQueryRequest);
    boolean save(Message message);

    /**
     * 获取房间最近的消息记录
     *
     * @param roomId 房间ID
     * @param limit 消息数量限制
     * @return 消息列表
     */
    List<Message> getRoomMessages(Long roomId, Integer limit);

}
