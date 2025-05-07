package com.cong.wego.model.vo.message;

import lombok.Data;

import java.util.Date;

/**
 * 聊天消息VO
 *
 * @author liuhuaicong
 * @date 2023/10/31
 */
@Data
public class ChatMessageVo {
    /**
     * 消息类型 1、群聊 2、私聊
     */
    private Integer type;
    private String content;
    private Date sendTime;
    private String toUid;
    private String extra;
    /**
     * 内容类型：
     * - text 文本
     * - file 文件
     * - image 图片（可拓展）
     */
    private String contentType;

    /**
     * 文件信息，仅当 contentType = file 时生效
     */
    private FileInfo file;

    // 无参构造函数
    public ChatMessageVo() {}

    // 文件消息构造函数
    public ChatMessageVo(String contentType, String content, String fileUrl) {
        this.contentType = contentType;
        this.content = content;
        if ("file".equals(contentType)) {
            this.file = new FileInfo(content, fileUrl);
        }
    }

    public ChatMessageVo(Integer type,String contentType, String content, String fileUrl) {
        this.type = type;
        this.contentType = contentType;
        this.content = content;
        if ("file".equals(contentType)) {
            this.file = new FileInfo(content, fileUrl);
        }
    }

    /**
     * 文件信息
     */
    @Data
    public static class FileInfo {
        /**
         * 文件名
         */
        private String name;

        /**
         * 文件访问 URL
         */
        private String url;

        /**
         * 文件大小（单位：字节）
         */
        private Long size;

        /**
         * 文件 MIME 类型，例如 application/pdf、image/png
         */
        private String type;

        // 文件信息构造函数
        public FileInfo(String name, String url) {
            this.name = name;
            this.url = url;
        }
        public FileInfo() {}
    }

}
