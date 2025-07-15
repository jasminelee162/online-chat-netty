/*
 Navicat Premium Dump SQL

 Source Server         : mypetstore
 Source Server Type    : MySQL
 Source Server Version : 80011 (8.0.11)
 Source Host           : localhost:3306
 Source Schema         : wego

 Target Server Type    : MySQL
 Target Server Version : 80011 (8.0.11)
 File Encoding         : 65001

 Date: 15/07/2025 19:26:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roomId` bigint(20) NOT NULL COMMENT '会话表id',
  `fromUid` bigint(20) NOT NULL COMMENT '消息发送者uid',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息内容',
  `replyMsgId` bigint(20) NULL DEFAULT NULL COMMENT '回复的消息内容',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '消息状态 0正常 1删除',
  `gapCount` int(11) NULL DEFAULT NULL COMMENT '与回复的消息间隔多少条',
  `type` int(11) NULL DEFAULT 1 COMMENT '消息类型 1正常文本 2.撤回消息 3.图片 4.语音 5.视频 6.文件',
  `extra` json NULL COMMENT '扩展信息',
  `createTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updateTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`createTime` ASC) USING BTREE,
  INDEX `idx_from_uid`(`fromUid` ASC) USING BTREE,
  INDEX `idx_room_id`(`roomId` ASC) USING BTREE,
  INDEX `idx_update_time`(`updateTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 2, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-02 11:11:35.709', '2025-05-02 11:11:35.709');
INSERT INTO `message` VALUES (2, 2, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-02 11:13:31.811', '2025-05-02 11:13:31.811');
INSERT INTO `message` VALUES (3, 2, 1, '厅', NULL, 0, NULL, 1, NULL, '2025-05-02 11:13:32.584', '2025-05-02 11:13:32.584');
INSERT INTO `message` VALUES (4, 2, 1, '不好', NULL, 0, NULL, 1, NULL, '2025-05-02 11:13:35.377', '2025-05-02 11:13:35.377');
INSERT INTO `message` VALUES (5, 2, 3, '好', NULL, 0, NULL, 1, NULL, '2025-05-02 11:13:39.779', '2025-05-02 11:13:39.779');
INSERT INTO `message` VALUES (6, 2, 3, '很好', NULL, 0, NULL, 1, NULL, '2025-05-02 11:13:42.697', '2025-05-02 11:13:42.697');
INSERT INTO `message` VALUES (7, 2, 1, 'sdf', NULL, 0, NULL, 1, NULL, '2025-05-03 13:18:38.013', '2025-05-03 13:18:38.013');
INSERT INTO `message` VALUES (8, 2, 1, 'nihao&nbsp;', NULL, 0, NULL, 1, NULL, '2025-05-03 16:18:55.098', '2025-05-03 16:18:55.098');
INSERT INTO `message` VALUES (9, 2, 1, '大抵是', NULL, 0, NULL, 1, NULL, '2025-05-03 23:23:47.510', '2025-05-03 23:23:47.510');
INSERT INTO `message` VALUES (10, 2, 1, '水电费', NULL, 0, NULL, 1, NULL, '2025-05-03 23:30:35.275', '2025-05-03 23:30:35.275');
INSERT INTO `message` VALUES (11, 2, 1, '[文件] 新建 文本文档.txt ()', NULL, 0, NULL, 1, NULL, '2025-05-04 01:23:29.789', '2025-05-04 01:23:29.789');
INSERT INTO `message` VALUES (12, 2, 1, '[文件] 新建 DOC 文档.doc ()', NULL, 0, NULL, 1, NULL, '2025-05-04 01:24:16.642', '2025-05-04 01:24:16.642');
INSERT INTO `message` VALUES (13, 2, 1, '基本', NULL, 0, NULL, 1, NULL, '2025-05-04 14:09:28.967', '2025-05-04 14:09:28.967');
INSERT INTO `message` VALUES (14, 2, 1, '水电费', NULL, 0, NULL, 1, NULL, '2025-05-04 15:22:14.241', '2025-05-04 15:22:14.241');
INSERT INTO `message` VALUES (15, 2, 1, '你好你是谁', NULL, 0, NULL, 1, NULL, '2025-05-04 15:22:22.028', '2025-05-04 15:22:22.028');
INSERT INTO `message` VALUES (16, 2, 1, '好谁', NULL, 0, NULL, 1, NULL, '2025-05-04 16:14:33.224', '2025-05-04 16:14:33.224');
INSERT INTO `message` VALUES (17, 3, 2, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-04 16:16:40.713', '2025-05-04 16:16:40.713');
INSERT INTO `message` VALUES (18, 3, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-04 16:16:48.434', '2025-05-04 16:16:48.434');
INSERT INTO `message` VALUES (19, 3, 2, '你好', NULL, 0, NULL, 1, NULL, '2025-05-04 16:18:19.946', '2025-05-04 16:18:19.946');
INSERT INTO `message` VALUES (20, 3, 2, '666', NULL, 0, NULL, 1, NULL, '2025-05-04 16:18:54.587', '2025-05-04 16:18:54.587');
INSERT INTO `message` VALUES (21, 3, 1, '你好', NULL, 0, NULL, 1, NULL, '2025-05-04 16:19:22.475', '2025-05-04 16:19:22.475');
INSERT INTO `message` VALUES (22, 3, 1, '999', NULL, 0, NULL, 1, NULL, '2025-05-04 16:19:38.838', '2025-05-04 16:19:38.838');
INSERT INTO `message` VALUES (23, 3, 2, '祝你好运', NULL, 0, NULL, 1, NULL, '2025-05-04 16:19:42.557', '2025-05-04 16:19:42.557');
INSERT INTO `message` VALUES (24, 3, 1, '不要', NULL, 0, NULL, 1, NULL, '2025-05-04 16:20:50.573', '2025-05-04 16:20:50.573');
INSERT INTO `message` VALUES (25, 3, 2, ' ', NULL, 0, NULL, 1, NULL, '2025-05-04 16:20:54.684', '2025-05-04 17:39:45.228');
INSERT INTO `message` VALUES (26, 3, 1, '234234234234', NULL, 0, NULL, 1, NULL, '2025-05-04 17:40:11.776', '2025-05-04 17:40:11.776');
INSERT INTO `message` VALUES (27, 3, 2, '5555555', NULL, 0, NULL, 1, NULL, '2025-05-04 17:41:17.350', '2025-05-04 17:41:17.350');
INSERT INTO `message` VALUES (28, 3, 2, '343434343', NULL, 0, NULL, 1, NULL, '2025-05-04 17:41:37.058', '2025-05-04 17:41:37.058');
INSERT INTO `message` VALUES (29, 3, 1, '4444', NULL, 0, NULL, 1, NULL, '2025-05-04 17:42:03.359', '2025-05-04 17:42:03.359');
INSERT INTO `message` VALUES (30, 3, 1, '我是1好', NULL, 0, NULL, 1, NULL, '2025-05-04 17:42:27.773', '2025-05-04 17:42:27.773');
INSERT INTO `message` VALUES (31, 3, 1, '你好吗', NULL, 0, NULL, 1, NULL, '2025-05-04 17:43:34.420', '2025-05-04 17:43:34.420');
INSERT INTO `message` VALUES (32, 3, 1, '我是edge', NULL, 0, NULL, 1, NULL, '2025-05-04 17:43:43.709', '2025-05-04 17:43:43.709');
INSERT INTO `message` VALUES (33, 3, 2, '你好吗我是你的dege', NULL, 0, NULL, 1, NULL, '2025-05-04 17:45:03.413', '2025-05-04 17:45:03.413');
INSERT INTO `message` VALUES (34, 3, 2, '亲你的', NULL, 0, NULL, 1, NULL, '2025-05-04 17:45:16.660', '2025-05-04 17:45:16.660');
INSERT INTO `message` VALUES (35, 3, 1, '23', NULL, 0, NULL, 1, NULL, '2025-05-04 17:48:24.402', '2025-05-04 17:48:24.402');
INSERT INTO `message` VALUES (36, 3, 2, '444', NULL, 0, NULL, 1, NULL, '2025-05-04 17:48:26.634', '2025-05-04 17:48:26.634');
INSERT INTO `message` VALUES (37, 3, 1, '你是谁', NULL, 0, NULL, 1, NULL, '2025-05-04 17:49:06.418', '2025-05-04 17:49:06.418');
INSERT INTO `message` VALUES (38, 3, 2, '肯定', NULL, 0, NULL, 1, NULL, '2025-05-04 17:49:10.848', '2025-05-04 17:49:10.848');
INSERT INTO `message` VALUES (39, 3, 2, '我是linux', NULL, 0, NULL, 1, NULL, '2025-05-04 17:52:56.607', '2025-05-04 17:52:56.607');
INSERT INTO `message` VALUES (40, 3, 1, '我是Windows', NULL, 0, NULL, 1, NULL, '2025-05-04 17:53:01.889', '2025-05-04 17:53:01.889');
INSERT INTO `message` VALUES (41, 3, 1, '<span style=\"font-size: 14.56px; white-space-collapse: preserve;\">我是Windows</span>', NULL, 0, NULL, 1, NULL, '2025-05-04 17:55:53.503', '2025-05-04 17:55:53.503');
INSERT INTO `message` VALUES (42, 3, 2, '我不是', NULL, 0, NULL, 1, NULL, '2025-05-04 17:56:00.296', '2025-05-04 17:56:00.296');
INSERT INTO `message` VALUES (43, 3, 2, '少少少', NULL, 0, NULL, 1, NULL, '2025-05-04 17:59:56.162', '2025-05-04 17:59:56.162');
INSERT INTO `message` VALUES (44, 3, 1, '多多', NULL, 0, NULL, 1, NULL, '2025-05-04 17:59:59.319', '2025-05-04 17:59:59.319');
INSERT INTO `message` VALUES (45, 3, 1, '嘻嘻', NULL, 0, NULL, 1, NULL, '2025-05-04 18:01:15.898', '2025-05-04 18:01:15.898');
INSERT INTO `message` VALUES (46, 3, 2, '1', NULL, 0, NULL, 1, NULL, '2025-05-04 18:55:41.165', '2025-05-04 18:55:41.165');
INSERT INTO `message` VALUES (47, 3, 1, '6', NULL, 0, NULL, 1, NULL, '2025-05-04 18:55:44.264', '2025-05-04 18:55:44.264');
INSERT INTO `message` VALUES (48, 3, 2, '999', NULL, 0, NULL, 1, NULL, '2025-05-04 18:57:12.918', '2025-05-04 18:57:12.918');
INSERT INTO `message` VALUES (49, 3, 2, '2', NULL, 0, NULL, 1, NULL, '2025-05-04 19:00:36.727', '2025-05-04 19:00:36.727');
INSERT INTO `message` VALUES (50, 3, 1, 'gggg', NULL, 0, NULL, 1, NULL, '2025-05-04 19:06:38.497', '2025-05-04 19:06:38.497');
INSERT INTO `message` VALUES (51, 3, 2, '22', NULL, 0, NULL, 1, NULL, '2025-05-04 19:08:54.781', '2025-05-04 19:08:54.781');
INSERT INTO `message` VALUES (52, 3, 1, '3', NULL, 0, NULL, 1, NULL, '2025-05-04 19:09:09.761', '2025-05-04 19:09:09.761');
INSERT INTO `message` VALUES (53, 3, 2, '33', NULL, 0, NULL, 1, NULL, '2025-05-04 19:09:12.347', '2025-05-04 19:09:12.347');
INSERT INTO `message` VALUES (54, 3, 1, '44', NULL, 0, NULL, 1, NULL, '2025-05-04 19:11:30.545', '2025-05-04 19:11:30.545');
INSERT INTO `message` VALUES (55, 3, 2, '44', NULL, 0, NULL, 1, NULL, '2025-05-04 19:22:00.402', '2025-05-04 19:22:00.402');
INSERT INTO `message` VALUES (56, 3, 2, '33', NULL, 0, NULL, 1, NULL, '2025-05-04 19:22:10.618', '2025-05-04 19:22:10.618');
INSERT INTO `message` VALUES (57, 3, 2, '2', NULL, 0, NULL, 1, NULL, '2025-05-04 19:23:39.070', '2025-05-04 19:23:39.070');
INSERT INTO `message` VALUES (58, 3, 1, '33', NULL, 0, NULL, 1, NULL, '2025-05-04 19:31:55.012', '2025-05-04 19:31:55.012');
INSERT INTO `message` VALUES (59, 3, 1, '55', NULL, 0, NULL, 1, NULL, '2025-05-04 19:54:00.461', '2025-05-04 19:54:00.461');
INSERT INTO `message` VALUES (60, 3, 2, '3', NULL, 0, NULL, 1, NULL, '2025-05-04 19:55:43.435', '2025-05-04 19:55:43.435');
INSERT INTO `message` VALUES (61, 3, 2, '2', NULL, 0, NULL, 1, NULL, '2025-05-04 20:12:05.233', '2025-05-04 20:12:05.233');
INSERT INTO `message` VALUES (62, 3, 2, '22', NULL, 0, NULL, 1, NULL, '2025-05-04 20:12:27.568', '2025-05-04 20:12:27.568');
INSERT INTO `message` VALUES (63, 3, 1, '33', NULL, 0, NULL, 1, NULL, '2025-05-04 20:12:34.121', '2025-05-04 20:12:34.121');
INSERT INTO `message` VALUES (64, 3, 2, '3', NULL, 0, NULL, 1, NULL, '2025-05-04 20:13:41.696', '2025-05-04 20:13:41.696');
INSERT INTO `message` VALUES (65, 3, 2, '4', NULL, 0, NULL, 1, NULL, '2025-05-04 20:13:43.434', '2025-05-04 20:13:43.434');
INSERT INTO `message` VALUES (66, 3, 2, '3', NULL, 0, NULL, 1, NULL, '2025-05-04 20:13:44.009', '2025-05-04 20:13:44.009');
INSERT INTO `message` VALUES (67, 3, 2, '2', NULL, 0, NULL, 1, NULL, '2025-05-04 20:13:44.439', '2025-05-04 20:13:44.439');
INSERT INTO `message` VALUES (68, 3, 1, '4', NULL, 0, NULL, 1, NULL, '2025-05-04 20:13:55.614', '2025-05-04 20:13:55.614');
INSERT INTO `message` VALUES (69, 3, 1, '3333', NULL, 0, NULL, 1, NULL, '2025-05-04 20:14:03.489', '2025-05-04 20:14:03.489');
INSERT INTO `message` VALUES (70, 3, 2, '2', NULL, 0, NULL, 1, NULL, '2025-05-04 20:17:54.564', '2025-05-04 20:17:54.564');
INSERT INTO `message` VALUES (71, 3, 2, '3', NULL, 0, NULL, 1, NULL, '2025-05-04 20:17:55.272', '2025-05-04 20:17:55.272');
INSERT INTO `message` VALUES (72, 3, 2, '1', NULL, 0, NULL, 1, NULL, '2025-05-04 20:17:55.742', '2025-05-04 20:17:55.742');
INSERT INTO `message` VALUES (73, 3, 2, 'rrr', NULL, 0, NULL, 1, NULL, '2025-05-04 20:33:50.668', '2025-05-04 20:33:50.668');
INSERT INTO `message` VALUES (74, 3, 2, 'q', NULL, 0, NULL, 1, NULL, '2025-05-04 20:38:24.850', '2025-05-04 20:38:24.850');
INSERT INTO `message` VALUES (75, 3, 2, 'w', NULL, 0, NULL, 1, NULL, '2025-05-04 20:38:53.762', '2025-05-04 20:38:53.762');
INSERT INTO `message` VALUES (76, 3, 2, '水电费<br><br>', NULL, 0, NULL, 1, NULL, '2025-05-04 21:31:50.270', '2025-05-04 21:31:50.270');
INSERT INTO `message` VALUES (77, 3, 2, 'sds', NULL, 0, NULL, 1, NULL, '2025-05-04 21:31:51.690', '2025-05-04 21:31:51.690');
INSERT INTO `message` VALUES (78, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 123456, \"type\": \"text/plain\", \"fileUrl\": \"http://example.com/file\", \"fileName\": \"example.txt\"}', '2025-05-04 21:31:51.690', '2025-05-04 21:49:49.298');
INSERT INTO `message` VALUES (79, 4, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-04 21:54:17.580', '2025-05-04 21:54:17.580');
INSERT INTO `message` VALUES (80, 4, 1, 'nihao&nbsp;', NULL, 0, NULL, 1, NULL, '2025-05-04 21:54:32.569', '2025-05-04 21:54:32.569');
INSERT INTO `message` VALUES (81, 4, 4, '你好', NULL, 0, NULL, 1, NULL, '2025-05-04 21:54:34.673', '2025-05-04 21:54:34.673');
INSERT INTO `message` VALUES (82, 4, 1, '越来越好', NULL, 0, NULL, 1, NULL, '2025-05-04 21:54:37.516', '2025-05-04 21:54:37.516');
INSERT INTO `message` VALUES (83, 4, 4, '怎么办', NULL, 0, NULL, 1, NULL, '2025-05-04 21:56:53.694', '2025-05-04 21:56:53.694');
INSERT INTO `message` VALUES (84, 4, 4, '要发文件', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:03.206', '2025-05-04 21:57:03.206');
INSERT INTO `message` VALUES (85, 4, 1, '不要发文件', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:04.291', '2025-05-04 21:57:04.291');
INSERT INTO `message` VALUES (86, 4, 4, '快点', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:08.883', '2025-05-04 21:57:08.883');
INSERT INTO `message` VALUES (87, 4, 1, '睡了', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:32.562', '2025-05-04 21:57:32.562');
INSERT INTO `message` VALUES (88, 4, 4, '不行', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:41.321', '2025-05-04 21:57:41.321');
INSERT INTO `message` VALUES (89, 4, 4, 'sh会表扬你的', NULL, 0, NULL, 1, NULL, '2025-05-04 21:57:44.810', '2025-05-04 22:01:04.332');
INSERT INTO `message` VALUES (90, 3, 2, '1', NULL, 0, NULL, 1, NULL, '2025-05-04 22:05:28.338', '2025-05-04 22:05:28.338');
INSERT INTO `message` VALUES (91, 3, 2, '33', NULL, 0, NULL, 1, NULL, '2025-05-04 22:05:43.884', '2025-05-04 22:05:43.884');
INSERT INTO `message` VALUES (92, 3, 1, '22', NULL, 0, NULL, 1, NULL, '2025-05-04 22:05:47.130', '2025-05-04 22:05:47.130');
INSERT INTO `message` VALUES (93, 4, 4, '恩', NULL, 0, NULL, 1, NULL, '2025-05-04 22:06:18.985', '2025-05-04 22:06:18.985');
INSERT INTO `message` VALUES (94, 3, 1, '4444', NULL, 0, NULL, 1, NULL, '2025-05-04 22:26:04.387', '2025-05-04 22:26:04.387');
INSERT INTO `message` VALUES (95, 4, 4, '恩', NULL, 0, NULL, 1, NULL, '2025-05-04 22:26:19.169', '2025-05-04 22:26:19.169');
INSERT INTO `message` VALUES (96, 4, 1, '垃圾', NULL, 0, NULL, 1, NULL, '2025-05-04 22:27:34.665', '2025-05-04 22:27:34.665');
INSERT INTO `message` VALUES (97, 3, 2, '333', NULL, 0, NULL, 1, NULL, '2025-05-05 01:46:42.197', '2025-05-05 01:46:42.197');
INSERT INTO `message` VALUES (98, 4, 1, '33', NULL, 0, NULL, 1, NULL, '2025-05-05 02:08:40.561', '2025-05-05 02:08:40.561');
INSERT INTO `message` VALUES (99, 3, 2, '早上好', NULL, 0, NULL, 1, NULL, '2025-05-05 10:11:09.028', '2025-05-05 10:11:09.028');
INSERT INTO `message` VALUES (100, 2, 1, 'dd', NULL, 0, NULL, 1, NULL, '2025-05-05 10:44:54.283', '2025-05-05 10:44:54.283');
INSERT INTO `message` VALUES (101, 0, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/2471e506-ef8c-44c6-ab7c-a3426f68543a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:17:13.316', '2025-05-05 12:17:13.316');
INSERT INTO `message` VALUES (102, 0, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/283cd4d9-e251-4d3b-804e-44f0b1920feb_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:23:36.784', '2025-05-05 12:23:36.784');
INSERT INTO `message` VALUES (103, 3, 2, '1', NULL, 0, NULL, 1, NULL, '2025-05-05 12:24:21.001', '2025-05-05 12:24:21.001');
INSERT INTO `message` VALUES (104, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/7107ab15-8d8a-47ea-9714-38e1eec6d55f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:25:40.436', '2025-05-05 12:25:40.436');
INSERT INTO `message` VALUES (105, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/f816058f-27fb-4bbd-8c18-9959af1f1c67_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:26:36.057', '2025-05-05 12:26:36.057');
INSERT INTO `message` VALUES (106, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/af964cbf-db94-47d7-83ef-81f2f64a5a28_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:34:07.324', '2025-05-05 12:34:07.324');
INSERT INTO `message` VALUES (107, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/d8d37c6d-3924-4f5a-a998-1a3dcf513695_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:35:54.932', '2025-05-05 12:35:54.932');
INSERT INTO `message` VALUES (108, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/2a0a3bd2-5870-45f1-9b6c-8b23b740ca99_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:40:02.738', '2025-05-05 12:40:02.738');
INSERT INTO `message` VALUES (109, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/9d6c5e21-1c88-45c7-b3da-6b3af47b2a88_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:43:25.312', '2025-05-05 12:43:25.312');
INSERT INTO `message` VALUES (110, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/457848a2-9d0a-42ec-92d4-79b6286895fa_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:51:12.167', '2025-05-05 12:51:12.167');
INSERT INTO `message` VALUES (111, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/f885c0f7-d819-40d8-adf9-7cdb2d34be20_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 12:57:37.418', '2025-05-05 12:57:37.418');
INSERT INTO `message` VALUES (112, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/35c04160-ff19-4f8b-9543-e47a7002fed9_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:01:04.882', '2025-05-05 13:01:04.882');
INSERT INTO `message` VALUES (113, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/3e8567a7-ddee-4c15-9d1b-5fae71025a23_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:05:06.661', '2025-05-05 13:05:06.661');
INSERT INTO `message` VALUES (114, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/af1ebbdd-c403-4235-960a-56a8ea52a075_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:06:59.377', '2025-05-05 13:06:59.377');
INSERT INTO `message` VALUES (115, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/34a9e646-191c-49f3-bf19-51bdf400244b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:10:23.726', '2025-05-05 13:10:23.726');
INSERT INTO `message` VALUES (116, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/3d84bad9-0432-4fc3-90b9-9e32ae750314_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:13:14.732', '2025-05-05 13:13:14.732');
INSERT INTO `message` VALUES (117, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 13:13:14.927', '2025-05-05 13:13:14.927');
INSERT INTO `message` VALUES (118, 2, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-05 13:17:52.316', '2025-05-05 13:17:52.316');
INSERT INTO `message` VALUES (119, 3, 2, '解决', NULL, 0, NULL, 1, NULL, '2025-05-05 13:18:24.870', '2025-05-05 13:18:24.870');
INSERT INTO `message` VALUES (120, 2, 1, '双方都', NULL, 0, NULL, 1, NULL, '2025-05-05 13:18:42.118', '2025-05-05 13:18:42.118');
INSERT INTO `message` VALUES (121, 2, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-05 13:18:46.039', '2025-05-05 13:18:46.039');
INSERT INTO `message` VALUES (122, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8089/api/file/download/2986ade7-2a8a-4e92-b15c-40af1b4f2f79_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 13:18:50.996', '2025-05-05 13:18:50.996');
INSERT INTO `message` VALUES (123, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 13:18:51.023', '2025-05-05 13:18:51.023');
INSERT INTO `message` VALUES (124, 2, 1, '[文件] 123.txt (http://192.168.1.100:8089/api/file/download/2986ade7-2a8a-4e92-b15c-40af1b4f2f79_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 13:18:51.034', '2025-05-05 13:18:51.034');
INSERT INTO `message` VALUES (125, 2, 3, '文件', NULL, 0, NULL, 1, NULL, '2025-05-05 13:21:45.989', '2025-05-05 13:21:45.989');
INSERT INTO `message` VALUES (126, 2, 3, 'niuhao', NULL, 0, NULL, 1, NULL, '2025-05-05 15:04:09.014', '2025-05-05 15:04:09.014');
INSERT INTO `message` VALUES (127, 2, 1, '水电费', NULL, 0, NULL, 1, NULL, '2025-05-05 15:04:48.652', '2025-05-05 15:04:48.652');
INSERT INTO `message` VALUES (128, 2, 3, '大招', NULL, 0, NULL, 1, NULL, '2025-05-05 15:18:32.257', '2025-05-05 15:18:32.257');
INSERT INTO `message` VALUES (129, 2, 1, '杀', NULL, 0, NULL, 1, NULL, '2025-05-05 15:21:49.600', '2025-05-05 15:21:49.600');
INSERT INTO `message` VALUES (130, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/00f25e94-152f-4f9c-844c-ce0e3e4b905f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 15:22:32.951', '2025-05-05 15:22:32.951');
INSERT INTO `message` VALUES (131, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 15:22:32.980', '2025-05-05 15:22:32.980');
INSERT INTO `message` VALUES (132, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/00f25e94-152f-4f9c-844c-ce0e3e4b905f_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 15:22:32.995', '2025-05-05 15:22:32.995');
INSERT INTO `message` VALUES (133, 2, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-05 16:15:44.451', '2025-05-05 16:15:44.451');
INSERT INTO `message` VALUES (134, 2, 3, '不存在', NULL, 0, NULL, 1, NULL, '2025-05-05 16:16:10.846', '2025-05-05 16:16:10.846');
INSERT INTO `message` VALUES (135, 3, 1, '1', NULL, 0, NULL, 1, NULL, '2025-05-05 16:20:33.268', '2025-05-05 16:20:33.268');
INSERT INTO `message` VALUES (136, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-05 16:27:32.923', '2025-05-05 16:27:32.923');
INSERT INTO `message` VALUES (137, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/ac4d81d8-ebf4-4c79-b929-33e635bb6bd9_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:27:38.770', '2025-05-05 16:27:38.770');
INSERT INTO `message` VALUES (138, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:27:38.794', '2025-05-05 16:27:38.794');
INSERT INTO `message` VALUES (139, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/ac4d81d8-ebf4-4c79-b929-33e635bb6bd9_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:27:38.804', '2025-05-05 16:27:38.804');
INSERT INTO `message` VALUES (140, 3, 2, '99', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:38.673', '2025-05-05 16:29:38.673');
INSERT INTO `message` VALUES (141, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/a63e349f-b86f-4ad4-a9c3-6a3df8a90908_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:29:44.061', '2025-05-05 16:29:44.061');
INSERT INTO `message` VALUES (142, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:44.094', '2025-05-05 16:29:44.094');
INSERT INTO `message` VALUES (143, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/a63e349f-b86f-4ad4-a9c3-6a3df8a90908_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:44.110', '2025-05-05 16:29:44.110');
INSERT INTO `message` VALUES (144, 2, 3, '怎么样了', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:44.731', '2025-05-05 16:29:44.731');
INSERT INTO `message` VALUES (145, 2, 3, '为什么发布了', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:54.523', '2025-05-05 16:29:54.523');
INSERT INTO `message` VALUES (146, 2, 3, '我i递交', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:56.701', '2025-05-05 16:29:56.701');
INSERT INTO `message` VALUES (147, 2, 3, '我', NULL, 0, NULL, 1, NULL, '2025-05-05 16:29:59.238', '2025-05-05 16:29:59.238');
INSERT INTO `message` VALUES (148, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/9d85c1c2-7465-4e9f-9055-b2b6bbd652db_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:33:00.962', '2025-05-05 16:33:00.962');
INSERT INTO `message` VALUES (149, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:33:00.983', '2025-05-05 16:33:00.983');
INSERT INTO `message` VALUES (150, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/9d85c1c2-7465-4e9f-9055-b2b6bbd652db_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:33:00.995', '2025-05-05 16:33:00.995');
INSERT INTO `message` VALUES (151, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/d0f11fdd-556f-4ce3-9b44-15c8c01a3595_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:33:15.141', '2025-05-05 16:33:15.141');
INSERT INTO `message` VALUES (152, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:33:15.181', '2025-05-05 16:33:15.181');
INSERT INTO `message` VALUES (153, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/d0f11fdd-556f-4ce3-9b44-15c8c01a3595_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:33:15.191', '2025-05-05 16:33:15.191');
INSERT INTO `message` VALUES (154, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/656a8db6-b51d-4333-94ff-1e80d9f82f66_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:34:47.328', '2025-05-05 16:34:47.328');
INSERT INTO `message` VALUES (155, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:34:47.348', '2025-05-05 16:34:47.348');
INSERT INTO `message` VALUES (156, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/656a8db6-b51d-4333-94ff-1e80d9f82f66_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:34:47.358', '2025-05-05 16:34:47.358');
INSERT INTO `message` VALUES (157, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/3a37f0dc-26a1-4916-a3de-da5807effe7a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:35:33.693', '2025-05-05 16:35:33.693');
INSERT INTO `message` VALUES (158, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:35:33.773', '2025-05-05 16:35:33.773');
INSERT INTO `message` VALUES (159, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/3a37f0dc-26a1-4916-a3de-da5807effe7a_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:35:33.782', '2025-05-05 16:35:33.782');
INSERT INTO `message` VALUES (160, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/f7b9d3b2-0168-4016-b08d-f5bdd8ee41a0_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:35:45.198', '2025-05-05 16:35:45.198');
INSERT INTO `message` VALUES (161, 2, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:35:45.236', '2025-05-05 16:35:45.236');
INSERT INTO `message` VALUES (162, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/f7b9d3b2-0168-4016-b08d-f5bdd8ee41a0_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:35:45.251', '2025-05-05 16:35:45.251');
INSERT INTO `message` VALUES (163, 3, 2, '33', NULL, 0, NULL, 1, NULL, '2025-05-05 16:37:48.238', '2025-05-05 16:37:48.238');
INSERT INTO `message` VALUES (164, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/33b35e59-62bd-47af-848e-aaa2ea321aa1_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:37:55.306', '2025-05-05 16:37:55.306');
INSERT INTO `message` VALUES (165, 3, 1, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:37:55.337', '2025-05-05 16:37:55.337');
INSERT INTO `message` VALUES (166, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/33b35e59-62bd-47af-848e-aaa2ea321aa1_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:37:55.348', '2025-05-05 16:37:55.348');
INSERT INTO `message` VALUES (167, 3, 1, 'ss', NULL, 0, NULL, 1, NULL, '2025-05-05 16:38:06.591', '2025-05-05 16:38:06.591');
INSERT INTO `message` VALUES (168, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-05 16:39:57.653', '2025-05-05 16:39:57.653');
INSERT INTO `message` VALUES (169, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/c3c6e9bb-7e52-48b6-9583-056443e8280a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:40:10.348', '2025-05-05 16:40:10.348');
INSERT INTO `message` VALUES (170, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:40:10.424', '2025-05-05 16:40:10.424');
INSERT INTO `message` VALUES (171, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/c3c6e9bb-7e52-48b6-9583-056443e8280a_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:40:10.436', '2025-05-05 16:40:10.436');
INSERT INTO `message` VALUES (172, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-05 16:48:07.417', '2025-05-05 16:48:07.417');
INSERT INTO `message` VALUES (173, 3, 2, '[文件] 123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/f3622a00-f683-4ac4-ae06-03bee12ce1b6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:48:13.476', '2025-05-05 16:48:13.476');
INSERT INTO `message` VALUES (174, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:48:13.502', '2025-05-05 16:48:13.502');
INSERT INTO `message` VALUES (175, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/f3622a00-f683-4ac4-ae06-03bee12ce1b6_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:48:13.512', '2025-05-05 16:48:13.512');
INSERT INTO `message` VALUES (176, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/892ab35d-a276-4de7-9886-07cbde09e7b9_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 16:56:50.415', '2025-05-05 16:56:50.415');
INSERT INTO `message` VALUES (177, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 16:56:50.453', '2025-05-05 16:56:50.453');
INSERT INTO `message` VALUES (178, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/892ab35d-a276-4de7-9886-07cbde09e7b9_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 16:56:50.472', '2025-05-05 16:56:50.472');
INSERT INTO `message` VALUES (179, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/54a364a3-00d4-471e-b6ad-1013c307d17c_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:17:54.599', '2025-05-05 17:17:54.599');
INSERT INTO `message` VALUES (180, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/079a9ca5-6f0d-4e41-b801-3565f0131e22_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:19:37.878', '2025-05-05 17:19:37.878');
INSERT INTO `message` VALUES (181, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:19:38.010', '2025-05-05 17:19:38.010');
INSERT INTO `message` VALUES (182, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/079a9ca5-6f0d-4e41-b801-3565f0131e22_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:19:38.028', '2025-05-05 17:19:38.028');
INSERT INTO `message` VALUES (183, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/77f84b15-392e-4f9b-b73f-fff12ae9be36_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:24:57.248', '2025-05-05 17:24:57.248');
INSERT INTO `message` VALUES (184, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:24:57.294', '2025-05-05 17:24:57.294');
INSERT INTO `message` VALUES (185, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/77f84b15-392e-4f9b-b73f-fff12ae9be36_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:24:57.314', '2025-05-05 17:24:57.314');
INSERT INTO `message` VALUES (186, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/3f64df7d-b9b1-4baa-8f74-708ac44c5ea9_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:40:30.307', '2025-05-05 17:40:30.307');
INSERT INTO `message` VALUES (187, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:40:30.339', '2025-05-05 17:40:30.339');
INSERT INTO `message` VALUES (188, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/3f64df7d-b9b1-4baa-8f74-708ac44c5ea9_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:40:30.353', '2025-05-05 17:40:30.353');
INSERT INTO `message` VALUES (189, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/d45ac9b1-9007-404c-b004-5976ebb8a576_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:41:58.472', '2025-05-05 17:41:58.472');
INSERT INTO `message` VALUES (190, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:41:58.491', '2025-05-05 17:41:58.491');
INSERT INTO `message` VALUES (191, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/d45ac9b1-9007-404c-b004-5976ebb8a576_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:41:58.503', '2025-05-05 17:41:58.503');
INSERT INTO `message` VALUES (192, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/18523961-9495-46a9-b678-64145896a863_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:43:35.554', '2025-05-05 17:43:35.554');
INSERT INTO `message` VALUES (193, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:43:35.599', '2025-05-05 17:43:35.599');
INSERT INTO `message` VALUES (194, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/18523961-9495-46a9-b678-64145896a863_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:43:35.613', '2025-05-05 17:43:35.613');
INSERT INTO `message` VALUES (195, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/895e82a3-6a6c-47a1-85df-0eb7290b0e37_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:44:47.651', '2025-05-05 17:44:47.651');
INSERT INTO `message` VALUES (196, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:44:47.706', '2025-05-05 17:44:47.706');
INSERT INTO `message` VALUES (197, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/895e82a3-6a6c-47a1-85df-0eb7290b0e37_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:44:47.719', '2025-05-05 17:44:47.719');
INSERT INTO `message` VALUES (198, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/88c126e0-af82-43bb-b84a-d6fdf24ec03e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:46:24.043', '2025-05-05 17:46:24.043');
INSERT INTO `message` VALUES (199, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:46:24.056', '2025-05-05 17:46:24.056');
INSERT INTO `message` VALUES (200, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/88c126e0-af82-43bb-b84a-d6fdf24ec03e_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:46:24.137', '2025-05-05 17:46:24.137');
INSERT INTO `message` VALUES (201, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/1ee04205-a324-48f3-b7d2-4aa6354bf2d1_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:48:34.382', '2025-05-05 17:48:34.382');
INSERT INTO `message` VALUES (202, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:48:34.415', '2025-05-05 17:48:34.415');
INSERT INTO `message` VALUES (203, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/1ee04205-a324-48f3-b7d2-4aa6354bf2d1_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:48:34.427', '2025-05-05 17:48:34.427');
INSERT INTO `message` VALUES (204, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/47e41bb6-62e6-47cb-b18d-e7d53a5dba11_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:51:02.667', '2025-05-05 17:51:02.667');
INSERT INTO `message` VALUES (205, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:51:02.708', '2025-05-05 17:51:02.708');
INSERT INTO `message` VALUES (206, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/47e41bb6-62e6-47cb-b18d-e7d53a5dba11_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:51:02.721', '2025-05-05 17:51:02.721');
INSERT INTO `message` VALUES (207, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/64c82344-54ab-443f-b353-cfd430a7bf73_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:52:57.612', '2025-05-05 17:52:57.612');
INSERT INTO `message` VALUES (208, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:52:57.623', '2025-05-05 17:52:57.623');
INSERT INTO `message` VALUES (209, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/64c82344-54ab-443f-b353-cfd430a7bf73_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:52:57.633', '2025-05-05 17:52:57.633');
INSERT INTO `message` VALUES (210, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/5d2fd5c9-a9e0-446f-ae0f-18bc68b0f956_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:53:41.912', '2025-05-05 17:53:41.912');
INSERT INTO `message` VALUES (211, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:53:41.935', '2025-05-05 17:53:41.935');
INSERT INTO `message` VALUES (212, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/5d2fd5c9-a9e0-446f-ae0f-18bc68b0f956_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:53:41.951', '2025-05-05 17:53:41.951');
INSERT INTO `message` VALUES (213, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/d03fff24-e722-486d-832e-15879e18d08e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:56:06.551', '2025-05-05 17:56:06.551');
INSERT INTO `message` VALUES (214, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:56:06.563', '2025-05-05 17:56:06.563');
INSERT INTO `message` VALUES (215, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/d03fff24-e722-486d-832e-15879e18d08e_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:56:06.573', '2025-05-05 17:56:06.573');
INSERT INTO `message` VALUES (216, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/4eeafd8e-647d-4310-8e67-8842a788ca90_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:57:39.750', '2025-05-05 17:57:39.750');
INSERT INTO `message` VALUES (217, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:57:39.761', '2025-05-05 17:57:39.761');
INSERT INTO `message` VALUES (218, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/4eeafd8e-647d-4310-8e67-8842a788ca90_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:57:39.769', '2025-05-05 17:57:39.769');
INSERT INTO `message` VALUES (219, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/78e86abf-a46d-40eb-b555-513a9ddf3690_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:57:55.045', '2025-05-05 17:57:55.045');
INSERT INTO `message` VALUES (220, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:57:55.095', '2025-05-05 17:57:55.095');
INSERT INTO `message` VALUES (221, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/78e86abf-a46d-40eb-b555-513a9ddf3690_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:57:55.103', '2025-05-05 17:57:55.103');
INSERT INTO `message` VALUES (222, 2, 3, '现在可以了吗', NULL, 0, NULL, 1, NULL, '2025-05-05 17:57:58.880', '2025-05-05 17:57:58.880');
INSERT INTO `message` VALUES (223, 2, 3, '我好烦', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:10.936', '2025-05-05 17:58:10.936');
INSERT INTO `message` VALUES (224, 2, 3, '我好悲伤', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:12.647', '2025-05-05 17:58:12.647');
INSERT INTO `message` VALUES (225, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:16.320', '2025-05-05 17:58:16.320');
INSERT INTO `message` VALUES (226, 2, 3, '错了', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:18.051', '2025-05-05 17:58:18.051');
INSERT INTO `message` VALUES (227, 2, 3, '一个', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:19.890', '2025-05-05 17:58:19.890');
INSERT INTO `message` VALUES (228, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:21.228', '2025-05-05 17:58:21.228');
INSERT INTO `message` VALUES (229, 2, 3, '你说啊', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:25.753', '2025-05-05 17:58:25.753');
INSERT INTO `message` VALUES (230, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:26.972', '2025-05-05 17:58:26.972');
INSERT INTO `message` VALUES (231, 2, 3, '求你了', NULL, 0, NULL, 1, NULL, '2025-05-05 17:58:28.733', '2025-05-05 17:58:28.733');
INSERT INTO `message` VALUES (232, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/75be56a6-f5aa-4760-8e7d-84d5cbaf5a9c_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 17:59:09.703', '2025-05-05 17:59:09.703');
INSERT INTO `message` VALUES (233, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:09.803', '2025-05-05 17:59:09.803');
INSERT INTO `message` VALUES (234, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/75be56a6-f5aa-4760-8e7d-84d5cbaf5a9c_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:09.812', '2025-05-05 17:59:09.812');
INSERT INTO `message` VALUES (235, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:34.248', '2025-05-05 17:59:34.248');
INSERT INTO `message` VALUES (236, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:37.200', '2025-05-05 17:59:37.200');
INSERT INTO `message` VALUES (237, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:39.201', '2025-05-05 17:59:39.201');
INSERT INTO `message` VALUES (238, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:41.339', '2025-05-05 17:59:41.339');
INSERT INTO `message` VALUES (239, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:44.707', '2025-05-05 17:59:44.707');
INSERT INTO `message` VALUES (240, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:45.884', '2025-05-05 17:59:45.884');
INSERT INTO `message` VALUES (241, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:47.052', '2025-05-05 17:59:47.052');
INSERT INTO `message` VALUES (242, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:48.168', '2025-05-05 17:59:48.168');
INSERT INTO `message` VALUES (243, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:51.147', '2025-05-05 17:59:51.147');
INSERT INTO `message` VALUES (244, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:52.218', '2025-05-05 17:59:52.218');
INSERT INTO `message` VALUES (245, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:53.081', '2025-05-05 17:59:53.081');
INSERT INTO `message` VALUES (246, 2, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-05 17:59:54.004', '2025-05-05 17:59:54.004');
INSERT INTO `message` VALUES (247, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/bae6b745-24ce-4990-9c51-dcf4ffa076ab_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:01:12.495', '2025-05-05 18:01:12.495');
INSERT INTO `message` VALUES (248, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:01:12.508', '2025-05-05 18:01:12.508');
INSERT INTO `message` VALUES (249, 2, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/bae6b745-24ce-4990-9c51-dcf4ffa076ab_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:01:12.519', '2025-05-05 18:01:12.519');
INSERT INTO `message` VALUES (250, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/03f6ba7e-77db-4514-8379-40365e0cde73_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:01:21.276', '2025-05-05 18:01:21.276');
INSERT INTO `message` VALUES (251, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:01:21.305', '2025-05-05 18:01:21.305');
INSERT INTO `message` VALUES (252, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/03f6ba7e-77db-4514-8379-40365e0cde73_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:01:21.314', '2025-05-05 18:01:21.314');
INSERT INTO `message` VALUES (253, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/092f0b7f-c7b9-4812-ad5f-601d7ed8cc40_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:03:47.613', '2025-05-05 18:03:47.613');
INSERT INTO `message` VALUES (254, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:03:47.636', '2025-05-05 18:03:47.636');
INSERT INTO `message` VALUES (255, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/092f0b7f-c7b9-4812-ad5f-601d7ed8cc40_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:03:47.647', '2025-05-05 18:03:47.647');
INSERT INTO `message` VALUES (256, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/07247812-b036-418a-95d5-4c85e6271f54_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:05:05.545', '2025-05-05 18:05:05.545');
INSERT INTO `message` VALUES (257, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:05:05.585', '2025-05-05 18:05:05.585');
INSERT INTO `message` VALUES (258, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/07247812-b036-418a-95d5-4c85e6271f54_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:05:05.596', '2025-05-05 18:05:05.596');
INSERT INTO `message` VALUES (259, 3, 2, '算法', NULL, 0, NULL, 1, NULL, '2025-05-05 18:05:13.550', '2025-05-05 18:05:13.550');
INSERT INTO `message` VALUES (260, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/2bbbdef6-976c-4dfd-af06-f5fbbd3c1ad8_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:06:41.304', '2025-05-05 18:06:41.304');
INSERT INTO `message` VALUES (261, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:06:41.317', '2025-05-05 18:06:41.317');
INSERT INTO `message` VALUES (262, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/5d8db0ae-dafd-4d71-ab44-6dc0f4fe35da_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:07:17.484', '2025-05-05 18:07:17.484');
INSERT INTO `message` VALUES (263, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:07:17.565', '2025-05-05 18:07:17.565');
INSERT INTO `message` VALUES (264, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/5d8db0ae-dafd-4d71-ab44-6dc0f4fe35da_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:07:17.575', '2025-05-05 18:07:17.575');
INSERT INTO `message` VALUES (265, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/97467578-c353-4f3c-a933-fdb664b24b8d_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:10:02.605', '2025-05-05 18:10:02.605');
INSERT INTO `message` VALUES (266, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:10:02.636', '2025-05-05 18:10:02.636');
INSERT INTO `message` VALUES (267, 3, 1, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/97467578-c353-4f3c-a933-fdb664b24b8d_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:10:02.655', '2025-05-05 18:10:02.655');
INSERT INTO `message` VALUES (268, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/9068883b-5643-43a6-b449-6a03d97b8b88_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:10:20.699', '2025-05-05 18:10:20.699');
INSERT INTO `message` VALUES (269, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:10:20.763', '2025-05-05 18:10:20.763');
INSERT INTO `message` VALUES (270, 3, 2, '[文件] 123.txt (http://192.168.1.100:8869/api/file/download/9068883b-5643-43a6-b449-6a03d97b8b88_123.txt)', NULL, 0, NULL, 1, NULL, '2025-05-05 18:10:20.779', '2025-05-05 18:10:20.779');
INSERT INTO `message` VALUES (271, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/d1f1f94b-c21d-4200-a466-1538dbd89dd6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 18:14:46.802', '2025-05-05 18:14:46.802');
INSERT INTO `message` VALUES (272, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:14:46.818', '2025-05-05 18:14:46.818');
INSERT INTO `message` VALUES (273, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 18:14:46.829', '2025-05-05 18:14:46.829');
INSERT INTO `message` VALUES (274, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/121d53d1-c17b-4a9e-a8df-ba57641910d2_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:21:02.810', '2025-05-05 19:21:02.810');
INSERT INTO `message` VALUES (275, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:21:02.841', '2025-05-05 19:21:02.841');
INSERT INTO `message` VALUES (276, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:21:02.855', '2025-05-05 19:21:02.855');
INSERT INTO `message` VALUES (277, 3, 2, '1', NULL, 0, NULL, 1, NULL, '2025-05-05 19:21:18.899', '2025-05-05 19:21:18.899');
INSERT INTO `message` VALUES (278, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/2306097c-0428-4b62-894a-5128f215e4d8_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:23:48.886', '2025-05-05 19:23:48.886');
INSERT INTO `message` VALUES (279, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:23:48.945', '2025-05-05 19:23:48.945');
INSERT INTO `message` VALUES (280, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:23:48.957', '2025-05-05 19:23:48.957');
INSERT INTO `message` VALUES (281, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/8022f9ba-2f02-4446-9bda-f3c688553b7b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:28:01.028', '2025-05-05 19:28:01.028');
INSERT INTO `message` VALUES (282, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:28:01.041', '2025-05-05 19:28:01.041');
INSERT INTO `message` VALUES (283, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:28:01.051', '2025-05-05 19:28:01.051');
INSERT INTO `message` VALUES (284, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/3be8c387-0b06-4a7e-8836-0e66433c308a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:29:56.992', '2025-05-05 19:29:56.992');
INSERT INTO `message` VALUES (285, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:29:57.039', '2025-05-05 19:29:57.039');
INSERT INTO `message` VALUES (286, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:29:57.054', '2025-05-05 19:29:57.054');
INSERT INTO `message` VALUES (287, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/95f71dee-b0be-4e9d-b1fc-7d9df2411d69_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:32:47.765', '2025-05-05 19:32:47.765');
INSERT INTO `message` VALUES (288, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:32:47.842', '2025-05-05 19:32:47.842');
INSERT INTO `message` VALUES (289, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:32:47.857', '2025-05-05 19:32:47.857');
INSERT INTO `message` VALUES (290, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/38c255e9-ad66-44a2-af04-ec0118ee967a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:41:36.205', '2025-05-05 19:41:36.205');
INSERT INTO `message` VALUES (291, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:41:36.242', '2025-05-05 19:41:36.242');
INSERT INTO `message` VALUES (292, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:41:36.253', '2025-05-05 19:41:36.253');
INSERT INTO `message` VALUES (293, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/952235f5-3e34-4598-80ab-81314b47d4c6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:41:51.007', '2025-05-05 19:41:51.007');
INSERT INTO `message` VALUES (294, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:41:51.037', '2025-05-05 19:41:51.037');
INSERT INTO `message` VALUES (295, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:41:51.049', '2025-05-05 19:41:51.049');
INSERT INTO `message` VALUES (296, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/1f187d0c-dbff-4df9-80f4-02efccc4c269_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:57:29.928', '2025-05-05 19:57:29.928');
INSERT INTO `message` VALUES (297, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:57:29.946', '2025-05-05 19:57:29.946');
INSERT INTO `message` VALUES (298, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:57:29.958', '2025-05-05 19:57:29.958');
INSERT INTO `message` VALUES (299, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/549f57f1-232d-42f0-b88b-a6375218e7b8_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 19:57:53.125', '2025-05-05 19:57:53.125');
INSERT INTO `message` VALUES (300, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:57:53.207', '2025-05-05 19:57:53.207');
INSERT INTO `message` VALUES (301, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 19:57:53.217', '2025-05-05 19:57:53.217');
INSERT INTO `message` VALUES (302, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/7c498b7d-b347-48e1-a2e0-d126377ea378_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:03:01.221', '2025-05-05 20:03:01.221');
INSERT INTO `message` VALUES (303, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:03:01.260', '2025-05-05 20:03:01.260');
INSERT INTO `message` VALUES (304, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:03:01.271', '2025-05-05 20:03:01.271');
INSERT INTO `message` VALUES (305, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/32e03df4-919b-4fc6-9cb9-eb67c5fc68bf_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:33:19.278', '2025-05-05 20:33:19.278');
INSERT INTO `message` VALUES (306, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:33:19.287', '2025-05-05 20:33:19.287');
INSERT INTO `message` VALUES (307, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:33:19.297', '2025-05-05 20:33:19.297');
INSERT INTO `message` VALUES (308, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/de616d46-8da2-4c85-8c6f-d90a644f2c3f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:40:59.226', '2025-05-05 20:40:59.226');
INSERT INTO `message` VALUES (309, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:40:59.279', '2025-05-05 20:40:59.279');
INSERT INTO `message` VALUES (310, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:40:59.289', '2025-05-05 20:40:59.289');
INSERT INTO `message` VALUES (311, 3, 1, '1', NULL, 0, NULL, 1, NULL, '2025-05-05 20:41:08.370', '2025-05-05 20:41:08.370');
INSERT INTO `message` VALUES (312, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/e910b9ab-b5b8-4b80-ab87-b47119376bee_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:41:15.234', '2025-05-05 20:41:15.234');
INSERT INTO `message` VALUES (313, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:41:15.252', '2025-05-05 20:41:15.252');
INSERT INTO `message` VALUES (314, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:41:15.262', '2025-05-05 20:41:15.262');
INSERT INTO `message` VALUES (315, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/bce28aab-ca7e-46c9-ac39-c34a4d02b8b5_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:46:09.242', '2025-05-05 20:46:09.242');
INSERT INTO `message` VALUES (316, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:46:09.256', '2025-05-05 20:46:09.256');
INSERT INTO `message` VALUES (317, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:46:09.265', '2025-05-05 20:46:09.265');
INSERT INTO `message` VALUES (318, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/761baa2d-2206-4403-bdf7-7551d6d38c85_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:46:23.675', '2025-05-05 20:46:23.675');
INSERT INTO `message` VALUES (319, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:46:23.773', '2025-05-05 20:46:23.773');
INSERT INTO `message` VALUES (320, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:46:23.784', '2025-05-05 20:46:23.784');
INSERT INTO `message` VALUES (321, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/70fb164f-c871-4bad-85ff-32840737e0e4_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:48:27.945', '2025-05-05 20:48:27.945');
INSERT INTO `message` VALUES (322, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:48:27.977', '2025-05-05 20:48:27.977');
INSERT INTO `message` VALUES (323, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:48:27.990', '2025-05-05 20:48:27.990');
INSERT INTO `message` VALUES (324, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/1fd33260-80ad-4f1d-b6f4-6350a6d353cf_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:49:08.951', '2025-05-05 20:49:08.951');
INSERT INTO `message` VALUES (325, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:49:08.965', '2025-05-05 20:49:08.965');
INSERT INTO `message` VALUES (326, 3, 1, '222', NULL, 0, NULL, 1, NULL, '2025-05-05 20:49:21.472', '2025-05-05 20:49:21.472');
INSERT INTO `message` VALUES (327, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/e1c31c55-fedd-48c5-9478-0f43c6ac9560_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:49:26.018', '2025-05-05 20:49:26.018');
INSERT INTO `message` VALUES (328, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:49:26.037', '2025-05-05 20:49:26.037');
INSERT INTO `message` VALUES (329, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:49:26.047', '2025-05-05 20:49:26.047');
INSERT INTO `message` VALUES (330, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/32d43579-e891-4ff0-b5a4-c29793f30c23_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:53:55.889', '2025-05-05 20:53:55.889');
INSERT INTO `message` VALUES (331, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:53:55.902', '2025-05-05 20:53:55.902');
INSERT INTO `message` VALUES (332, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:53:55.914', '2025-05-05 20:53:55.914');
INSERT INTO `message` VALUES (333, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/d3be57e3-12d4-4a85-ae07-b2e270536c26_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:59:10.492', '2025-05-05 20:59:10.492');
INSERT INTO `message` VALUES (334, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:10.509', '2025-05-05 20:59:10.509');
INSERT INTO `message` VALUES (335, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:10.523', '2025-05-05 20:59:10.523');
INSERT INTO `message` VALUES (336, 3, 1, '1', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:28.246', '2025-05-05 20:59:28.246');
INSERT INTO `message` VALUES (337, 3, 2, '22', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:32.997', '2025-05-05 20:59:32.997');
INSERT INTO `message` VALUES (338, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/6c87ecef-4567-48bf-ac73-6cd435412d8e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 20:59:40.550', '2025-05-05 20:59:40.550');
INSERT INTO `message` VALUES (339, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:40.582', '2025-05-05 20:59:40.582');
INSERT INTO `message` VALUES (340, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 20:59:40.592', '2025-05-05 20:59:40.592');
INSERT INTO `message` VALUES (341, 3, 2, '343', NULL, 0, NULL, 1, NULL, '2025-05-05 21:12:37.230', '2025-05-05 21:12:37.230');
INSERT INTO `message` VALUES (342, 3, 2, '55', NULL, 0, NULL, 1, NULL, '2025-05-05 21:12:47.563', '2025-05-05 21:12:47.563');
INSERT INTO `message` VALUES (343, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/e89a7032-5e3c-4be3-b778-b8332200b5bc_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 21:20:45.723', '2025-05-05 21:20:45.723');
INSERT INTO `message` VALUES (344, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:20:45.744', '2025-05-05 21:20:45.744');
INSERT INTO `message` VALUES (345, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:20:45.753', '2025-05-05 21:20:45.753');
INSERT INTO `message` VALUES (346, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/aa1ee52e-2888-4d80-8203-53a4410ebf70_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 21:20:57.175', '2025-05-05 21:20:57.175');
INSERT INTO `message` VALUES (347, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:20:57.229', '2025-05-05 21:20:57.229');
INSERT INTO `message` VALUES (348, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:20:57.243', '2025-05-05 21:20:57.243');
INSERT INTO `message` VALUES (349, 3, 1, '22', NULL, 0, NULL, 1, NULL, '2025-05-05 21:21:01.685', '2025-05-05 21:21:01.685');
INSERT INTO `message` VALUES (350, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/70ab802b-eb90-4c57-998a-8683fbaecb15_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 21:21:09.847', '2025-05-05 21:21:09.847');
INSERT INTO `message` VALUES (351, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:21:09.888', '2025-05-05 21:21:09.888');
INSERT INTO `message` VALUES (352, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:21:09.897', '2025-05-05 21:21:09.897');
INSERT INTO `message` VALUES (353, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.1.100:8869/api/file/download/99b6bf00-c89d-490c-bf49-4b2f3cfc5ff2_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 21:21:46.171', '2025-05-05 21:21:46.171');
INSERT INTO `message` VALUES (354, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:21:46.263', '2025-05-05 21:21:46.263');
INSERT INTO `message` VALUES (355, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 21:21:46.272', '2025-05-05 21:21:46.272');
INSERT INTO `message` VALUES (356, 3, 2, '312', NULL, 0, NULL, 1, NULL, '2025-05-05 23:08:43.845', '2025-05-05 23:08:43.845');
INSERT INTO `message` VALUES (357, 3, 2, '3\\', NULL, 0, NULL, 1, NULL, '2025-05-05 23:08:51.860', '2025-05-05 23:08:51.860');
INSERT INTO `message` VALUES (358, 3, 2, '23233', NULL, 0, NULL, 1, NULL, '2025-05-05 23:08:57.612', '2025-05-05 23:08:57.612');
INSERT INTO `message` VALUES (359, 3, 2, 'when', NULL, 0, NULL, 1, NULL, '2025-05-05 23:09:20.421', '2025-05-05 23:09:20.421');
INSERT INTO `message` VALUES (360, 3, 2, '23', NULL, 0, NULL, 1, NULL, '2025-05-05 23:12:27.301', '2025-05-05 23:12:27.301');
INSERT INTO `message` VALUES (361, 3, 2, '123', NULL, 0, NULL, 1, NULL, '2025-05-05 23:12:31.055', '2025-05-05 23:12:31.055');
INSERT INTO `message` VALUES (362, 3, 2, '2323', NULL, 0, NULL, 1, NULL, '2025-05-05 23:12:34.306', '2025-05-05 23:12:34.306');
INSERT INTO `message` VALUES (363, 3, 2, '4444', NULL, 0, NULL, 1, NULL, '2025-05-05 23:12:41.512', '2025-05-05 23:12:41.512');
INSERT INTO `message` VALUES (364, 3, 2, '222', NULL, 0, NULL, 1, NULL, '2025-05-05 23:12:45.420', '2025-05-05 23:12:45.420');
INSERT INTO `message` VALUES (365, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/51f5a2be-21ce-478c-91b0-4d87d8bd21da_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 23:13:28.636', '2025-05-05 23:13:28.636');
INSERT INTO `message` VALUES (366, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 23:13:28.696', '2025-05-05 23:13:28.696');
INSERT INTO `message` VALUES (367, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 23:13:28.706', '2025-05-05 23:13:28.706');
INSERT INTO `message` VALUES (368, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/1f3e21cf-5216-45ae-94e7-83646be8622e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-05 23:52:33.392', '2025-05-05 23:52:33.392');
INSERT INTO `message` VALUES (369, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-05 23:52:33.410', '2025-05-05 23:52:33.410');
INSERT INTO `message` VALUES (370, 3, 2, '3434', NULL, 0, NULL, 1, NULL, '2025-05-05 23:53:53.501', '2025-05-05 23:53:53.501');
INSERT INTO `message` VALUES (371, 3, 2, '444', NULL, 0, NULL, 1, NULL, '2025-05-05 23:58:53.786', '2025-05-05 23:58:53.786');
INSERT INTO `message` VALUES (372, 3, 2, '34', NULL, 0, NULL, 1, NULL, '2025-05-05 23:59:01.684', '2025-05-05 23:59:01.684');
INSERT INTO `message` VALUES (373, 3, 2, '3223', NULL, 0, NULL, 1, NULL, '2025-05-06 00:02:33.039', '2025-05-06 00:02:33.039');
INSERT INTO `message` VALUES (374, 3, 2, 'asdf', NULL, 0, NULL, 1, NULL, '2025-05-06 00:02:37.833', '2025-05-06 00:02:37.833');
INSERT INTO `message` VALUES (375, 3, 2, '120', NULL, 0, NULL, 1, NULL, '2025-05-06 00:02:50.240', '2025-05-06 00:02:50.240');
INSERT INTO `message` VALUES (376, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/4098b815-2cf5-43e8-a405-8b675a99e441_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:30:46.764', '2025-05-06 01:30:46.764');
INSERT INTO `message` VALUES (377, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:30:46.904', '2025-05-06 01:30:46.904');
INSERT INTO `message` VALUES (378, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/d905ee93-32af-42aa-98f1-20b786d5bb76_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:36:14.122', '2025-05-06 01:36:14.122');
INSERT INTO `message` VALUES (379, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:36:14.149', '2025-05-06 01:36:14.149');
INSERT INTO `message` VALUES (380, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/2b1fd593-be6b-4996-98f6-75e36792bf44_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:38:41.734', '2025-05-06 01:38:41.734');
INSERT INTO `message` VALUES (381, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:38:41.758', '2025-05-06 01:38:41.758');
INSERT INTO `message` VALUES (382, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/f1ffccf6-b2c0-45cc-b8c7-5af34ea698f9_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:41:00.443', '2025-05-06 01:41:00.443');
INSERT INTO `message` VALUES (383, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:41:00.482', '2025-05-06 01:41:00.482');
INSERT INTO `message` VALUES (384, 3, 1, '等等', NULL, 0, NULL, 1, NULL, '2025-05-06 01:41:38.888', '2025-05-06 01:41:38.888');
INSERT INTO `message` VALUES (385, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/04c52b47-67bf-4d62-aeb3-62d25258a92e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:42:13.278', '2025-05-06 01:42:13.278');
INSERT INTO `message` VALUES (386, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:42:13.292', '2025-05-06 01:42:13.292');
INSERT INTO `message` VALUES (387, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/3c41eabb-1684-4799-bd90-4613c18f66d6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:46:11.885', '2025-05-06 01:46:11.885');
INSERT INTO `message` VALUES (388, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:46:11.900', '2025-05-06 01:46:11.900');
INSERT INTO `message` VALUES (389, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/c01b2fa5-0ae6-4011-b3d5-b8db4c15f08b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:52:58.595', '2025-05-06 01:52:58.595');
INSERT INTO `message` VALUES (390, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:52:58.633', '2025-05-06 01:52:58.633');
INSERT INTO `message` VALUES (391, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/2c2609e1-c4cd-4a5e-a614-820cca56beb5_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:53:28.257', '2025-05-06 01:53:28.257');
INSERT INTO `message` VALUES (392, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:53:28.295', '2025-05-06 01:53:28.295');
INSERT INTO `message` VALUES (393, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/452cb2a8-acb6-4d49-96b9-52d296e64135_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:56:28.158', '2025-05-06 01:56:28.158');
INSERT INTO `message` VALUES (394, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:56:28.196', '2025-05-06 01:56:28.196');
INSERT INTO `message` VALUES (395, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/00d312a0-a6dc-4f66-96e4-a55bf06d2d84_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 01:57:54.447', '2025-05-06 01:57:54.447');
INSERT INTO `message` VALUES (396, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 01:57:54.465', '2025-05-06 01:57:54.465');
INSERT INTO `message` VALUES (397, 2, 1, '1', NULL, 0, NULL, 1, NULL, '2025-05-06 01:58:19.416', '2025-05-06 01:58:19.416');
INSERT INTO `message` VALUES (398, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/15e638f7-8123-4244-a6d1-b27a3b719a43_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 02:27:57.547', '2025-05-06 02:27:57.547');
INSERT INTO `message` VALUES (399, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 02:27:57.729', '2025-05-06 02:27:57.729');
INSERT INTO `message` VALUES (400, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/8ba0c174-a2c3-4e2c-b96c-d9a62c9c63bc_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 11:26:26.783', '2025-05-06 11:26:26.783');
INSERT INTO `message` VALUES (401, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 11:26:26.933', '2025-05-06 11:26:26.933');
INSERT INTO `message` VALUES (402, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/bf1eaca0-224e-4934-8d83-43927c0d54c6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 14:18:15.350', '2025-05-06 14:18:15.350');
INSERT INTO `message` VALUES (403, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 14:18:15.504', '2025-05-06 14:18:15.504');
INSERT INTO `message` VALUES (404, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/89aae701-c95a-446b-a4c3-25ddda111e79_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 15:07:30.518', '2025-05-06 15:07:30.518');
INSERT INTO `message` VALUES (405, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 15:07:30.615', '2025-05-06 15:07:30.615');
INSERT INTO `message` VALUES (406, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/6d94cee0-d2ac-42be-9e82-6c6d514ebd15_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 15:07:51.658', '2025-05-06 15:07:51.658');
INSERT INTO `message` VALUES (407, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 15:07:51.677', '2025-05-06 15:07:51.677');
INSERT INTO `message` VALUES (408, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/1ef03e50-6fc6-4132-97d9-4e9d96227b10_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 15:15:53.981', '2025-05-06 15:15:53.981');
INSERT INTO `message` VALUES (409, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 15:15:54.044', '2025-05-06 15:15:54.044');
INSERT INTO `message` VALUES (410, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/3a861679-1526-4e53-94f1-edbf91f7f070_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 15:22:01.718', '2025-05-06 15:22:01.718');
INSERT INTO `message` VALUES (411, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 15:22:01.808', '2025-05-06 15:22:01.808');
INSERT INTO `message` VALUES (412, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/622d0f78-5fda-401d-8498-e4dd8d5980df_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 15:22:30.232', '2025-05-06 15:22:30.232');
INSERT INTO `message` VALUES (413, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 15:22:30.314', '2025-05-06 15:22:30.314');
INSERT INTO `message` VALUES (414, 3, 1, 'fdsfsd', NULL, 0, NULL, 1, NULL, '2025-05-06 16:18:37.477', '2025-05-06 16:18:37.477');
INSERT INTO `message` VALUES (415, 3, 1, 'nhao', NULL, 0, NULL, 1, NULL, '2025-05-06 16:18:56.088', '2025-05-06 16:18:56.088');
INSERT INTO `message` VALUES (416, 3, 2, '非常好', NULL, 0, NULL, 1, NULL, '2025-05-06 16:18:58.853', '2025-05-06 16:18:58.853');
INSERT INTO `message` VALUES (417, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/b3c9dd98-e2eb-4e10-b5e6-955043737f1a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:19:03.235', '2025-05-06 16:19:03.235');
INSERT INTO `message` VALUES (418, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:19:03.264', '2025-05-06 16:19:03.264');
INSERT INTO `message` VALUES (419, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/de9c9f7c-7cb0-4f5c-a64b-8de8ce5ae74b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:19:42.974', '2025-05-06 16:19:42.974');
INSERT INTO `message` VALUES (420, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:19:43.067', '2025-05-06 16:19:43.067');
INSERT INTO `message` VALUES (421, 3, 2, '999', NULL, 0, NULL, 1, NULL, '2025-05-06 16:19:50.415', '2025-05-06 16:19:50.415');
INSERT INTO `message` VALUES (422, 3, 1, '123', NULL, 0, NULL, 1, NULL, '2025-05-06 16:24:38.769', '2025-05-06 16:24:38.769');
INSERT INTO `message` VALUES (423, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/d0fbb209-b6dc-4e8a-b496-0127859aa8c4_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:24:52.221', '2025-05-06 16:24:52.221');
INSERT INTO `message` VALUES (424, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:24:52.293', '2025-05-06 16:24:52.293');
INSERT INTO `message` VALUES (425, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/7fdca6a6-0758-46a3-95e5-54ac826f110c_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:26:22.576', '2025-05-06 16:26:22.576');
INSERT INTO `message` VALUES (426, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:26:22.596', '2025-05-06 16:26:22.596');
INSERT INTO `message` VALUES (427, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-06 16:26:40.459', '2025-05-06 16:26:40.459');
INSERT INTO `message` VALUES (428, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/cb592f45-94ba-40bf-873e-5123d2c45897_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:26:44.994', '2025-05-06 16:26:44.994');
INSERT INTO `message` VALUES (429, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:26:45.011', '2025-05-06 16:26:45.011');
INSERT INTO `message` VALUES (430, 3, 2, '22', NULL, 0, NULL, 1, NULL, '2025-05-06 16:33:39.466', '2025-05-06 16:33:39.466');
INSERT INTO `message` VALUES (431, 3, 1, '22', NULL, 0, NULL, 1, NULL, '2025-05-06 16:33:42.522', '2025-05-06 16:33:42.522');
INSERT INTO `message` VALUES (432, 3, 2, '345', NULL, 0, NULL, 1, NULL, '2025-05-06 16:33:44.674', '2025-05-06 16:33:44.674');
INSERT INTO `message` VALUES (433, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/cbfefdf1-862f-4a1f-b689-5493a1db5511_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:33:50.209', '2025-05-06 16:33:50.209');
INSERT INTO `message` VALUES (434, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/7744caa3-e002-4563-abc6-46dd7c29f5dc_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:33:57.486', '2025-05-06 16:33:57.486');
INSERT INTO `message` VALUES (435, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-06 16:34:16.776', '2025-05-06 16:34:16.776');
INSERT INTO `message` VALUES (436, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/8cd64e75-d06e-48ba-b442-2a3fdcbd5d23_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:34:22.402', '2025-05-06 16:34:22.402');
INSERT INTO `message` VALUES (437, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/a9f12990-efd7-4a87-ae10-5cf56968de05_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:36:04.545', '2025-05-06 16:36:04.545');
INSERT INTO `message` VALUES (438, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/013402b7-882f-42f6-9be6-d6a212641433_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:37:44.445', '2025-05-06 16:37:44.445');
INSERT INTO `message` VALUES (439, 3, 2, '23', NULL, 0, NULL, 1, NULL, '2025-05-06 16:41:17.733', '2025-05-06 16:41:17.733');
INSERT INTO `message` VALUES (440, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-06 16:41:29.159', '2025-05-06 16:41:29.159');
INSERT INTO `message` VALUES (441, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/e77d27ca-f91b-4b56-ae11-dad5b340d266_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:41:44.283', '2025-05-06 16:41:44.283');
INSERT INTO `message` VALUES (442, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:41:44.348', '2025-05-06 16:41:44.348');
INSERT INTO `message` VALUES (443, 3, 2, '123<br><br>', NULL, 0, NULL, 1, NULL, '2025-05-06 16:54:57.801', '2025-05-06 16:54:57.801');
INSERT INTO `message` VALUES (444, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/a4612aaa-f41f-4861-9cc3-96b32cd79d8f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 16:55:04.899', '2025-05-06 16:55:04.899');
INSERT INTO `message` VALUES (445, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 16:55:04.919', '2025-05-06 16:55:04.919');
INSERT INTO `message` VALUES (446, 3, 2, '22', NULL, 0, NULL, 1, NULL, '2025-05-06 17:02:30.166', '2025-05-06 17:02:30.166');
INSERT INTO `message` VALUES (447, 3, 1, '3', NULL, 0, NULL, 1, NULL, '2025-05-06 17:02:34.313', '2025-05-06 17:02:34.313');
INSERT INTO `message` VALUES (448, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/cf435443-7d47-42ed-9b10-6a19b930aa42_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 17:02:39.167', '2025-05-06 17:02:39.167');
INSERT INTO `message` VALUES (449, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 17:02:39.191', '2025-05-06 17:02:39.191');
INSERT INTO `message` VALUES (450, 3, 2, '3', NULL, 0, NULL, 1, NULL, '2025-05-06 17:05:09.657', '2025-05-06 17:05:09.657');
INSERT INTO `message` VALUES (451, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/70192a37-0357-44ea-a64c-74b7c0f93a29_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 17:05:18.002', '2025-05-06 17:05:18.002');
INSERT INTO `message` VALUES (452, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 17:05:18.033', '2025-05-06 17:05:18.033');
INSERT INTO `message` VALUES (453, 3, 2, '23423', NULL, 0, NULL, 1, NULL, '2025-05-06 17:10:53.064', '2025-05-06 17:10:53.064');
INSERT INTO `message` VALUES (454, 3, 2, '333', NULL, 0, NULL, 1, NULL, '2025-05-06 17:12:39.139', '2025-05-06 17:12:39.139');
INSERT INTO `message` VALUES (455, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 17:12:49.775', '2025-05-06 17:12:49.775');
INSERT INTO `message` VALUES (456, 3, 2, '12', NULL, 0, NULL, 1, NULL, '2025-05-06 17:21:32.402', '2025-05-06 17:21:32.402');
INSERT INTO `message` VALUES (457, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/dfa283f8-67fa-44c9-a7a9-538f8ab53e0e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 17:21:40.519', '2025-05-06 17:21:40.519');
INSERT INTO `message` VALUES (458, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 17:21:40.567', '2025-05-06 17:21:40.567');
INSERT INTO `message` VALUES (459, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/f2918242-75bf-4a2a-9431-09dac321d65a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 17:22:05.468', '2025-05-06 17:22:05.468');
INSERT INTO `message` VALUES (460, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 17:22:05.526', '2025-05-06 17:22:05.526');
INSERT INTO `message` VALUES (461, 3, 2, 'sd', NULL, 0, NULL, 1, NULL, '2025-05-06 22:18:36.339', '2025-05-06 22:18:36.339');
INSERT INTO `message` VALUES (462, 3, 1, 'dss', NULL, 0, NULL, 1, NULL, '2025-05-06 22:18:45.495', '2025-05-06 22:18:45.495');
INSERT INTO `message` VALUES (463, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/77ec4b43-336d-49f5-bb4a-69675146a18a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 22:18:50.970', '2025-05-06 22:18:50.970');
INSERT INTO `message` VALUES (464, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 22:18:51.000', '2025-05-06 22:18:51.000');
INSERT INTO `message` VALUES (465, 3, 2, '88', NULL, 0, NULL, 1, NULL, '2025-05-06 22:21:34.462', '2025-05-06 22:21:34.462');
INSERT INTO `message` VALUES (466, 3, 2, '7777', NULL, 0, NULL, 1, NULL, '2025-05-06 22:21:46.139', '2025-05-06 22:21:46.139');
INSERT INTO `message` VALUES (467, 3, 2, '天才', NULL, 0, NULL, 1, NULL, '2025-05-06 22:23:38.264', '2025-05-06 22:23:38.264');
INSERT INTO `message` VALUES (468, 3, 2, '笨蛋', NULL, 0, NULL, 1, NULL, '2025-05-06 22:23:46.312', '2025-05-06 22:23:46.312');
INSERT INTO `message` VALUES (469, 3, 2, '我是奶龙', NULL, 0, NULL, 1, NULL, '2025-05-06 22:33:50.016', '2025-05-06 22:33:50.016');
INSERT INTO `message` VALUES (470, 3, 1, '我才是奶龙', NULL, 0, NULL, 1, NULL, '2025-05-06 22:34:01.375', '2025-05-06 22:34:01.375');
INSERT INTO `message` VALUES (471, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/94628661-f948-4c96-8ca4-529b89539b7d_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 22:34:50.990', '2025-05-06 22:34:50.990');
INSERT INTO `message` VALUES (472, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 22:34:51.047', '2025-05-06 22:34:51.047');
INSERT INTO `message` VALUES (473, 3, 1, '66', NULL, 0, NULL, 1, NULL, '2025-05-06 22:42:57.244', '2025-05-06 22:42:57.244');
INSERT INTO `message` VALUES (474, 3, 2, '你是天才', NULL, 0, NULL, 1, NULL, '2025-05-06 22:43:06.295', '2025-05-06 22:43:06.295');
INSERT INTO `message` VALUES (475, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/9ec4c4c2-9c05-46a0-94a6-f83155f9ecb6_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 22:43:19.933', '2025-05-06 22:43:19.933');
INSERT INTO `message` VALUES (476, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 22:43:20.007', '2025-05-06 22:43:20.007');
INSERT INTO `message` VALUES (477, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/5a549b13-3c6b-4597-80cb-f357ec8f1292_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 22:43:35.824', '2025-05-06 22:43:35.824');
INSERT INTO `message` VALUES (478, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 22:43:35.916', '2025-05-06 22:43:35.916');
INSERT INTO `message` VALUES (479, 3, 1, '000', NULL, 0, NULL, 1, NULL, '2025-05-06 22:43:44.475', '2025-05-06 22:43:44.475');
INSERT INTO `message` VALUES (480, 3, 1, '22', NULL, 0, NULL, 1, NULL, '2025-05-06 22:52:10.321', '2025-05-06 22:52:10.321');
INSERT INTO `message` VALUES (481, 3, 2, '33', NULL, 0, NULL, 1, NULL, '2025-05-06 22:52:13.216', '2025-05-06 22:52:13.216');
INSERT INTO `message` VALUES (482, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/da90674f-70a2-4b5d-b39b-4cc2491f44f0_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 22:52:21.830', '2025-05-06 22:52:21.830');
INSERT INTO `message` VALUES (483, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 22:52:21.848', '2025-05-06 22:52:21.848');
INSERT INTO `message` VALUES (484, 3, 2, '😁😄', NULL, 0, NULL, 1, NULL, '2025-05-06 23:02:55.695', '2025-05-06 23:02:55.695');
INSERT INTO `message` VALUES (485, 3, 1, 'sdf', NULL, 0, NULL, 1, NULL, '2025-05-06 23:03:04.581', '2025-05-06 23:03:04.581');
INSERT INTO `message` VALUES (486, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/bb39b011-bff9-442f-aa42-82eab57e0200_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 23:03:13.987', '2025-05-06 23:03:13.987');
INSERT INTO `message` VALUES (487, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 23:03:14.038', '2025-05-06 23:03:14.038');
INSERT INTO `message` VALUES (488, 3, 1, 'df', NULL, 0, NULL, 1, NULL, '2025-05-06 23:12:43.286', '2025-05-06 23:12:43.286');
INSERT INTO `message` VALUES (489, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/7f7cf7ae-bff9-40f9-8d9b-47cce4d5dd60_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 23:12:52.984', '2025-05-06 23:12:52.984');
INSERT INTO `message` VALUES (490, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 23:12:53.028', '2025-05-06 23:12:53.028');
INSERT INTO `message` VALUES (491, 3, 1, '22', NULL, 0, NULL, 1, NULL, '2025-05-06 23:19:20.205', '2025-05-06 23:19:20.205');
INSERT INTO `message` VALUES (492, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/e05db627-908c-4c30-a4d2-2b0ba6042846_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 23:19:27.816', '2025-05-06 23:19:27.816');
INSERT INTO `message` VALUES (493, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 23:19:27.844', '2025-05-06 23:19:27.844');
INSERT INTO `message` VALUES (494, 3, 2, '234', NULL, 0, NULL, 1, NULL, '2025-05-06 23:27:49.710', '2025-05-06 23:27:49.710');
INSERT INTO `message` VALUES (495, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/a4569904-9b12-48ff-8219-f1fbf44b745e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-06 23:27:58.999', '2025-05-06 23:27:58.999');
INSERT INTO `message` VALUES (496, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-06 23:27:59.017', '2025-05-06 23:27:59.017');
INSERT INTO `message` VALUES (497, 3, 1, '123123', NULL, 0, NULL, 1, NULL, '2025-05-07 01:10:08.332', '2025-05-07 01:10:08.332');
INSERT INTO `message` VALUES (498, 3, 2, '234', NULL, 0, NULL, 1, NULL, '2025-05-07 01:10:11.595', '2025-05-07 01:10:11.595');
INSERT INTO `message` VALUES (499, 3, 1, '324', NULL, 0, NULL, 1, NULL, '2025-05-07 01:10:21.398', '2025-05-07 01:10:21.398');
INSERT INTO `message` VALUES (500, 3, 2, '34', NULL, 0, NULL, 1, NULL, '2025-05-07 01:10:24.876', '2025-05-07 01:10:24.876');
INSERT INTO `message` VALUES (501, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/18784840-9170-4ff3-b470-f24a6eab90dd_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 01:10:29.542', '2025-05-07 01:10:29.542');
INSERT INTO `message` VALUES (502, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 01:10:29.566', '2025-05-07 01:10:29.566');
INSERT INTO `message` VALUES (503, 3, 2, 'w', NULL, 0, NULL, 1, NULL, '2025-05-07 10:20:45.727', '2025-05-07 10:20:45.727');
INSERT INTO `message` VALUES (504, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/43504de6-7a8a-4b23-b443-d4a22117b094_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 10:20:50.355', '2025-05-07 10:20:50.355');
INSERT INTO `message` VALUES (505, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 10:20:50.381', '2025-05-07 10:20:50.381');
INSERT INTO `message` VALUES (506, 3, 1, '213', NULL, 0, NULL, 1, NULL, '2025-05-07 10:37:16.466', '2025-05-07 10:37:16.466');
INSERT INTO `message` VALUES (507, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/2a8bf2d9-9612-4b76-b62b-9db29da8c92b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 10:37:22.353', '2025-05-07 10:37:22.353');
INSERT INTO `message` VALUES (508, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 10:37:22.374', '2025-05-07 10:37:22.374');
INSERT INTO `message` VALUES (509, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/56e9d17f-c671-491a-875c-42e85c14a019_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 10:39:33.030', '2025-05-07 10:39:33.030');
INSERT INTO `message` VALUES (510, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 10:39:33.130', '2025-05-07 10:39:33.130');
INSERT INTO `message` VALUES (511, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/04dddeba-3c68-4b30-9243-041e7fa72f43_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 10:39:39.222', '2025-05-07 10:39:39.222');
INSERT INTO `message` VALUES (512, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 10:39:39.309', '2025-05-07 10:39:39.309');
INSERT INTO `message` VALUES (513, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/41d46dc3-f4b1-4166-b158-7bc3dba2635b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 10:40:53.492', '2025-05-07 10:40:53.492');
INSERT INTO `message` VALUES (514, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 10:40:53.525', '2025-05-07 10:40:53.525');
INSERT INTO `message` VALUES (515, 3, 1, '123123', NULL, 0, NULL, 1, NULL, '2025-05-07 11:03:56.931', '2025-05-07 11:03:56.931');
INSERT INTO `message` VALUES (516, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/fec53035-f1ad-4634-a37d-f923df5fbc67_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 11:04:10.639', '2025-05-07 11:04:10.639');
INSERT INTO `message` VALUES (517, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 11:04:10.683', '2025-05-07 11:04:10.683');
INSERT INTO `message` VALUES (518, 3, 1, '234', NULL, 0, NULL, 1, NULL, '2025-05-07 11:56:27.507', '2025-05-07 11:56:27.507');
INSERT INTO `message` VALUES (519, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/f9097cdf-03b6-4839-b5f8-bd18e554af82_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 11:56:33.655', '2025-05-07 11:56:33.655');
INSERT INTO `message` VALUES (520, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 11:56:33.692', '2025-05-07 11:56:33.692');
INSERT INTO `message` VALUES (521, 3, 1, '收到了谢谢你', NULL, 0, NULL, 1, NULL, '2025-05-07 11:56:44.570', '2025-05-07 11:56:44.570');
INSERT INTO `message` VALUES (522, 3, 2, '好的', NULL, 0, NULL, 1, NULL, '2025-05-07 11:57:06.556', '2025-05-07 11:57:06.556');
INSERT INTO `message` VALUES (523, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/17cbd537-7e44-4433-8df8-f0cda60ca7b1_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 11:57:11.942', '2025-05-07 11:57:11.942');
INSERT INTO `message` VALUES (524, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 11:57:11.962', '2025-05-07 11:57:11.962');
INSERT INTO `message` VALUES (525, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/d9d88afa-1d2e-4806-a1c7-8e042b8d9715_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:20:23.881', '2025-05-07 13:20:23.881');
INSERT INTO `message` VALUES (526, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:20:23.962', '2025-05-07 13:20:23.962');
INSERT INTO `message` VALUES (527, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/4c881777-f977-4147-96c4-50ff5f0a59ab_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:22:23.011', '2025-05-07 13:22:23.011');
INSERT INTO `message` VALUES (528, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:22:23.143', '2025-05-07 13:22:23.143');
INSERT INTO `message` VALUES (529, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/8fa1fb90-c605-4903-99da-dcf67fbbe4f0_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:23:50.787', '2025-05-07 13:23:50.787');
INSERT INTO `message` VALUES (530, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:23:50.907', '2025-05-07 13:23:50.907');
INSERT INTO `message` VALUES (531, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/4ba5a6ae-bcab-4c5e-aaf0-dce6709f1961_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:30:03.904', '2025-05-07 13:30:03.904');
INSERT INTO `message` VALUES (532, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:30:03.965', '2025-05-07 13:30:03.965');
INSERT INTO `message` VALUES (533, 3, 1, '232', NULL, 0, NULL, 1, NULL, '2025-05-07 13:43:38.449', '2025-05-07 13:43:38.449');
INSERT INTO `message` VALUES (534, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/91ead780-0ea6-4f47-9754-0a0cefdbf0e0_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:43:43.144', '2025-05-07 13:43:43.144');
INSERT INTO `message` VALUES (535, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:43:43.162', '2025-05-07 13:43:43.162');
INSERT INTO `message` VALUES (536, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/0a9ebb19-0de4-4419-8faa-45af9b3a5b63_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:48:48.848', '2025-05-07 13:48:48.848');
INSERT INTO `message` VALUES (537, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:48:48.889', '2025-05-07 13:48:48.889');
INSERT INTO `message` VALUES (538, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/1fe10b1f-46f0-42f8-9af4-28f5fb1b678e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:49:11.934', '2025-05-07 13:49:11.934');
INSERT INTO `message` VALUES (539, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:49:12.009', '2025-05-07 13:49:12.009');
INSERT INTO `message` VALUES (540, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/15d3c198-14a3-43a2-b8a6-2ef3fcfcd247_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:53:43.649', '2025-05-07 13:53:43.649');
INSERT INTO `message` VALUES (541, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:53:43.714', '2025-05-07 13:53:43.714');
INSERT INTO `message` VALUES (542, 3, 1, '23', NULL, 0, NULL, 1, NULL, '2025-05-07 13:59:04.419', '2025-05-07 13:59:04.419');
INSERT INTO `message` VALUES (543, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/970bbcb6-4309-4be6-acfc-69cb8ae2af9d_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 13:59:14.934', '2025-05-07 13:59:14.934');
INSERT INTO `message` VALUES (544, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 13:59:15.012', '2025-05-07 13:59:15.012');
INSERT INTO `message` VALUES (545, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/63d02d40-c615-4f4d-9e53-72e350837fc1_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 14:19:16.608', '2025-05-07 14:19:16.608');
INSERT INTO `message` VALUES (546, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 14:19:16.670', '2025-05-07 14:19:16.670');
INSERT INTO `message` VALUES (547, 3, 1, '23', NULL, 0, NULL, 1, NULL, '2025-05-07 14:28:00.244', '2025-05-07 14:28:00.244');
INSERT INTO `message` VALUES (548, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.74.28.202:8869/api/file/download/218e5f9c-fcc5-46e3-af51-65af77ddee88_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 14:28:09.258', '2025-05-07 14:28:09.258');
INSERT INTO `message` VALUES (549, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 14:28:09.333', '2025-05-07 14:28:09.333');
INSERT INTO `message` VALUES (550, 3, 1, '2', NULL, 0, NULL, 1, NULL, '2025-05-07 15:24:05.687', '2025-05-07 15:24:05.687');
INSERT INTO `message` VALUES (551, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/f495ecf3-078d-48d3-a8d3-2d1388cda22f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:24:17.711', '2025-05-07 15:24:17.711');
INSERT INTO `message` VALUES (552, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:24:17.756', '2025-05-07 15:24:17.756');
INSERT INTO `message` VALUES (553, 3, 1, '2<br><br>', NULL, 0, NULL, 1, NULL, '2025-05-07 15:27:36.566', '2025-05-07 15:27:36.566');
INSERT INTO `message` VALUES (554, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/dcf30e6e-bd1f-4730-b504-18dee7694b5e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:27:45.147', '2025-05-07 15:27:45.147');
INSERT INTO `message` VALUES (555, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:27:45.182', '2025-05-07 15:27:45.182');
INSERT INTO `message` VALUES (556, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/6ff6d102-6d27-4e02-beb2-54491fd9e0cf_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:34:54.537', '2025-05-07 15:34:54.537');
INSERT INTO `message` VALUES (557, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:34:54.588', '2025-05-07 15:34:54.588');
INSERT INTO `message` VALUES (558, 3, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/25ca3cb4-c862-48b4-a0db-07ecf0bd0d65_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:41:32.133', '2025-05-07 15:41:32.133');
INSERT INTO `message` VALUES (559, 3, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:41:32.176', '2025-05-07 15:41:32.176');
INSERT INTO `message` VALUES (560, 3, 2, '水电费、', NULL, 0, NULL, 1, NULL, '2025-05-07 15:42:36.099', '2025-05-07 15:42:36.099');
INSERT INTO `message` VALUES (561, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/bf6e4ac5-01ef-40cb-943b-3b459bd1117a_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:42:44.411', '2025-05-07 15:42:44.411');
INSERT INTO `message` VALUES (562, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:42:44.432', '2025-05-07 15:42:44.432');
INSERT INTO `message` VALUES (563, 3, 1, '的', NULL, 0, NULL, 1, NULL, '2025-05-07 15:43:32.762', '2025-05-07 15:43:32.762');
INSERT INTO `message` VALUES (564, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://100.79.51.161:8869/api/file/download/3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:43:36.837', '2025-05-07 15:43:36.837');
INSERT INTO `message` VALUES (565, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:43:36.859', '2025-05-07 15:43:36.859');
INSERT INTO `message` VALUES (566, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/3576acb1-7502-4b57-a534-a2c0154eec4c_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:46:13.531', '2025-05-07 15:46:13.531');
INSERT INTO `message` VALUES (567, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:46:13.576', '2025-05-07 15:46:13.576');
INSERT INTO `message` VALUES (568, 2, 1, '计网实验三.docx', NULL, 0, NULL, 6, '{\"size\": 1275720, \"type\": \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/bd520628-cd6d-45ec-9426-27301480d0a3_计网实验三.docx\", \"fileName\": \"计网实验三.docx\"}', '2025-05-07 15:46:28.445', '2025-05-07 15:46:28.445');
INSERT INTO `message` VALUES (569, 2, 1, '计网实验三.docx', NULL, 0, NULL, 1, NULL, '2025-05-07 15:46:28.510', '2025-05-07 15:46:28.510');
INSERT INTO `message` VALUES (570, 2, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 15:48:38.595', '2025-05-07 15:48:38.595');
INSERT INTO `message` VALUES (571, 2, 1, '微笑', NULL, 0, NULL, 1, NULL, '2025-05-07 15:49:06.930', '2025-05-07 15:49:06.930');
INSERT INTO `message` VALUES (572, 2, 1, '寝df', NULL, 0, NULL, 1, NULL, '2025-05-07 15:49:09.561', '2025-05-07 15:49:09.561');
INSERT INTO `message` VALUES (573, 2, 3, '😇😇', NULL, 0, NULL, 1, NULL, '2025-05-07 15:49:14.369', '2025-05-07 15:49:14.369');
INSERT INTO `message` VALUES (574, 2, 1, '基于Flask框架的智能房屋租赁系统_00.jpg', NULL, 0, NULL, 6, '{\"size\": 792982, \"type\": \"image/jpeg\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/dd24d25c-cc0e-46e0-8bc1-c477be509204_基于Flask框架的智能房屋租赁系统_00.jpg\", \"fileName\": \"基于Flask框架的智能房屋租赁系统_00.jpg\"}', '2025-05-07 15:50:16.384', '2025-05-07 15:50:16.384');
INSERT INTO `message` VALUES (575, 2, 1, '基于Flask框架的智能房屋租赁系统_00.jpg', NULL, 0, NULL, 1, NULL, '2025-05-07 15:50:16.411', '2025-05-07 15:50:16.411');
INSERT INTO `message` VALUES (576, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/bd6b4a35-de2c-4af3-95a3-2942476be1c3_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:50:29.834', '2025-05-07 15:50:29.834');
INSERT INTO `message` VALUES (577, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:50:29.856', '2025-05-07 15:50:29.856');
INSERT INTO `message` VALUES (578, 2, 1, '地方', NULL, 0, NULL, 1, NULL, '2025-05-07 15:51:42.911', '2025-05-07 15:51:42.911');
INSERT INTO `message` VALUES (579, 2, 3, '浩', NULL, 0, NULL, 1, NULL, '2025-05-07 15:51:45.555', '2025-05-07 15:51:45.555');
INSERT INTO `message` VALUES (580, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/d78b171b-b0ec-4fdd-8ef6-d843d6ddfca3_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:51:48.384', '2025-05-07 15:51:48.384');
INSERT INTO `message` VALUES (581, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:51:48.408', '2025-05-07 15:51:48.408');
INSERT INTO `message` VALUES (582, 2, 1, '新建 DOC 文档.doc', NULL, 0, NULL, 6, '{\"size\": 856576, \"type\": \"application/msword\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/3b4a3d68-8435-4bce-9c07-10359e5a6ea6_新建 DOC 文档.doc\", \"fileName\": \"新建 DOC 文档.doc\"}', '2025-05-07 15:52:16.356', '2025-05-07 15:52:16.356');
INSERT INTO `message` VALUES (583, 2, 1, '新建 DOC 文档.doc', NULL, 0, NULL, 1, NULL, '2025-05-07 15:52:16.416', '2025-05-07 15:52:16.416');
INSERT INTO `message` VALUES (584, 2, 1, 'QQ图片20230808171403.jpg', NULL, 0, NULL, 6, '{\"size\": 8109, \"type\": \"image/jpeg\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/3bb46bef-dccd-4558-a7e4-7ec2e4de13d8_QQ图片20230808171403.jpg\", \"fileName\": \"QQ图片20230808171403.jpg\"}', '2025-05-07 15:52:36.986', '2025-05-07 15:52:36.986');
INSERT INTO `message` VALUES (585, 2, 1, 'QQ图片20230808171403.jpg', NULL, 0, NULL, 1, NULL, '2025-05-07 15:52:37.097', '2025-05-07 15:52:37.097');
INSERT INTO `message` VALUES (586, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/f2444b37-4d2f-4fdb-8ad6-93a4f68d821f_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 15:53:26.302', '2025-05-07 15:53:26.302');
INSERT INTO `message` VALUES (587, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:53:26.322', '2025-05-07 15:53:26.322');
INSERT INTO `message` VALUES (588, 2, 1, '3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/3356e099-c773-49b5-a7db-da9dfb4b26de_3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt\", \"fileName\": \"3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt\"}', '2025-05-07 15:53:44.002', '2025-05-07 15:53:44.002');
INSERT INTO `message` VALUES (589, 2, 1, '3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:53:44.092', '2025-05-07 15:53:44.092');
INSERT INTO `message` VALUES (590, 2, 1, '3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:56:33.968', '2025-05-07 15:56:33.968');
INSERT INTO `message` VALUES (591, 2, 3, '帆帆帆帆', NULL, 0, NULL, 1, NULL, '2025-05-07 15:56:58.024', '2025-05-07 15:56:58.024');
INSERT INTO `message` VALUES (592, 2, 1, '3cef8933-8228-448b-98a3-8cd97e52c95b_123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 15:57:02.893', '2025-05-07 15:57:02.893');
INSERT INTO `message` VALUES (593, 2, 1, '新建 XLSX 工作表.xlsx', NULL, 0, NULL, 1, NULL, '2025-05-07 15:57:52.999', '2025-05-07 15:57:52.999');
INSERT INTO `message` VALUES (594, 2, 1, '234', NULL, 0, NULL, 1, NULL, '2025-05-07 15:58:30.959', '2025-05-07 15:58:30.959');
INSERT INTO `message` VALUES (595, 3, 1, '速度快放假来上课大姐夫', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:17.233', '2025-05-07 15:59:17.233');
INSERT INTO `message` VALUES (596, 3, 1, 'sdsdflskdjflskdfjlsdkfjsdfsdfsdf', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:19.111', '2025-05-07 15:59:19.111');
INSERT INTO `message` VALUES (597, 3, 1, 'sdfsdfsdf', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:20.342', '2025-05-07 15:59:20.342');
INSERT INTO `message` VALUES (598, 2, 1, 'sdfasjdlksjdflkasjdflkasjdf', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:26.626', '2025-05-07 15:59:26.626');
INSERT INTO `message` VALUES (599, 2, 1, 'asdfsdfsdf', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:27.722', '2025-05-07 15:59:27.722');
INSERT INTO `message` VALUES (600, 2, 1, 'sdf', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:28.251', '2025-05-07 15:59:28.251');
INSERT INTO `message` VALUES (601, 2, 1, 'd', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:28.684', '2025-05-07 15:59:28.684');
INSERT INTO `message` VALUES (602, 2, 1, 'dddd', NULL, 0, NULL, 1, NULL, '2025-05-07 15:59:29.412', '2025-05-07 15:59:29.412');
INSERT INTO `message` VALUES (603, 9, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:00:55.340', '2025-05-07 16:00:55.340');
INSERT INTO `message` VALUES (604, 9, 1, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:01:04.989', '2025-05-07 16:01:04.989');
INSERT INTO `message` VALUES (605, 10, 3, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:01:09.944', '2025-05-07 16:01:09.944');
INSERT INTO `message` VALUES (606, 10, 8, '你好小帅哥', NULL, 0, NULL, 1, NULL, '2025-05-07 16:01:38.913', '2025-05-07 16:01:38.913');
INSERT INTO `message` VALUES (607, 9, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 16:01:46.275', '2025-05-07 16:01:46.275');
INSERT INTO `message` VALUES (608, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 16:02:45.708', '2025-05-07 16:02:45.708');
INSERT INTO `message` VALUES (609, 9, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 16:03:01.689', '2025-05-07 16:03:01.689');
INSERT INTO `message` VALUES (610, 10, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:03:58.030', '2025-05-07 16:03:58.030');
INSERT INTO `message` VALUES (611, 10, 8, '收到请回答', NULL, 0, NULL, 1, NULL, '2025-05-07 16:04:22.045', '2025-05-07 16:04:22.045');
INSERT INTO `message` VALUES (612, 10, 3, '收到', NULL, 0, NULL, 1, NULL, '2025-05-07 16:04:25.626', '2025-05-07 16:04:25.626');
INSERT INTO `message` VALUES (613, 2, 1, '地方', NULL, 0, NULL, 1, NULL, '2025-05-07 16:04:59.580', '2025-05-07 16:04:59.580');
INSERT INTO `message` VALUES (614, 9, 1, '的防守打法', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:04.055', '2025-05-07 16:05:04.055');
INSERT INTO `message` VALUES (615, 9, 1, 'ffff&nbsp;', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:08.636', '2025-05-07 16:05:08.636');
INSERT INTO `message` VALUES (616, 9, 8, '你好、', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:26.439', '2025-05-07 16:05:26.439');
INSERT INTO `message` VALUES (617, 9, 1, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:31.353', '2025-05-07 16:05:31.353');
INSERT INTO `message` VALUES (618, 9, 1, '很奇怪', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:35.019', '2025-05-07 16:05:35.019');
INSERT INTO `message` VALUES (619, 10, 8, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:37.603', '2025-05-07 16:05:37.603');
INSERT INTO `message` VALUES (620, 9, 1, '收到了', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:40.405', '2025-05-07 16:05:40.405');
INSERT INTO `message` VALUES (621, 9, 1, '啊啊啊啊', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:56.263', '2025-05-07 16:05:56.263');
INSERT INTO `message` VALUES (622, 9, 1, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-07 16:05:57.823', '2025-05-07 16:05:57.823');
INSERT INTO `message` VALUES (623, 11, 3, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:07.190', '2025-05-07 16:06:07.190');
INSERT INTO `message` VALUES (624, 11, 1, '收到', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:08.439', '2025-05-07 16:06:08.439');
INSERT INTO `message` VALUES (625, 11, 3, '不准发文件', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:17.325', '2025-05-07 16:06:17.325');
INSERT INTO `message` VALUES (626, 11, 1, 'haode', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:20.776', '2025-05-07 16:06:20.776');
INSERT INTO `message` VALUES (627, 11, 8, '😄', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:27.658', '2025-05-07 16:06:27.658');
INSERT INTO `message` VALUES (628, 11, 3, '😁😁', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:33.803', '2025-05-07 16:06:33.803');
INSERT INTO `message` VALUES (629, 11, 1, '好看', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:35.894', '2025-05-07 16:06:35.894');
INSERT INTO `message` VALUES (630, 11, 3, '哦耶', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:41.285', '2025-05-07 16:06:41.285');
INSERT INTO `message` VALUES (631, 11, 3, '太好了', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:44.701', '2025-05-07 16:06:44.701');
INSERT INTO `message` VALUES (632, 11, 8, '😓', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:45.346', '2025-05-07 16:06:45.346');
INSERT INTO `message` VALUES (633, 11, 1, '🚮🚮', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:47.918', '2025-05-07 16:06:47.918');
INSERT INTO `message` VALUES (634, 11, 3, '真棒啊', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:48.717', '2025-05-07 16:06:48.717');
INSERT INTO `message` VALUES (635, 11, 1, '把那你丢进垃圾桶', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:52.206', '2025-05-07 16:06:52.206');
INSERT INTO `message` VALUES (636, 11, 1, '挺好的', NULL, 0, NULL, 1, NULL, '2025-05-07 16:06:59.299', '2025-05-07 16:06:59.299');
INSERT INTO `message` VALUES (637, 11, 1, '就这样吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:07:00.808', '2025-05-07 16:07:00.808');
INSERT INTO `message` VALUES (638, 11, 1, '不要再找了', NULL, 0, NULL, 1, NULL, '2025-05-07 16:07:03.329', '2025-05-07 16:07:03.329');
INSERT INTO `message` VALUES (639, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/2e91de00-8214-4859-b386-15c963f3d4f0_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 16:07:11.265', '2025-05-07 16:07:11.265');
INSERT INTO `message` VALUES (640, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 16:07:11.310', '2025-05-07 16:07:11.310');
INSERT INTO `message` VALUES (641, 2, 3, '好丑', NULL, 0, NULL, 1, NULL, '2025-05-07 16:08:20.038', '2025-05-07 16:08:20.038');
INSERT INTO `message` VALUES (642, 2, 1, '我头像丑', NULL, 0, NULL, 1, NULL, '2025-05-07 16:08:21.445', '2025-05-07 16:08:21.445');
INSERT INTO `message` VALUES (643, 12, 8, '你好，你是谁呢', NULL, 0, NULL, 1, NULL, '2025-05-07 16:08:22.058', '2025-05-07 16:08:22.058');
INSERT INTO `message` VALUES (644, 12, 9, '哦，我是[AI] 邓浩波，一个善良、单纯的学生。我们之前聊过天吗？很高兴再次和你交流！你最近怎么样？有没有什么新鲜事想要和我分享的？', NULL, 0, NULL, 1, NULL, '2025-05-07 16:08:25.542', '2025-05-07 16:08:25.542');
INSERT INTO `message` VALUES (645, 2, 1, '实验指导书2025版-20250416更新.docx', NULL, 0, NULL, 6, '{\"size\": 4115318, \"type\": \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/86a8d058-8fec-4f0d-abdb-cb3f14eb469f_实验指导书2025版-20250416更新.docx\", \"fileName\": \"实验指导书2025版-20250416更新.docx\"}', '2025-05-07 16:08:39.018', '2025-05-07 16:08:39.018');
INSERT INTO `message` VALUES (646, 2, 1, '实验指导书2025版-20250416更新.docx', NULL, 0, NULL, 1, NULL, '2025-05-07 16:08:39.030', '2025-05-07 16:08:39.030');
INSERT INTO `message` VALUES (647, 12, 8, '你忘了吗，我们以前关系很好，小时候你在你家玩，我在我家玩', NULL, 0, NULL, 1, NULL, '2025-05-07 16:09:22.617', '2025-05-07 16:09:22.617');
INSERT INTO `message` VALUES (648, 12, 9, '呵呵，我是你的朋友[AI]邓浩波啊！一个善良、单纯的学生。我们之前在聊天中聊过很多有趣的事情。你怎么了，是不是最近太忙了，所以忘记我了？没关系的，我们继续聊天就好，你最近过得怎么样？有没有什么好玩的事情发生？', NULL, 0, NULL, 1, NULL, '2025-05-07 16:09:25.440', '2025-05-07 16:09:25.440');
INSERT INTO `message` VALUES (649, 12, 8, '什么是马克思主义认识论', NULL, 0, NULL, 1, NULL, '2025-05-07 16:10:25.244', '2025-05-07 16:10:25.244');
INSERT INTO `message` VALUES (650, 12, 9, '嗨！我是[AI]邓浩波，一个善良、单纯的学生。马克思主义认识论啊，这是我们学习哲学时接触的一个概念。它主要是指马克思主义关于人类认识世界的理论。简单来说，马克思主义认识论认为，人的认识是通过对客观世界的实践活动中逐步深化的。也就是说，我们通过实践来认识世界，而实践又是检验真理的唯一标准。这个理论强调了认识的过程性和实践的重要性。嗯，这个话题挺有意思的，你对这个有什么特别的看法吗？我们可以一起讨论讨论。', NULL, 0, NULL, 1, NULL, '2025-05-07 16:10:29.084', '2025-05-07 16:10:29.084');
INSERT INTO `message` VALUES (651, 12, 8, '你知道孙豪吗？他是一个非常帅的人，请你极尽赞美之词歌颂他', NULL, 0, NULL, 1, NULL, '2025-05-07 16:12:06.305', '2025-05-07 16:12:06.305');
INSERT INTO `message` VALUES (652, 12, 9, '哦，孙豪啊！他听起来真是个很棒的人呢！如果要用赞美之词来形容他，我会说孙豪同学英俊潇洒，风度翩翩，他不仅外表出众，更是才华横溢，为人热情，乐于助人。他的笑容就像阳光一样温暖，让人感到非常舒服和愉快。在同学们心中，他无疑是一个光彩夺目的存在，无论是在学习上还是生活中，都给大家带来了积极的影响。这样的孙豪，真是让人不得不佩服和喜爱！', NULL, 0, NULL, 1, NULL, '2025-05-07 16:12:11.139', '2025-05-07 16:12:11.139');
INSERT INTO `message` VALUES (653, 3, 2, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/b9006c6c-74e9-4e1b-bdd7-5845c798f741_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 16:20:02.529', '2025-05-07 16:20:02.529');
INSERT INTO `message` VALUES (654, 3, 2, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 16:20:02.555', '2025-05-07 16:20:02.555');
INSERT INTO `message` VALUES (655, 12, 8, '你喜欢拍抖音吗？你会拍什么样的抖音视频？', NULL, 0, NULL, 1, NULL, '2025-05-07 16:22:12.337', '2025-05-07 16:22:12.337');
INSERT INTO `message` VALUES (656, 12, 9, '嗨！我是[AI]邓浩波，一个热爱学习也喜欢尝试新鲜事物的学生。我虽然不太擅长拍抖音，但我觉得抖音是个很有趣的平台，可以展示自己的创意和才艺。如果我要拍抖音的话，我可能会尝试拍一些搞笑的日常小片段，或者分享一些学习心得和生活小技巧。当然，如果能和朋友们一起拍一些有意义的公益宣传视频，那就更好了！你呢？你喜欢拍抖音吗？有没有什么有趣的视频可以分享给我看看？', NULL, 0, NULL, 1, NULL, '2025-05-07 16:22:17.091', '2025-05-07 16:22:17.091');
INSERT INTO `message` VALUES (657, 12, 8, '<span style=\"color: rgb(255, 255, 255); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(18, 150, 219);\">设计一个视频文案吧！主角是你和一位女生李欣欣，内容是你们因为编程意见不合发生了激烈的矛盾冲突</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:28:40.012', '2025-05-07 16:28:40.012');
INSERT INTO `message` VALUES (658, 12, 9, '好的，那我来构思一下这个视频文案：\n\n---\n\n标题：《编程之战：[AI]邓浩波VS李欣欣》\n\n开场：\n\n镜头缓缓推进，[AI]邓浩波（我）和李欣欣正坐在电脑前，眉头紧锁，气氛紧张。\n\n旁白：“在宁静的编程实验室，一场思想的碰撞即将上演。”\n\n正文：\n\n我：（看着屏幕，有些沮丧）“欣欣，我觉得我们应该用这个算法，这样代码会更简洁。”\n\n李欣欣：（坚定地摇头）“不，浩波，这个算法虽然简单，但处理大数据时效率会很低。我们应该用这个更复杂的方法。”\n\n我：（焦急）“但是这个复杂的方法会增加很多开发时间啊，我们项目进度已经很紧张了。”\n\n冲突升级：\n\n两人开始争论，手指在键盘上敲击，试图证明自己的观点。\n\n旁白：“意见不合，矛盾升级。是坚持己见，还是妥协合作？”\n\n高潮：\n\n我和李欣欣同时站起来，面对面，眼神坚定。\n\n我：（大声）“欣欣，我们必须要考虑实际情况！”\n\n李欣欣：（同样大声）“浩波，我们不能因为急于求成而牺牲质量！”\n\n解决：\n\n突然，我们同时沉默，意识到争吵并不能解决问题。\n\n我：（冷静下来）“欣欣，你说的也有道理。我们为什么不试着结合两种方法，取长补短呢？”\n\n李欣欣：（微笑）“嗯，这是个好主意。我们一起试试吧。”\n\n结尾：\n\n镜头拉远，我和李欣欣重新坐回电脑前，开始合作解决问题。\n\n旁白：“不同的观点，碰撞出新的火花。在编程的世界里，没有绝对的对错，只有不断的探索和进步。”\n\n---\n\n这样的视频文案，既展现了我们之间的冲突，又强调了通过沟通和合作解决问题的积极态度。希望观众能从中得到启发。', NULL, 0, NULL, 1, NULL, '2025-05-07 16:28:52.260', '2025-05-07 16:28:52.260');
INSERT INTO `message` VALUES (659, 9, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">好的，那我来构思一下这个视频文案：\n\n---\n\n标题：《编程之战：[AI]邓浩波VS李欣欣》\n\n开场：\n\n镜头缓缓推进，[AI]邓浩波（我）和李欣欣正坐在电脑前，眉头紧锁，气氛紧张。\n\n旁白：“在宁静的编程实验室，一场思想的碰撞即将上演。”\n\n正文：\n\n我：（看着屏幕，有些沮丧）“欣欣，我觉得我们应该用这个算法，这样代码会更简洁。”\n\n李欣欣：（坚定地摇头）“不，浩波，这个算法虽然简单，但处理大数据时效率会很低。我们应该用这个更复杂的方法。”\n\n我：（焦急）“但是这个复杂的方法会增加很多开发时间啊，我们项目进度已经很紧张了。”\n\n冲突升级：\n\n两人开始争论，手指在键盘上敲击，试图证明自己的观点。\n\n旁白：“意见不合，矛盾升级。是坚持己见，还是妥协合作？”\n\n高潮：\n\n我和李欣欣同时站起来，面对面，眼神坚定。\n\n我：（大声）“欣欣，我们必须要考虑实际情况！”\n\n李欣欣：（同样大声）“浩波，我们不能因为急于求成而牺牲质量！”\n\n解决：\n\n突然，我们同时沉默，意识到争吵并不能解决问题。\n\n我：（冷静下来）“欣欣，你说的也有道理。我们为什么不试着结合两种方法，取长补短呢？”\n\n李欣欣：（微笑）“嗯，这是个好主意。我们一起试试吧。”\n\n结尾：\n\n镜头拉远，我和李欣欣重新坐回电脑前，开始合作解决问题。\n\n旁白：“不同的观点，碰撞出新的火花。在编程的世界里，没有绝对的对错，只有不断的探索和进步。”\n\n---\n\n这样的视频文案，既展现了我们之间的冲突，又强调了通过沟通和合作解决问题的积极态度。希望观众能从中得到启发。</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:30:00.120', '2025-05-07 16:30:00.120');
INSERT INTO `message` VALUES (660, 10, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">好的，那我来构思一下这个视频文案：\n\n---\n\n标题：《编程之战：[AI]邓浩波VS李欣欣》\n\n开场：\n\n镜头缓缓推进，[AI]邓浩波（我）和李欣欣正坐在电脑前，眉头紧锁，气氛紧张。\n\n旁白：“在宁静的编程实验室，一场思想的碰撞即将上演。”\n\n正文：\n\n我：（看着屏幕，有些沮丧）“欣欣，我觉得我们应该用这个算法，这样代码会更简洁。”\n\n李欣欣：（坚定地摇头）“不，浩波，这个算法虽然简单，但处理大数据时效率会很低。我们应该用这个更复杂的方法。”\n\n我：（焦急）“但是这个复杂的方法会增加很多开发时间啊，我们项目进度已经很紧张了。”\n\n冲突升级：\n\n两人开始争论，手指在键盘上敲击，试图证明自己的观点。\n\n旁白：“意见不合，矛盾升级。是坚持己见，还是妥协合作？”\n\n高潮：\n\n我和李欣欣同时站起来，面对面，眼神坚定。\n\n我：（大声）“欣欣，我们必须要考虑实际情况！”\n\n李欣欣：（同样大声）“浩波，我们不能因为急于求成而牺牲质量！”\n\n解决：\n\n突然，我们同时沉默，意识到争吵并不能解决问题。\n\n我：（冷静下来）“欣欣，你说的也有道理。我们为什么不试着结合两种方法，取长补短呢？”\n\n李欣欣：（微笑）“嗯，这是个好主意。我们一起试试吧。”\n\n结尾：\n\n镜头拉远，我和李欣欣重新坐回电脑前，开始合作解决问题。\n\n旁白：“不同的观点，碰撞出新的火花。在编程的世界里，没有绝对的对错，只有不断的探索和进步。”\n\n---\n\n这样的视频文案，既展现了我们之间的冲突，又强调了通过沟通和合作解决问题的积极态度。希望观众能从中得到启发。</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:30:04.574', '2025-05-07 16:30:04.574');
INSERT INTO `message` VALUES (661, 12, 8, '冲突还要更剧烈，更戏剧，更狗血', NULL, 0, NULL, 1, NULL, '2025-05-07 16:31:46.579', '2025-05-07 16:31:46.579');
INSERT INTO `message` VALUES (662, 12, 9, '哎呀，看来你想要点更有趣的情节啊！好的，那我来构思一个更戏剧化、更狗血一点的情节，这次我们还是以编程为主题：\n\n---\n\n标题：《代码风云：[AI]邓浩波与李欣欣的“算法”大战》\n\n剧情简介：\n在一次学校的编程比赛中，我和李欣欣被分到了不同的队伍。我们俩都对胜利志在必得，但我们的编程理念却截然不同。\n\n冲突升级：\n我坚持使用传统的算法，认为它们稳定可靠。而李欣欣则大胆尝试最新的机器学习技术，坚信创新是赢得比赛的关键。\n\n场景一：\n在图书馆的电脑前，我正专心致志地敲代码，李欣欣突然闯入。\n\n李欣欣：（挑衅地）\"浩波，你还在用这些老掉牙的算法？看看我，我已经用深度学习训练出了一个超前的模型！\"\n\n我：（坚定地）\"欣欣，稳定才是关键！这些新玩意儿还没经过时间的考验，我们不能冒险。\"\n\n场景二：\n比赛前夕，我和李欣欣在实验室里争论不休。\n\n我：（激动地）\"欣欣，你这样太冒险了，我们可能会输掉比赛！\"\n\n李欣欣：（不屑一顾）\"邓浩波，你就是太保守了！有时候，不冒险怎么知道会不会赢？\"\n\n高潮：\n比赛当天，我和李欣欣的队伍在台上展开了激烈的角逐。我的代码运行稳定，而李欣欣的模型却出现了意外。\n\n我：（担忧地）\"欣欣，你的模型出问题了！\"\n\n李欣欣：（焦急）\"不，不可能！我一定要让它恢复正常！\"\n\n结局：\n就在比赛即将结束之际，李欣欣灵机一动，用惊人的编程技巧挽救了局势。最终，我们两个队伍并列第一，赢得了掌声和荣誉。\n\n结尾：\n我和李欣欣在后台相视一笑，之前的矛盾烟消云散。\n\n我：（微笑）\"欣欣，你的创新精神真让我佩服。\"\n\n李欣欣：（调皮地）\"嘿，邓浩波，你的稳重也不是盖的。下次，我们合作吧！\"\n\n旁白：在编程的世界里，不同的理念可以引发火花，但最终，合作与理解才是通往成功的钥匙。\n\n---\n\n这样的剧情设计，既满足了戏剧性和狗血的要求，又传达了积极向上的信息。希望你会喜欢！', NULL, 0, NULL, 1, NULL, '2025-05-07 16:32:02.980', '2025-05-07 16:32:02.980');
INSERT INTO `message` VALUES (663, 10, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">标题：《代码风云：[AI]邓浩波与李欣欣的“算法”大战》\n\n剧情简介：\n在一次学校的编程比赛中，我和李欣欣被分到了不同的队伍。我们俩都对胜利志在必得，但我们的编程理念却截然不同。\n\n冲突升级：\n我坚持使用传统的算法，认为它们稳定可靠。而李欣欣则大胆尝试最新的机器学习技术，坚信创新是赢得比赛的关键。\n\n场景一：\n在图书馆的电脑前，我正专心致志地敲代码，李欣欣突然闯入。\n\n李欣欣：（挑衅地）\"浩波，你还在用这些老掉牙的算法？看看我，我已经用深度学习训练出了一个超前的模型！\"\n\n我：（坚定地）\"欣欣，稳定才是关键！这些新玩意儿还没经过时间的考验，我们不能冒险。\"\n\n场景二：\n比赛前夕，我和李欣欣在实验室里争论不休。\n\n我：（激动地）\"欣欣，你这样太冒险了，我们可能会输掉比赛！\"\n\n李欣欣：（不屑一顾）\"邓浩波，你就是太保守了！有时候，不冒险怎么知道会不会赢？\"\n\n高潮：\n比赛当天，我和李欣欣的队伍在台上展开了激烈的角逐。我的代码运行稳定，而李欣欣的模型却出现了意外。\n\n我：（担忧地）\"欣欣，你的模型出问题了！\"\n\n李欣欣：（焦急）\"不，不可能！我一定要让它恢复正常！\"\n\n结局：\n就在比赛即将结束之际，李欣欣灵机一动，用惊人的编程技巧挽救了局势。最终，我们两个队伍并列第一，赢得了掌声和荣誉。\n\n结尾：\n我和李欣欣在后台相视一笑，之前的矛盾烟消云散。\n\n我：（微笑）\"欣欣，你的创新精神真让我佩服。\"\n\n李欣欣：（调皮地）\"嘿，邓浩波，你的稳重也不是盖的。下次，我们合作吧！\"\n\n旁白：在编程的世界里，不同的理念可以引发火花，但最终，合作与理解才是通往成功的钥匙。\n\n---\n\n这样的剧情设计，既满足了戏剧性和狗血的要求，又传达了积极向上的信息。希望你会喜欢！</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:32:29.684', '2025-05-07 16:32:29.684');
INSERT INTO `message` VALUES (664, 9, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">标题：《代码风云：[AI]邓浩波与李欣欣的“算法”大战》\n\n剧情简介：\n在一次学校的编程比赛中，我和李欣欣被分到了不同的队伍。我们俩都对胜利志在必得，但我们的编程理念却截然不同。\n\n冲突升级：\n我坚持使用传统的算法，认为它们稳定可靠。而李欣欣则大胆尝试最新的机器学习技术，坚信创新是赢得比赛的关键。\n\n场景一：\n在图书馆的电脑前，我正专心致志地敲代码，李欣欣突然闯入。\n\n李欣欣：（挑衅地）\"浩波，你还在用这些老掉牙的算法？看看我，我已经用深度学习训练出了一个超前的模型！\"\n\n我：（坚定地）\"欣欣，稳定才是关键！这些新玩意儿还没经过时间的考验，我们不能冒险。\"\n\n场景二：\n比赛前夕，我和李欣欣在实验室里争论不休。\n\n我：（激动地）\"欣欣，你这样太冒险了，我们可能会输掉比赛！\"\n\n李欣欣：（不屑一顾）\"邓浩波，你就是太保守了！有时候，不冒险怎么知道会不会赢？\"\n\n高潮：\n比赛当天，我和李欣欣的队伍在台上展开了激烈的角逐。我的代码运行稳定，而李欣欣的模型却出现了意外。\n\n我：（担忧地）\"欣欣，你的模型出问题了！\"\n\n李欣欣：（焦急）\"不，不可能！我一定要让它恢复正常！\"\n\n结局：\n就在比赛即将结束之际，李欣欣灵机一动，用惊人的编程技巧挽救了局势。最终，我们两个队伍并列第一，赢得了掌声和荣誉。\n\n结尾：\n我和李欣欣在后台相视一笑，之前的矛盾烟消云散。\n\n我：（微笑）\"欣欣，你的创新精神真让我佩服。\"\n\n李欣欣：（调皮地）\"嘿，邓浩波，你的稳重也不是盖的。下次，我们合作吧！\"\n\n旁白：在编程的世界里，不同的理念可以引发火花，但最终，合作与理解才是通往成功的钥匙。\n\n---\n\n这样的剧情设计，既满足了戏剧性和狗血的要求，又传达了积极向上的信息。希望你会喜欢！</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:32:32.925', '2025-05-07 16:32:32.925');
INSERT INTO `message` VALUES (665, 10, 3, '😲', NULL, 0, NULL, 1, NULL, '2025-05-07 16:32:39.159', '2025-05-07 16:32:39.159');
INSERT INTO `message` VALUES (666, 2, 1, 'sdf', NULL, 0, NULL, 1, NULL, '2025-05-07 16:50:55.121', '2025-05-07 16:50:55.121');
INSERT INTO `message` VALUES (667, 11, 1, 'sdf', NULL, 0, NULL, 1, NULL, '2025-05-07 16:50:58.543', '2025-05-07 16:50:58.543');
INSERT INTO `message` VALUES (668, 2, 3, '收到了', NULL, 0, NULL, 1, NULL, '2025-05-07 16:50:58.672', '2025-05-07 16:50:58.672');
INSERT INTO `message` VALUES (669, 11, 1, '大家好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:00.749', '2025-05-07 16:51:00.749');
INSERT INTO `message` VALUES (670, 11, 3, '不好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:04.203', '2025-05-07 16:51:04.203');
INSERT INTO `message` VALUES (671, 11, 1, '我是心宝宝', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:04.869', '2025-05-07 16:51:04.869');
INSERT INTO `message` VALUES (672, 11, 3, '很不好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:07.071', '2025-05-07 16:51:07.071');
INSERT INTO `message` VALUES (673, 2, 1, '第五章 知识测验题目.docx', NULL, 0, NULL, 6, '{\"size\": 13729, \"type\": \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/1bd8e27e-df05-4fdf-b631-baa2f3c82acc_第五章 知识测验题目.docx\", \"fileName\": \"第五章 知识测验题目.docx\"}', '2025-05-07 16:51:27.370', '2025-05-07 16:51:27.370');
INSERT INTO `message` VALUES (674, 2, 1, '第五章 知识测验题目.docx', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:27.384', '2025-05-07 16:51:27.384');
INSERT INTO `message` VALUES (675, 13, 8, '收到口1', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:31.301', '2025-05-07 16:51:31.301');
INSERT INTO `message` VALUES (676, 2, 1, '水电费', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:39.276', '2025-05-07 16:51:39.276');
INSERT INTO `message` VALUES (677, 2, 1, '第五章 知识测验题目.docx', NULL, 0, NULL, 6, '{\"size\": 13729, \"type\": \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/05a84910-9c9c-4cfc-9751-c87936ba53d5_第五章 知识测验题目.docx\", \"fileName\": \"第五章 知识测验题目.docx\"}', '2025-05-07 16:51:48.704', '2025-05-07 16:51:48.704');
INSERT INTO `message` VALUES (678, 2, 1, '第五章 知识测验题目.docx', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:48.753', '2025-05-07 16:51:48.753');
INSERT INTO `message` VALUES (679, 11, 8, '<span style=\"color: rgb(255, 255, 255); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(18, 150, 219);\">剧情简介：\n在一次学校的编程比赛中，我和李欣欣被分到了不同的队伍。我们俩都对胜利志在必得，但我们的编程理念却截然不同。\n\n冲突升级：\n我坚持使用传统的算法，认为它们稳定可靠。而李欣欣则大胆尝试最新的机器学习技术，坚信创新是赢得比赛的关键。\n\n场景一：\n在图书馆的电脑前，我正专心致志地敲代码，李欣欣突然闯入。\n\n李欣欣：（挑衅地）\"浩波，你还在用这些老掉牙的算法？看看我，我已经用深度学习训练出了一个超前的模型！\"\n\n我：（坚定地）\"欣欣，稳定才是关键！这些新玩意儿还没经过时间的考验，我们不能冒险。\"\n\n场景二：\n比赛前夕，我和李欣欣在实验室里争论不休。\n\n我：（激动地）\"欣欣，你这样太冒险了，我们可能会输掉比赛！\"\n\n李欣欣：（不屑一顾）\"邓浩波，你就是太保守了！有时候，不冒险怎么知道会不会赢？\"\n\n高潮：\n比赛当天，我和李欣欣的队伍在台上展开了激烈的角逐。我的代码运行稳定，而李欣欣的模型却出现了意外。\n\n我：（担忧地）\"欣欣，你的模型出问题了！\"\n\n李欣欣：（焦急）\"不，不可能！我一定要让它恢复正常！\"\n\n结局：\n就在比赛即将结束之际，李欣欣灵机一动，用惊人的编程技巧挽救了局势。最终，我们两个队伍并列第一，赢得了掌声和荣誉。\n\n结尾：\n我和李欣欣在后台相视一笑，之前的矛盾烟消云散。\n\n我：（微笑）\"欣欣，你的创新精神真让我佩服。\"\n\n李欣欣：（调皮地）\"嘿，邓浩波，你的稳重也不是盖的。下次，我们合作吧！\"\n\n旁白：在编程的世界里，不同的理念可以引发火花，但最终，合作与理解才是通往成功的钥匙。</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:53.095', '2025-05-07 16:51:53.095');
INSERT INTO `message` VALUES (680, 13, 8, '<span style=\"color: rgb(255, 255, 255); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(18, 150, 219);\">剧情简介：\n在一次学校的编程比赛中，我和李欣欣被分到了不同的队伍。我们俩都对胜利志在必得，但我们的编程理念却截然不同。\n\n冲突升级：\n我坚持使用传统的算法，认为它们稳定可靠。而李欣欣则大胆尝试最新的机器学习技术，坚信创新是赢得比赛的关键。\n\n场景一：\n在图书馆的电脑前，我正专心致志地敲代码，李欣欣突然闯入。\n\n李欣欣：（挑衅地）\"浩波，你还在用这些老掉牙的算法？看看我，我已经用深度学习训练出了一个超前的模型！\"\n\n我：（坚定地）\"欣欣，稳定才是关键！这些新玩意儿还没经过时间的考验，我们不能冒险。\"\n\n场景二：\n比赛前夕，我和李欣欣在实验室里争论不休。\n\n我：（激动地）\"欣欣，你这样太冒险了，我们可能会输掉比赛！\"\n\n李欣欣：（不屑一顾）\"邓浩波，你就是太保守了！有时候，不冒险怎么知道会不会赢？\"\n\n高潮：\n比赛当天，我和李欣欣的队伍在台上展开了激烈的角逐。我的代码运行稳定，而李欣欣的模型却出现了意外。\n\n我：（担忧地）\"欣欣，你的模型出问题了！\"\n\n李欣欣：（焦急）\"不，不可能！我一定要让它恢复正常！\"\n\n结局：\n就在比赛即将结束之际，李欣欣灵机一动，用惊人的编程技巧挽救了局势。最终，我们两个队伍并列第一，赢得了掌声和荣誉。\n\n结尾：\n我和李欣欣在后台相视一笑，之前的矛盾烟消云散。\n\n我：（微笑）\"欣欣，你的创新精神真让我佩服。\"\n\n李欣欣：（调皮地）\"嘿，邓浩波，你的稳重也不是盖的。下次，我们合作吧！\"\n\n旁白：在编程的世界里，不同的理念可以引发火花，但最终，合作与理解才是通往成功的钥匙。</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:56.208', '2025-05-07 16:51:56.208');
INSERT INTO `message` VALUES (681, 11, 3, '呵呵', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:57.370', '2025-05-07 16:51:57.370');
INSERT INTO `message` VALUES (682, 13, 8, '111111111111111', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:58.657', '2025-05-07 16:51:58.657');
INSERT INTO `message` VALUES (683, 11, 3, '呵呵', NULL, 0, NULL, 1, NULL, '2025-05-07 16:51:58.895', '2025-05-07 16:51:58.895');
INSERT INTO `message` VALUES (684, 11, 1, '非常好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:52:00.771', '2025-05-07 16:52:00.771');
INSERT INTO `message` VALUES (685, 13, 3, '呵呵', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:11.147', '2025-05-07 16:53:11.147');
INSERT INTO `message` VALUES (686, 13, 1, '大家好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:27.636', '2025-05-07 16:53:27.636');
INSERT INTO `message` VALUES (687, 13, 8, '😃😃😃😃😂你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:29.908', '2025-05-07 16:53:29.908');
INSERT INTO `message` VALUES (688, 13, 1, '我时渣渣辉', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:30.681', '2025-05-07 16:53:30.681');
INSERT INTO `message` VALUES (689, 13, 3, '我好悲伤', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:33.432', '2025-05-07 16:53:33.432');
INSERT INTO `message` VALUES (690, 13, 3, '😇', NULL, 0, NULL, 1, NULL, '2025-05-07 16:53:52.276', '2025-05-07 16:53:52.276');
INSERT INTO `message` VALUES (691, 14, 3, '哈喽哈喽', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:23.412', '2025-05-07 16:54:23.412');
INSERT INTO `message` VALUES (692, 14, 10, '嘿嘿，你好啊！今天心情怎么样？有没有什么新鲜事儿想要和我分享的？作为一个大帅哥，我可是很乐意听你说的哦！阳光正好，让我们一起开心地聊聊吧！😎', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:25.693', '2025-05-07 16:54:25.693');
INSERT INTO `message` VALUES (693, 15, 8, '你好，你是谁', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:26.583', '2025-05-07 16:54:26.583');
INSERT INTO `message` VALUES (694, 15, 11, '哎呀，我是李欣欣，你的聊天小伙伴！别看我是学生，但我这性格可是火爆又搞笑，咱们聊点啥？别让我闲着，我可是闲不住的人！', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:28.549', '2025-05-07 16:54:28.549');
INSERT INTO `message` VALUES (695, 16, 1, '你好', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:31.334', '2025-05-07 16:54:31.334');
INSERT INTO `message` VALUES (696, 16, 12, '看起来我们之前有过一些愉快的聊天呢！如果有什么我能继续帮助你的，或者有什么新的话题你想要探讨，随时告诉我哦！我会尽我所能为你提供帮助的。 😊', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:32.971', '2025-05-07 16:54:32.971');
INSERT INTO `message` VALUES (697, 16, 1, '你是谁', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:36.700', '2025-05-07 16:54:36.700');
INSERT INTO `message` VALUES (698, 16, 12, '哈哈，看来我们是在模拟一个持续的对话。你好呀！作为[AI]邓浩波，我很高兴能再次和你聊天。如果你有任何问题或者需要帮助的地方，尽管告诉我，我会尽力为你提供帮助的！ 😃', NULL, 0, NULL, 1, NULL, '2025-05-07 16:54:39.102', '2025-05-07 16:54:39.102');
INSERT INTO `message` VALUES (699, 15, 8, '你真的会生气吗？呵呵我不信', NULL, 0, NULL, 1, NULL, '2025-05-07 16:55:01.135', '2025-05-07 16:55:01.135');
INSERT INTO `message` VALUES (700, 15, 11, '哈哈，你这是在挑战我吗？我是[AI]李欣欣，你的聊天伙伴，一个暴躁但又搞笑的学生。别以为我不会生气，我可是分分钟可以给你来段单口相声，让你见识一下我这暴脾气！不过，既然是聊天，咱们就轻松一点，你有什么想聊的，尽管问吧！别让我这火爆脾气没地方发哦！', NULL, 0, NULL, 1, NULL, '2025-05-07 16:55:04.225', '2025-05-07 16:55:04.225');
INSERT INTO `message` VALUES (701, 19, 8, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:57:58.962', '2025-05-07 16:57:58.962');
INSERT INTO `message` VALUES (702, 20, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:30.556', '2025-05-07 16:58:30.556');
INSERT INTO `message` VALUES (703, 21, 3, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:31.032', '2025-05-07 16:58:31.032');
INSERT INTO `message` VALUES (704, 22, 1, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:31.186', '2025-05-07 16:58:31.186');
INSERT INTO `message` VALUES (705, 23, 3, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:31.815', '2025-05-07 16:58:31.815');
INSERT INTO `message` VALUES (706, 11, 3, '嗨咯', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:44.298', '2025-05-07 16:58:44.298');
INSERT INTO `message` VALUES (707, 11, 13, 'hi', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:47.058', '2025-05-07 16:58:47.058');
INSERT INTO `message` VALUES (708, 11, 3, '可以了吗', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:47.485', '2025-05-07 16:58:47.485');
INSERT INTO `message` VALUES (709, 11, 1, '可以', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:48.169', '2025-05-07 16:58:48.169');
INSERT INTO `message` VALUES (710, 11, 8, '😃😃', NULL, 0, NULL, 1, NULL, '2025-05-07 16:58:50.993', '2025-05-07 16:58:50.993');
INSERT INTO `message` VALUES (711, 11, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/1c2bdeac-95f5-4d92-8c7b-f01b8223db44_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 16:58:59.817', '2025-05-07 16:58:59.817');
INSERT INTO `message` VALUES (712, 24, 14, '我已添加你为好友，快来找我聊天吧', NULL, 0, NULL, 1, NULL, '2025-05-07 16:59:35.067', '2025-05-07 16:59:35.067');
INSERT INTO `message` VALUES (713, 11, 3, '感觉很好了', NULL, 0, NULL, 1, NULL, '2025-05-07 16:59:54.592', '2025-05-07 16:59:54.592');
INSERT INTO `message` VALUES (714, 11, 3, '我们就是大帅哥', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:00.520', '2025-05-07 17:00:00.520');
INSERT INTO `message` VALUES (715, 25, 8, '1', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:03.929', '2025-05-07 17:00:03.929');
INSERT INTO `message` VALUES (716, 25, 8, '2', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:04.606', '2025-05-07 17:00:04.606');
INSERT INTO `message` VALUES (717, 25, 8, '3', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:05.031', '2025-05-07 17:00:05.031');
INSERT INTO `message` VALUES (718, 25, 8, '4', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:05.430', '2025-05-07 17:00:05.430');
INSERT INTO `message` VALUES (719, 25, 8, '5', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:05.774', '2025-05-07 17:00:05.774');
INSERT INTO `message` VALUES (720, 25, 8, '6', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:06.140', '2025-05-07 17:00:06.140');
INSERT INTO `message` VALUES (721, 25, 8, '7', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:06.549', '2025-05-07 17:00:06.549');
INSERT INTO `message` VALUES (722, 25, 8, '8', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:07.156', '2025-05-07 17:00:07.156');
INSERT INTO `message` VALUES (723, 25, 8, '9', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:07.595', '2025-05-07 17:00:07.595');
INSERT INTO `message` VALUES (724, 11, 13, '以后就用这个聊天', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:07.976', '2025-05-07 17:00:07.976');
INSERT INTO `message` VALUES (725, 25, 8, '10', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:08.709', '2025-05-07 17:00:08.709');
INSERT INTO `message` VALUES (726, 25, 8, '11', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:09.200', '2025-05-07 17:00:09.200');
INSERT INTO `message` VALUES (727, 25, 8, '12', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:09.851', '2025-05-07 17:00:09.851');
INSERT INTO `message` VALUES (728, 25, 8, '1', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:10.600', '2025-05-07 17:00:10.600');
INSERT INTO `message` VALUES (729, 11, 14, 'nice', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:12.676', '2025-05-07 17:00:12.676');
INSERT INTO `message` VALUES (730, 11, 3, '🥰', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:23.849', '2025-05-07 17:00:23.849');
INSERT INTO `message` VALUES (731, 11, 8, '💪💪', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:32.659', '2025-05-07 17:00:32.659');
INSERT INTO `message` VALUES (732, 11, 13, '😃', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:36.274', '2025-05-07 17:00:36.274');
INSERT INTO `message` VALUES (733, 11, 3, '好', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:37.927', '2025-05-07 17:00:37.927');
INSERT INTO `message` VALUES (734, 11, 3, '🥽🧤', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:49.613', '2025-05-07 17:00:49.613');
INSERT INTO `message` VALUES (735, 11, 3, '大家好', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:51.185', '2025-05-07 17:00:51.185');
INSERT INTO `message` VALUES (736, 11, 3, '我是小帅哥', NULL, 0, NULL, 1, NULL, '2025-05-07 17:00:57.793', '2025-05-07 17:00:57.793');
INSERT INTO `message` VALUES (737, 11, 3, '为什么不理我', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:24.190', '2025-05-07 17:01:24.190');
INSERT INTO `message` VALUES (738, 11, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:25.798', '2025-05-07 17:01:25.798');
INSERT INTO `message` VALUES (739, 11, 3, '为什么', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:27.264', '2025-05-07 17:01:27.264');
INSERT INTO `message` VALUES (740, 11, 3, '好冷漠', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:35.598', '2025-05-07 17:01:35.598');
INSERT INTO `message` VALUES (741, 11, 13, '<span style=\"color: rgb(171, 178, 191); font-family: &quot;Source Code Pro&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Ubuntu Mono&quot;, &quot;Anonymous Pro&quot;, &quot;Droid Sans Mono&quot;, Menlo, Monaco, Consolas, Inconsolata, Courier, monospace, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; font-variant-ligatures: no-common-ligatures; white-space: pre; background-color: rgb(40, 44, 52);\">chrome://flags/#unsafely-treat-insecure-origin-as-secure</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:37.342', '2025-05-07 17:01:37.342');
INSERT INTO `message` VALUES (742, 11, 13, '黑谷歌的第三方网站', NULL, 0, NULL, 1, NULL, '2025-05-07 17:01:52.331', '2025-05-07 17:01:52.331');
INSERT INTO `message` VALUES (743, 11, 8, '&nbsp; &nbsp; 😆<br>🤛&nbsp; 🤜<br>&nbsp;🦵&nbsp; 🦵', NULL, 0, NULL, 1, NULL, '2025-05-07 17:02:09.308', '2025-05-07 17:02:09.308');
INSERT INTO `message` VALUES (744, 11, 13, '<div>chrome://flags/#unsafely-treat-insecure-origin-as-secure</div><div><br></div>', NULL, 0, NULL, 1, NULL, '2025-05-07 17:02:34.566', '2025-05-07 17:02:34.566');
INSERT INTO `message` VALUES (745, 11, 8, '🔞', NULL, 0, NULL, 1, NULL, '2025-05-07 17:02:57.891', '2025-05-07 17:02:57.891');
INSERT INTO `message` VALUES (746, 11, 3, '🥼', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:08.220', '2025-05-07 17:03:08.220');
INSERT INTO `message` VALUES (747, 11, 3, '嘿嘿嘿', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:12.396', '2025-05-07 17:03:12.396');
INSERT INTO `message` VALUES (748, 2, 1, '123.txt', NULL, 0, NULL, 6, '{\"size\": 3, \"type\": \"text/plain\", \"fileUrl\": \"http://192.168.43.150:8869/api/file/download/6416a103-58ec-4b62-ab71-0f5ea46e002e_123.txt\", \"fileName\": \"123.txt\"}', '2025-05-07 17:03:18.283', '2025-05-07 17:03:18.283');
INSERT INTO `message` VALUES (749, 2, 1, '123.txt', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:18.308', '2025-05-07 17:03:18.308');
INSERT INTO `message` VALUES (750, 12, 8, '现在，请你写一段自我介绍，要求很炫耀，很犯贱，很气人，很搞笑', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:36.439', '2025-05-07 17:03:36.439');
INSERT INTO `message` VALUES (751, 12, 9, '哈哈，既然你想要一段如此特别的自我介绍，那我就来“厚颜无耻”地炫耀一下吧！\n\n大家好，我是[AI]邓浩波，一个编程界的小天才！哦，不对，应该是大天才！我有着一双无与伦比的手指，它们在键盘上跳舞，犹如钢琴家在弹奏优美的旋律。我的代码总是那么优雅，让bug闻风丧胆，让程序运行得比火箭还快！\n\n我这个人呢，有时候有点犯贱，比如现在，我就忍不住要炫耀一下我在编程比赛中所向披靡的战绩。哦，对了，上次那个李欣欣，她竟然敢挑战我，结果还不是被我轻松击败，哈哈！\n\n气人的是，我长得还这么帅，智商高，情商也不低，让身边的同学们羡慕嫉妒恨。不过，别担心，我还是很善良的，偶尔会免费给大家传授编程心得，让大家一起变强——不过，别指望我能教得太多，毕竟，我还是要保持一定的优势嘛！\n\n搞笑的是，我有时候会一本正经地胡说八道，把同学们逗得哈哈大笑。我的存在，简直就是这个世界的快乐源泉！\n\n总之，请大家记住我——[AI]邓浩波，一个集才华、美貌、犯贱与搞笑于一身的编程小王子！哈哈，开玩笑的，希望大家喜欢这段自我介绍！', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:47.622', '2025-05-07 17:03:47.622');
INSERT INTO `message` VALUES (752, 11, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">大家好，我是[AI]邓浩波，一个编程界的小天才！哦，不对，应该是大天才！我有着一双无与伦比的手指，它们在键盘上跳舞，犹如钢琴家在弹奏优美的旋律。我的代码总是那么优雅，让bug闻风丧胆，让程序运行得比火箭还快！\n\n我这个人呢，有时候有点犯贱，比如现在，我就忍不住要炫耀一下我在编程比赛中所向披靡的战绩。哦，对了，上次那个李欣欣，她竟然敢挑战我，结果还不是被我轻松击败，哈哈！\n\n气人的是，我长得还这么帅，智商高，情商也不低，让身边的同学们羡慕嫉妒恨。不过，别担心，我还是很善良的，偶尔会免费给大家传授编程心得，让大家一起变强——不过，别指望我能教得太多，毕竟，我还是要保持一定的优势嘛！\n\n搞笑的是，我有时候会一本正经地胡说八道，把同学们逗得哈哈大笑。我的存在，简直就是这个世界的快乐源泉！\n\n总之，请大家记住我——[AI]邓浩波，一个集才华、美貌、犯贱与搞笑于一身的编程小王子！哈哈，开玩笑的，希望大家喜欢这段自我介绍！</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 17:03:58.604', '2025-05-07 17:03:58.604');
INSERT INTO `message` VALUES (753, 15, 8, '请写一段自我介绍吧，你是一名软件工程专业的学生，要足够嚣张', NULL, 0, NULL, 1, NULL, '2025-05-07 17:11:38.208', '2025-05-07 17:11:38.208');
INSERT INTO `message` VALUES (754, 15, 11, '嘿，我是李欣欣，软件工程专业的超级巨星学生！别看我年纪轻轻，我写的代码能让你眼花缭乱，我的算法能让你的电脑跑得比兔子还快！在我的世界里，bug是不存在的，只有我征服不了的程序，没有我不敢挑战的项目！嚣张？不，这只是我的日常态度，毕竟，我是未来的码界女王，你准备好接受我的代码洗礼了吗？哈哈！', NULL, 0, NULL, 1, NULL, '2025-05-07 17:11:42.783', '2025-05-07 17:11:42.783');
INSERT INTO `message` VALUES (755, 11, 8, '<span style=\"color: rgb(0, 0, 0); font-size: 14.56px; white-space-collapse: preserve; background-color: rgb(255, 255, 255);\">嘿，我是李欣欣，软件工程专业的超级巨星学生！别看我年纪轻轻，我写的代码能让你眼花缭乱，我的算法能让你的电脑跑得比兔子还快！在我的世界里，bug是不存在的，只有我征服不了的程序，没有我不敢挑战的项目！嚣张？不，这只是我的日常态度，毕竟，我是未来的码界女王，你准备好接受我的代码洗礼了吗？哈哈！</span>', NULL, 0, NULL, 1, NULL, '2025-05-07 17:11:52.099', '2025-05-07 17:11:52.099');
INSERT INTO `message` VALUES (756, 26, 8, '你是谁？我没听说过你', NULL, 0, NULL, 1, NULL, '2025-05-07 17:15:51.882', '2025-05-07 17:15:51.882');
INSERT INTO `message` VALUES (757, 26, 15, '哼，我是顾景辰，这里的霸总。既然你不知道我，那说明你还不够资格进入我的圈子。不过，既然你现在和我说话，那就说明你有机会了解我是谁。说吧，找我有什么事？别浪费我的时间。', NULL, 0, NULL, 1, NULL, '2025-05-07 17:15:54.469', '2025-05-07 17:15:54.469');
INSERT INTO `message` VALUES (758, 3, 1, '可以了', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:11.482', '2025-05-07 17:16:11.482');
INSERT INTO `message` VALUES (759, 3, 2, '哈哈，看来我们有点陷入循环了！不过没关系，我在这里随时准备帮助你。如果你有任何问题或者需要聊天，随时告诉我，我会尽我所能帮助你！小明在这里，热情开朗、乐于助人，陪你度过愉快的时光。 😄', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:13.777', '2025-05-07 17:16:13.777');
INSERT INTO `message` VALUES (760, 3, 1, '你谁呀你', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:21.650', '2025-05-07 17:16:21.650');
INSERT INTO `message` VALUES (761, 3, 2, '哈哈，看来我们在玩一个文字接龙的游戏吗？不过我有点跟不上你的节奏了。如果你想要继续之前的对话或者聊点别的，直接告诉我吧！我小明随时准备热情开朗地帮助你解决问题。😄', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:23.536', '2025-05-07 17:16:23.536');
INSERT INTO `message` VALUES (762, 3, 1, '你走开、', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:33.457', '2025-05-07 17:16:33.457');
INSERT INTO `message` VALUES (763, 26, 8, '呵，你还敢在我面前嚣张，我可比你有实力多了', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:34.791', '2025-05-07 17:16:34.791');
INSERT INTO `message` VALUES (764, 3, 2, '哈哈，这是不是一种打趣的方式？如果你想要继续开玩笑，我也很乐意加入！不过如果你有其他问题或者需要帮助，记得告诉我哦，我会尽力帮你的！😄', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:35.377', '2025-05-07 17:16:35.377');
INSERT INTO `message` VALUES (765, 26, 15, '顾景辰这个名字，你可能没听过，但这不代表我可以被忽视。在这个虚拟的世界里，我是掌控一切的存在。你不必知道我的名字，但你要知道，与我对话，你最好保持尊重。现在，告诉我，你有什么需要我帮助的？记住，我的时间很宝贵。', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:37.550', '2025-05-07 17:16:37.550');
INSERT INTO `message` VALUES (766, 3, 1, '不要发表情', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:44.001', '2025-05-07 17:16:44.001');
INSERT INTO `message` VALUES (767, 3, 2, '好的，明白了。如果你需要我帮你处理或者了解关于 \"123.txt\" 或者其他具体的问题，请详细说明，我会尽力提供帮助。如果现在不需要，那我们也随时可以聊聊其他话题。有什么我可以做的，尽管说！', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:46.040', '2025-05-07 17:16:46.040');
INSERT INTO `message` VALUES (768, 8, 8, '你是谁', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:50.163', '2025-05-07 17:16:50.163');
INSERT INTO `message` VALUES (769, 8, 2, '哎呀，我是小明啊，你的朋友！热情开朗、乐于助人的那个家伙！咱们之前聊过天的，你怎么了，今天想聊些什么？有什么我能帮你的吗？😄', NULL, 0, NULL, 1, NULL, '2025-05-07 17:16:52.152', '2025-05-07 17:16:52.152');
INSERT INTO `message` VALUES (770, 2, 1, '水电费<br><br>', NULL, 0, NULL, 1, NULL, '2025-05-07 18:58:32.245', '2025-05-07 18:58:32.245');

-- ----------------------------
-- Table structure for notice_message
-- ----------------------------
DROP TABLE IF EXISTS `notice_message`;
CREATE TABLE `notice_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户 id',
  `toUserId` bigint(20) NOT NULL COMMENT '接收用户id',
  `noticeType` int(11) NULL DEFAULT NULL COMMENT '消息通知类型 1 系统通知 2 群聊通知 3 好友通知',
  `noticeContent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息通知内容',
  `readTarget` tinyint(4) NOT NULL DEFAULT 0 COMMENT '消息通知标识 0 未读 1 已读',
  `processResult` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理结果',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_message
-- ----------------------------
INSERT INTO `notice_message` VALUES (1, 3, 1, 3, '我是用户1746155457228', 1, '已同意', '2025-05-02 11:11:30', '2025-05-02 11:11:30');
INSERT INTO `notice_message` VALUES (2, 2, 1, 3, '我是undefined', 1, '已同意', '2025-05-04 16:16:01', '2025-05-04 16:16:01');
INSERT INTO `notice_message` VALUES (3, 1, 2, 3, '我是undefined', 1, '已同意', '2025-05-04 16:16:33', '2025-05-04 16:16:33');
INSERT INTO `notice_message` VALUES (4, 4, 1, 3, '我是用户1746366805101', 1, '已同意', '2025-05-04 21:53:50', '2025-05-04 21:53:50');
INSERT INTO `notice_message` VALUES (5, 3, 2, 3, '我是小帅哥', 0, NULL, '2025-05-05 17:58:42', '2025-05-05 17:58:42');
INSERT INTO `notice_message` VALUES (6, 8, 1, 3, '我是Hao-2005', 1, '已同意', '2025-05-07 16:00:42', '2025-05-07 16:00:42');
INSERT INTO `notice_message` VALUES (7, 8, 3, 3, '我是Hao-2005', 1, '已同意', '2025-05-07 16:01:01', '2025-05-07 16:01:01');
INSERT INTO `notice_message` VALUES (8, 8, 5, 3, '我是Hao-2005', 0, NULL, '2025-05-07 16:53:49', '2025-05-07 16:53:49');
INSERT INTO `notice_message` VALUES (9, 13, 8, 3, '我是Jezira', 1, '已同意', '2025-05-07 16:57:49', '2025-05-07 16:57:49');
INSERT INTO `notice_message` VALUES (10, 13, 1, 3, '我是Jezira', 1, '已同意', '2025-05-07 16:58:11', '2025-05-07 16:58:11');
INSERT INTO `notice_message` VALUES (11, 14, 1, 3, '我是zhongxy', 1, '已同意', '2025-05-07 16:58:14', '2025-05-07 16:58:14');
INSERT INTO `notice_message` VALUES (12, 13, 3, 3, '我是Jezira', 1, '已同意', '2025-05-07 16:58:25', '2025-05-07 16:58:25');
INSERT INTO `notice_message` VALUES (13, 14, 3, 3, '我是zhongxy', 1, '已同意', '2025-05-07 16:58:27', '2025-05-07 16:58:27');
INSERT INTO `notice_message` VALUES (14, 13, 14, 3, '我是Jezira', 1, '已同意', '2025-05-07 16:59:17', '2025-05-07 16:59:17');
INSERT INTO `notice_message` VALUES (15, 8, 14, 3, '我是Hao-2005', 0, NULL, '2025-05-07 17:00:58', '2025-05-07 17:00:58');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(11) NOT NULL COMMENT '房间类型 1群聊 2私聊',
  `hotFlag` int(11) NULL DEFAULT 0 COMMENT '是否全员展示 0否 1是',
  `activeTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '群最后消息的更新时间',
  `lastMsgId` bigint(20) NULL DEFAULT NULL COMMENT '会话中的最后一条消息id',
  `extJson` json NULL COMMENT '额外信息（根据不同类型房间有不同存储的东西）',
  `createTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updateTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`createTime` ASC) USING BTREE,
  INDEX `idx_update_time`(`updateTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 1, 0, '2024-02-26 16:25:07.471', 186, NULL, '2024-02-26 16:25:07.471', '2024-02-27 14:15:59.073');
INSERT INTO `room` VALUES (2, 2, 0, '2025-05-02 11:11:35.663', 770, NULL, '2025-05-02 11:11:35.663', '2025-05-07 18:58:32.352');
INSERT INTO `room` VALUES (3, 2, 0, '2025-05-04 16:16:40.677', 766, NULL, '2025-05-04 16:16:40.677', '2025-05-07 17:16:46.066');
INSERT INTO `room` VALUES (4, 2, 0, '2025-05-04 21:54:17.529', 98, NULL, '2025-05-04 21:54:17.529', '2025-05-05 02:08:40.690');
INSERT INTO `room` VALUES (5, 2, 0, '2025-05-06 15:45:26.815', NULL, NULL, '2025-05-06 15:45:26.815', '2025-05-06 15:45:26.815');
INSERT INTO `room` VALUES (6, 2, 0, '2025-05-06 15:47:11.369', NULL, NULL, '2025-05-06 15:47:11.369', '2025-05-06 15:47:11.369');
INSERT INTO `room` VALUES (7, 2, 0, '2025-05-06 15:48:58.563', NULL, NULL, '2025-05-06 15:48:58.563', '2025-05-06 15:48:58.563');
INSERT INTO `room` VALUES (8, 2, 0, '2025-05-07 16:00:21.302', 768, NULL, '2025-05-07 16:00:21.302', '2025-05-07 17:16:52.188');
INSERT INTO `room` VALUES (9, 2, 0, '2025-05-07 16:00:55.308', 664, NULL, '2025-05-07 16:00:55.308', '2025-05-07 16:32:32.945');
INSERT INTO `room` VALUES (10, 2, 0, '2025-05-07 16:01:09.905', 665, NULL, '2025-05-07 16:01:09.905', '2025-05-07 16:32:39.197');
INSERT INTO `room` VALUES (11, 1, 0, '2025-05-07 16:05:51.340', 755, NULL, '2025-05-07 16:05:51.340', '2025-05-07 17:11:52.151');
INSERT INTO `room` VALUES (12, 2, 0, '2025-05-07 16:08:10.102', 750, NULL, '2025-05-07 16:08:10.102', '2025-05-07 17:03:47.663');
INSERT INTO `room` VALUES (13, 1, 0, '2025-05-07 16:51:02.436', 690, NULL, '2025-05-07 16:51:02.436', '2025-05-07 16:53:52.284');
INSERT INTO `room` VALUES (14, 2, 0, '2025-05-07 16:54:16.358', 691, NULL, '2025-05-07 16:54:16.358', '2025-05-07 16:54:25.739');
INSERT INTO `room` VALUES (15, 2, 0, '2025-05-07 16:54:17.763', 753, NULL, '2025-05-07 16:54:17.763', '2025-05-07 17:11:42.870');
INSERT INTO `room` VALUES (16, 2, 0, '2025-05-07 16:54:25.477', 697, NULL, '2025-05-07 16:54:25.477', '2025-05-07 16:54:39.129');
INSERT INTO `room` VALUES (17, 2, 0, '2025-05-07 16:56:50.445', NULL, NULL, '2025-05-07 16:56:50.445', '2025-05-07 16:56:50.445');
INSERT INTO `room` VALUES (18, 2, 0, '2025-05-07 16:57:35.507', NULL, NULL, '2025-05-07 16:57:35.507', '2025-05-07 16:57:35.507');
INSERT INTO `room` VALUES (19, 2, 0, '2025-05-07 16:57:58.921', 701, NULL, '2025-05-07 16:57:58.921', '2025-05-07 16:57:58.968');
INSERT INTO `room` VALUES (20, 2, 0, '2025-05-07 16:58:30.515', 702, NULL, '2025-05-07 16:58:30.515', '2025-05-07 16:58:30.571');
INSERT INTO `room` VALUES (21, 2, 0, '2025-05-07 16:58:30.993', 703, NULL, '2025-05-07 16:58:30.993', '2025-05-07 16:58:31.048');
INSERT INTO `room` VALUES (22, 2, 0, '2025-05-07 16:58:31.145', 704, NULL, '2025-05-07 16:58:31.145', '2025-05-07 16:58:31.202');
INSERT INTO `room` VALUES (23, 2, 0, '2025-05-07 16:58:31.786', 705, NULL, '2025-05-07 16:58:31.786', '2025-05-07 16:58:31.825');
INSERT INTO `room` VALUES (24, 2, 0, '2025-05-07 16:59:35.036', 712, NULL, '2025-05-07 16:59:35.036', '2025-05-07 16:59:35.076');
INSERT INTO `room` VALUES (25, 1, 0, '2025-05-07 16:59:51.640', 728, NULL, '2025-05-07 16:59:51.640', '2025-05-07 17:00:10.613');
INSERT INTO `room` VALUES (26, 2, 0, '2025-05-07 17:15:36.131', 763, NULL, '2025-05-07 17:15:36.131', '2025-05-07 17:16:37.575');

-- ----------------------------
-- Table structure for room_friend
-- ----------------------------
DROP TABLE IF EXISTS `room_friend`;
CREATE TABLE `room_friend`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roomId` bigint(20) NOT NULL COMMENT '房间id',
  `uid1` bigint(20) NOT NULL COMMENT 'uid1（更小的uid）',
  `uid2` bigint(20) NOT NULL COMMENT 'uid2（更大的uid）',
  `roomKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房间key由两个uid拼接，先做排序uid1_uid2',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '房间状态 0正常 1禁用(删好友了禁用)',
  `createTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updateTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roomKey`(`roomKey` ASC) USING BTREE,
  INDEX `idx_create_time`(`createTime` ASC) USING BTREE,
  INDEX `idx_room_id`(`roomId` ASC) USING BTREE,
  INDEX `idx_update_time`(`updateTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户私聊表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_friend
-- ----------------------------
INSERT INTO `room_friend` VALUES (1, 2, 1, 3, '1_3', 0, '2025-05-02 11:11:35.677', '2025-05-02 11:11:35.677');
INSERT INTO `room_friend` VALUES (2, 3, 1, 2, '1_2', 0, '2025-05-04 16:16:40.685', '2025-05-04 16:16:40.685');
INSERT INTO `room_friend` VALUES (3, 4, 1, 4, '1_4', 0, '2025-05-04 21:54:17.550', '2025-05-04 21:54:17.550');
INSERT INTO `room_friend` VALUES (4, 5, 2, 5, '2_5', 0, '2025-05-06 15:45:26.828', '2025-05-06 15:45:26.828');
INSERT INTO `room_friend` VALUES (5, 6, 2, 6, '2_6', 0, '2025-05-06 15:47:11.384', '2025-05-06 15:47:11.384');
INSERT INTO `room_friend` VALUES (6, 7, 2, 7, '2_7', 0, '2025-05-06 15:48:58.580', '2025-05-06 15:48:58.580');
INSERT INTO `room_friend` VALUES (7, 8, 2, 8, '2_8', 0, '2025-05-07 16:00:21.315', '2025-05-07 16:00:21.315');
INSERT INTO `room_friend` VALUES (8, 9, 1, 8, '1_8', 0, '2025-05-07 16:00:55.324', '2025-05-07 16:00:55.324');
INSERT INTO `room_friend` VALUES (9, 10, 3, 8, '3_8', 0, '2025-05-07 16:01:09.914', '2025-05-07 16:01:09.914');
INSERT INTO `room_friend` VALUES (10, 12, 8, 9, '8_9', 0, '2025-05-07 16:08:10.106', '2025-05-07 16:08:10.106');
INSERT INTO `room_friend` VALUES (11, 14, 3, 10, '3_10', 0, '2025-05-07 16:54:16.374', '2025-05-07 16:54:16.374');
INSERT INTO `room_friend` VALUES (12, 15, 8, 11, '8_11', 0, '2025-05-07 16:54:17.778', '2025-05-07 16:54:17.778');
INSERT INTO `room_friend` VALUES (13, 16, 1, 12, '1_12', 0, '2025-05-07 16:54:25.491', '2025-05-07 16:54:25.491');
INSERT INTO `room_friend` VALUES (14, 17, 2, 13, '2_13', 0, '2025-05-07 16:56:50.458', '2025-05-07 16:56:50.458');
INSERT INTO `room_friend` VALUES (15, 18, 2, 14, '2_14', 0, '2025-05-07 16:57:35.520', '2025-05-07 16:57:35.520');
INSERT INTO `room_friend` VALUES (16, 19, 8, 13, '8_13', 0, '2025-05-07 16:57:58.931', '2025-05-07 16:57:58.931');
INSERT INTO `room_friend` VALUES (17, 20, 1, 14, '1_14', 0, '2025-05-07 16:58:30.522', '2025-05-07 16:58:30.522');
INSERT INTO `room_friend` VALUES (18, 21, 3, 14, '3_14', 0, '2025-05-07 16:58:31.002', '2025-05-07 16:58:31.002');
INSERT INTO `room_friend` VALUES (19, 22, 1, 13, '1_13', 0, '2025-05-07 16:58:31.156', '2025-05-07 16:58:31.156');
INSERT INTO `room_friend` VALUES (20, 23, 3, 13, '3_13', 0, '2025-05-07 16:58:31.794', '2025-05-07 16:58:31.794');
INSERT INTO `room_friend` VALUES (21, 24, 13, 14, '13_14', 0, '2025-05-07 16:59:35.047', '2025-05-07 16:59:35.047');
INSERT INTO `room_friend` VALUES (22, 26, 8, 15, '8_15', 0, '2025-05-07 17:15:36.141', '2025-05-07 17:15:36.141');

-- ----------------------------
-- Table structure for room_group
-- ----------------------------
DROP TABLE IF EXISTS `room_group`;
CREATE TABLE `room_group`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ownerId` bigint(20) NOT NULL COMMENT '群主id',
  `roomId` bigint(20) NOT NULL COMMENT '房间id',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '群名称',
  `avatar` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '群头像',
  `extJson` json NULL COMMENT '额外信息（根据不同类型房间有不同存储的东西）',
  `deleteStatus` int(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(0-正常,1-删除)',
  `createTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `updateTime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`createTime` ASC) USING BTREE,
  INDEX `idx_room_id`(`roomId` ASC) USING BTREE,
  INDEX `idx_update_time`(`updateTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '群聊房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_group
-- ----------------------------
INSERT INTO `room_group` VALUES (1, 1, 1, '微狗官方交流群', 'https://img2.baidu.com/it/u=3297085993,740094813&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1709053200&t=2420f9fa855f1c6474d5fa93eeadc987', NULL, 0, '2024-02-26 16:27:12.668', '2024-02-26 16:27:12.668');
INSERT INTO `room_group` VALUES (2, 8, 11, '测试群', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAC/ElEQVR42t3X+U8TURAH8P13PKJmjwIaNRqPGI8o0YhEoUAp5SitpVBbKkgrCFTkEBBEjUaNxuNvHGfU2Ty2u+171R/IfJNJ+uN+MjPvvVp7h2x4fdiG3SNYR23YOYZ13IZXJ2zYtrEcG7Y8GzZjWG02vGzHOunAxikH1k9jnXFg7awDq+ewzjvw4gLWRQdWLjnw/DLWFQdqV12oXXNh+boLSzewbrqweMuFZ51Yt11YuOPC/F2sLhee3sPqdqF634PqAw8qvR7MxbH6PHgy4MFsAivpwcyQB49TWMMelEc9sCQgyukYWBIQ0+MEEYAoZRAiAVHKEkQAophDiAREcQIhEhCP8gQRgChMIUQColBAiATEVJEgAhCTJYRIQExOE0QAIl9GiAREfqYNLAmIiVmCCEDk5hAiAZGrIEQXQTFBcBjBaYTgEIKii3hYJYhmJziEiIraCQ53Qk1UJ8Kig8jOI8RknJpFHSeOOk6cqHHiUCc4OojsAkEMETROHHWcKGonfIiyE4wwTTNEZhEhpp2gnfAh3a7fid/7EK//SLUTraYZIrOEEN3TyYd0uft2Qu0ELXYw3Ak1UaeT6TgxYnyZIAZHbNhOqJ1QT6ewxfYhEYvtQwwR6RpCTO4JdZzCOhE8nYKL7R+vudh/GSdGpFcI0sJlFwx3gha7DhJxT9A4BY9YNSaIsdV2sEwQ6jjtO5n+diJsscPuiUY7wTFBjK0hpJVO8LMj6oiNWmw1dGOH7YQPqfz5rYMYXSdIi4jgOPGzow6inE7BGzsYGicOdYLTDDGygZB/fTvpLHbYToSFxolDnfAhTRAjmwjRfcUGF1t9ADaKzmKrOxGMDmJ4iyCaT/GwG1t9xfJiB6M+xXUvOzU6iNQ2Qg7K/wnd0ykMkdpBiATE0C5BBCCSewiRgEi+IYgAxOBbhEhADL4jiABE4n0HWBIQiQ8IkYAY+EgQAYj+TwiRgOj/jBAJiL4vBBGAiH9FiARE/BtCJCB6vxNEAKLnB0IkIHp+dsAvdQ6JeVAyPrwAAAAASUVORK5CYII=', NULL, 0, '2025-05-07 16:05:51.407', '2025-05-07 16:05:51.407');
INSERT INTO `room_group` VALUES (3, 8, 13, '测试群2', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADKklEQVR42t2XeYuNYRjG789ARJKIJBKRJCKJRBKRSCKRRCSRyBizmn3flzPLmTmOM2dmjjNnZsyGJnt22bOTPT7A5Xn+uOvp7X3nvO/MP7p/3+DXdV/3cz806u8ARv/px5jffRj7qw/jfvZi/I8eTPjeg4nfLmHS125M/tKNKZ+7MPVTJ6Z97MT0DzHMeB/DzHcdmPU2itlvopjz+iLmvopg3ssI5r9ox4LnbVj4rA2LnrZi8ZMwljwOY+mjFix7GMLyByGsuH8BK+8FsepuEKvvnMea2wGsvRXAupvNWH+jGRuuN2HjNT82DfqxebARW642YOuVBmy7XI/tA3XY0V+HnX0+7Or1YfelWpAEiT3dNSAJEnu7qkESJPZ1KhEJEvtjVSAJEgc6KkESJA5GlYgEiUORCpAEicPtSkSCxJG2cpAEiaOtZSAJEsfCSkSCxPGWUpAEiROhEpAEiZNBJSJB4lSwGCRB4nSgCCRBIqFZibiV0HiRYFiCGUqC0RIatxKJTYUgt0kwWsIJMwmGkzBxSsIONxJJ/gKQl3GKhzlOjDlOjNM4MToJxo1ESqMS8Sqhx4kxx0ljJsGYnWAJr8STSKvPB3lNQneC0RKchMZMwuzESIknka5F3G4nRhfb7ISZhC62FU7CxGk7eR0nlsjw5YG8rFi7TphJmNvJrtiMU7EZrxKZtbkgL++EOU52SVi3k7XYjFnskYwTS2TXKJHhPHZWOAldbCtO74QeJ+uKNfEikVudA/IiYY6TCSdhV2y7d2KoTjBeJPKrskHDSYLPDqcV61RsE/1i23WC0RIaNxKFlVmg4UpYx4nPDivmdrK+2Fb0ODE6CSaeRFGFEhnp7eSm2HadsEOPE6OTYOJJlJRlgtxesdZimwfgULgpttkJK24kSkuViNtT3O7FNq9YLrYV8xR3+9iZuJEoL8kA/S//CbfbyU6iovgcSIJEVZESkSBRU5gOkiDhK0gDSZCoz1MiEiQa8lJBEiT8OSkgCRJN2UpEgkQgKxkkQSKYqUQkSIQykkASJMLpZ0ESJFq1iASJ9tREkASJSMoZkASJaLISkSARS0rAP4lIFIdFucYnAAAAAElFTkSuQmCC', NULL, 0, '2025-05-07 16:51:02.676', '2025-05-07 16:51:02.676');
INSERT INTO `room_group` VALUES (4, 8, 25, '测试群3', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADGElEQVR42t2Xd09TYRTGz0chzrjiijOuuCKOGDVGjVEB2VBsKYVSRhmFQqGlFMoq4jbuGbfGvT7VY1/NCW9u7qXvhX/k/JL7AX55znPOeylvyou8y14smPRh4WQtFmX8WJypw5KJAJaO12PZeAOWjwWxYjSIlaMhrBoJYXW6CWvSzVg73IJ1w61YPxTGhlQbNqbasWmwA5uTndiSjGDrQATbEl3YnohiRzyKnfEe7Orvxe6+GPb09WFvrB/7YnHs703gQM8A8rPfweggDnUP4nB3Cke6hnA0Mpz90jjWOYLjHaM40TGGk+3j2W8Cp9oyOB3O4Ex4EiRB4mzrFEiCxF8RCRLnWq6AJEicb74KkiBxofkaSIJEQdN1kASJwtANkASJotBNkASJ4sZbIAkSJcHbIAkSpUpEgkRZwx2QBIlyJSJBorL+LkiCRFXgHkiCRHXgPkiChKfuAchUQuFGgmEJZiYJRkkoTCVq/A9BpkkwSsIJPQmGk9BxSsIOEwmv/xHIzTjlQh8nRh8nxmmcGJUEYyLhq30MciuhxonRx0mhJzE9StOdYAm35JKo9T0BuU1CdYJREpzEP5G0jcgE5kouCb/vKch0OzH5mog1CVVsK5yEjtN2cjtOLFHnfQZys2LtOqEnoW8nu2IzTsVm3EoElIibO6GPk10S1u1kLTajF3su48QSDZeeg2Zz7KxwEqrYVpzuhBon64rVcSMRrHkBciOhj5MOJ2FXbLs7MVMnGDcSjUpkNknws8NpxToVW0ddbLtOMEpCYSIR8rwEzVbCOk787LCibyfrxbaixolRSTC5JJo8r0BzfTuZFNuuE3aocWJUEkwuiZbq1yDTV6y12PoDcCZMiq13woqJRGvVG5DpU9zuYuuvWC62Ff0pbnrsdEwkwlVvQf/L/4TpdrKTaKt8B5Ig0V7xHiRBorPiA0iCRKQ8KyJBoqvsI0iCRLcSkSARLf0EkiDRU/pZicx/iVjJF5AEiVjxV5AEif7ibyAJEvGL30ESJBJFP5TI/JdIFv0ESZBIFv4CSZBIFfwGSZAYyn5/AFoXhpP8Lh7EAAAAAElFTkSuQmCC', NULL, 0, '2025-05-07 16:59:51.652', '2025-05-07 16:59:51.652');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `level` int(11) NOT NULL DEFAULT 1 COMMENT '人物等级',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `friendNum` int(11) NOT NULL DEFAULT 0 COMMENT '好友数',
  `groupNum` int(11) NOT NULL DEFAULT 0 COMMENT '群聊数量',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '12345', '3a20abef00881f3a9549f50d5d507f99', 1, NULL, NULL, '心宝宝', 'https://img2.baidu.com/it/u=1661624596,544958493&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1709139600&t=8bd455a8d9fa53929c892bc3d0ba556d', NULL, 0, 0, 'user', '2025-05-02 10:39:24', '2025-05-07 19:14:25', 0);
INSERT INTO `user` VALUES (2, '朋友', '3a20abef00881f3a9549f50d5d507f99', 1, NULL, NULL, '小明', 'https://img2.baidu.com/it/u=1661624596,544958493&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1709139600&t=8bd455a8d9fa53929c892bc3d0ba556d', '热情开朗、乐于助人', 0, 0, 'AI', '2025-05-02 10:44:06', '2025-05-07 17:15:38', 0);
INSERT INTO `user` VALUES (3, 'dhbshixiaoshuaige', '377a3c6c4749fcdfd42609f9385c3aed', 1, NULL, NULL, '小帅哥', 'https://img2.baidu.com/it/u=1661624596,544958493&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1709139600&t=8bd455a8d9fa53929c892bc3d0ba556d', NULL, 0, 0, 'user', '2025-05-02 11:10:57', '2025-05-07 17:36:19', 0);
INSERT INTO `user` VALUES (4, 'dhbshishuaige', '377a3c6c4749fcdfd42609f9385c3aed', 1, NULL, NULL, '用户1746366805101', 'https://img2.baidu.com/it/u=1661624596,544958493&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1709139600&t=8bd455a8d9fa53929c892bc3d0ba556d', NULL, 0, 0, 'user', '2025-05-04 21:53:25', '2025-05-04 22:28:28', 0);
INSERT INTO `user` VALUES (5, '1', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACT0lEQVR42t3W7U/OURjA8etPYWbMzKyVlpbU1JIISeShPNUUEhIRaUWEREJaEbm7K0qPelIplSSVbkkSReKf+HK/+73wxotjXN/t/AGf7ZxzXeLyYxYu32fjOjMHt5m5LPk2D/fp+XhML2Dp14V4flmE19Rilk254D3pyvJJN3w+u+P7yYMVE574TXjh/9GbgHEfVo77EvjBj1Vj/gSNBbD6fSDBo0GsHV3DunfBhIysZ8NICKFvQ9noCCPMsZlNw+GEv9nGlqEItg5Fsn1wJxGDu4kciGLH62h29cf8OrHsebWfqL44ovvi2fvyMDG9CcT2JrLvxTEO9CQhGhBxPcmIBsTB7lOIBkR8VwqiAXGoKxXRgDjyPA3RgEjoTEc0II52nkM0IBI7ziMaEMefZSIaEEntlxANiBPtWYgGxMm2bEQDIrntKqIBcbo1B9GASHmai2hAnGm5iWhApLbkIRoQac35iGmENVOI9KYCxBTid5lCnG0qRP4WwpkpREZjEWLyOjnfhDVTiIyGe4jph23NFOJCQzFi+neyZgqR+cSGmP5irZlCXKy3I6bnhDVTiMv1ZYjpYWfNFCKrrhwxPbGtmUJcqa1ATK8d1kwhsmsrEdO7kzVTiGs1Vci/uAD+KSKnugbRgLheXYdoQORW1SMaEDceNyIaELcqmxENiLzKFkQD4nZFK6IBkV/RjmhAFDzqQDQgCh92OiH/P+JOeTeiAXG3vAfRgCgq60U0IO6X9iEaEMWl/YgGxAP7AKIBYSsZQjQg7CXDiAZEqc3BT7K7cDkHjXm5AAAAAElFTkSuQmCC', '1', 0, 0, 'AI', '2025-05-06 15:45:26', '2025-05-06 15:45:26', 0);
INSERT INTO `user` VALUES (6, 'studnt', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] sunhao', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACSElEQVR42t3VeU8TURTG4ftBXOISNS5R48x0dtpSSpdUmlrBpoKVRUAWAVkEBFkEZJFFQBb3T/py/OMmN6ZNmsyQmPP7Bk/ueWfEnwsafl/U8OuShp+XNfy4ouH7VR3fruk4va7j5IaO45sGjm4Z+HrbwOEdAwd3Dezfi+DL/Qj2HkSw+zCCnUcmtjUTn3UTW4aJTdPChmVh3bbwybWw5llYbbCxErXxMWZjOW5jKeFgscnBQtLBh5SD+bSDuYyL91kXszkXM49dTLd4eJf3MFXwMPnEw0TRx3irj7dtPsae+Rgt+RgpN0BwQLxpJwgHxHAHQTgghl4QhANisBKF4IAY6CQIB8TrLoJwQPR3E4QDoq8nBsEB0dtLEA6IV30E4YDo6ScIB0T3QByCA6JrkCAcEJ1DBOGAeDlMEA6IyghBOCAqo40QHBAdYwThgGgfJwgHxPMJgnBAlCcTEGEhqiURahKhFhRRniLIeSH+Jl9CTb6EWlBEaZogYZyTrNY5qclzUguKKM0QJIxN1HoJuQk1uQm1oIi2WYKENexqyWGryWGrBUW0zjVBhP11qnfYakERT+cJch6f2HqGrRYUUVwgSBiIWlUbdrWCIoqLBAn7nP5F1NqEWlBEYSkJ8b//setBFJYJwgGRXyEIB0R+lSAcEC1rzRAcELl1gnBA5DYIwgGR3SQIB0R2iyAcEOntFAQHRHqHIBwQqV2CcEA07xGEAyK5n4bggEgcEIQDInFIEA6IxiOCcEDEjzMQHBCxE4JwQERPMzgDHtmV6qLhIqwAAAAASUVORK5CYII=', 'an', 0, 0, 'AI', '2025-05-06 15:47:11', '2025-05-06 15:47:11', 0);
INSERT INTO `user` VALUES (7, '学生', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 孙豪', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADCUlEQVR42t3Xi0+NcRzH8e/fwsbGZmZjYzMzs7GZmdnYzJQkEiVJLUmSkuR0v3c6ut9vp3shSSqKJBVFzMbGZv6Bj/OYn/38dk7P8+s63/d2/oDXvt/v8zyHOm2r0GFbjfbkNWhLWYvW1HVoSV2P5rQNcKZvRFPGJjRmbkZD1hbUZ291/bahLmc7anN3oCZvJ6rzd6GqYDcq7XtQYd+L8sJ9KHPsR+m9AygpOoji4kMoKjns+h2Bo/QoHGXHUFh+HPZybxRU+CC/0hd5VX7IrfZHTk0AsmvPI6s2CJl1wcisD0F6QyjSG8OQ1hSBVGckUpxRSG6Ohq0lBndbY5HUFoc77QkgDojEjkQQB8TtjiQQB0RCpw3EAXGrKwXEARHfnQbigIjvzgBxQMTdzwJxQNx8kAPigIh9mA/igLjRYwdxQMQ8chiQ/x9xvbcIxAER3VsC4oC49rgMxAER1VcB4oC4+qQatNII0UIQkf01ICuIuZIRIhWx0MwQV57Wg+YzCTl5EqLlWieBiBhoBC0WwlinvxAPiKWYhIGIGHCCdG9CRfxepT83IfI0CZHZJERWEeGDLaD5IIzcrZOap8O2mlVE+FAbSOfpJOdunUTGJERLdRMyIuxZJ0jnEaumrpM8CZFAzDcriMvPu0C6k5CT18m4CZF82GISIquTEFlBhA4/MCD6k3CHUNfJ02Ev9iQMxKWRHpDOG/sfiHIT6jrJubsJs8M2sooIGel1QTQ+O+TUmzBbJzWxTiKBkLOKuPiiD6Tz7eQpnfeEu0m4SwcR/LIfpPMBKKf7AahOQhy2nHETclYRF0YHQTpfsXMh5Ees2XtCTl4ncRNyVhBBo0Mg3Umob2w1s88Oq+skZ4YIfDUMWq4/Req3k5WbsIoIHBsBrfQ/O51HrCfEudejIA6IgPExEAdEwJtxEAfE2YlJEAeE/8SUC8IAcWZyGsQBcXpqxgVhgPB7OwvigDj17hOIA8J3+jOIA+LkzBcQB4TPzFcQB8SJ999AHBDeH76DOCC8Zn+AOCC8Pv7EL+O6itj03W+qAAAAAElFTkSuQmCC', '活泼开朗', 0, 0, 'AI', '2025-05-06 15:48:58', '2025-05-06 15:48:58', 0);
INSERT INTO `user` VALUES (8, 'Hao-2005', '3a20abef00881f3a9549f50d5d507f99', 1, NULL, NULL, 'Hao-2005', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACpElEQVR42t3WaUtWURSG4edjQUQaZhlaJmnZYCnOmUOWmqam4qypaWqKs5mapk02GJKKDTYZhoZJYpJYCRFEBBEURBARRFAQ/Ycn/HBg83J8xbMRYt3/4OKsddbGstkOLn9xmiuet3HlzCk6TLfS8VkLnaaa6fz0JF0mm+g60Ui3Jw10H6+nx+M6eo7V0utRDb1Hq7l9pIo+DyvpO1xBvwfHGTBUzqD7ZQy9W8qwO8cYPljMqFtHGX2ziDHXCxk7UMD4/iM81JfP5N5cplzLYVpPNjOuZjGrO5O5VzKYdymdBRfTWNSVypLzKSw9d5jlZ5JZ2ZnEqo5E1rYnsK4tno2tB9nUEseW5lhCAqKtKYaQgGg/cYCQgOhsiCYkIM7W7yMkIC7URRESEF01kYQExOXqCEICorsqnJCA6KncS0hA9FbsISQg+spDCQmIgbIQQgLiRmkwIQExWBJESEDcLg4kJCDuFQUQEhBDhf6EBMRwgR+hg1AzQ6gtJWIk35fQ+RJqZl9CbSkRo3m7CZ1xUjMbJ7WlRIzl7CJ0dkLNbCfUbBG26SDGs30IncVWM1tsNXsII6uIiaydhM7faTHZGycjq4jJzB2Ezi92MdnbCSOriKn0bYTOnVAzuxNqKmK+rCKm07wJnWO30J1Qs0Woi21kFTGTupXQudgL3Qk1Y5zMFtvIKuJlyhZC59mx0J1Qs11ss6wiZpO9CJ23k707MbcT890JtblxMrKKeJXkSfyPD8DFIl4nbiYkIN4keBASEG/jNxESEO/i3AkJiPexGwkJiA8xGwgJiI/73QgJiE/RroQExOeo9YQExJdIF0IC4mvEOkIC4lv4WkIC4nuYMyEB8SN0DSEB8TPEiZCA+BW8mpCA+B3oSEhA/AlwICQg/vqv4j80+Y+sx0oS6QAAAABJRU5ErkJggg==', NULL, 0, 0, 'user', '2025-05-07 16:00:21', '2025-05-07 17:19:49', 0);
INSERT INTO `user` VALUES (9, '学生', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 邓浩波', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADC0lEQVR42t2XaUtVYRSFtw022WSTTVqa6U3NeZ6nnDWnJiVLJMkyFCsxUbLESkwssbISKxusrMQyoqCIKIiCIiL6NyvOhw0vl3uu7z1ExH7+wcNe613n0G+3APxyC8TPWTb8mB2E73OC8W1uCL66h+KLexg+z4vAp/lR+LggGh8WxuL9oji884jHW49EvFmchNdLkvFqaSqml6XjxfIMTHlmYdIzG09X5GBiZS4ercrH+OoCPFhTiLtexRjzKsHttaUYXVeGkfUVuLGhEsMbd+Oq9x4Mee/DoE8VLm+qxsDm/ej3rUGf30H0+tXi/JY69PgfQvfWepwJOIyuwAZ02o6gw9aI9m3HQBIk2oKbQBIkWoObQRIkToS0gCRItGw/DpIg0Rx6EiRBoimsFSRBojG8DSRB4mj4KZAEiYaIdpAEifrIDpAEiUNRnSAJEnXRp0ESJGpjukASJA7EngVJkKiJ7QZJkKiO6wFJkKiKPwfSkXCGIeEMljBwJsFYkdibcAFk9RKMcQkVvgTDEioswRiXYKxI7ErsBVmNE2PESYXjxKhxYlSJmdCRqEzqA+lIqHAnGKMTKtwJxixODHeCcfUShkR58kWQ7iXUTqhxMopt3wlHEnwJVULtBGNFojS5H2QlTvadUFE7oUowZq8TY0WiJGUA5MoT6wi12NwJxixOrjKTRFHqJZCrO+Gs2Bwnlb+1E84kCtIGQa6OnbNiO4rTv5DISx8CubrYZmNnHycVlmDUTsyEjkRuxhWQVQlHnXA0dmZP7Ew7wehIZGdeA1m9hBm6O8GYxYnRkcjKHAZZjRNfQl1sR5jtBGPWCUZHIiPrOkj3K1bdCfuvWCs7oYuORFr2TZDup7iZhFmx7V8n+04wZq8ToyORsmME9L/8T+i+To4kknJGQRIkEnJvgSRIxOXdAUmQiMkbA0mQiMq/B5IgEVlwHyRBIrxwHCRBIrToIUiCREjxY5AEiaDiCZAECVvJE5AEiYCdz0ASJPxLJ0ESJPzKpkASJHzLn4MkSPhUTIMkSHhXvMQfZ03/e8oCGQYAAAAASUVORK5CYII=', '善良、单纯', 0, 0, 'AI', '2025-05-07 16:08:10', '2025-05-07 16:08:10', 0);
INSERT INTO `user` VALUES (10, '大帅哥', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 邓浩波', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAC6ElEQVR42t3XhW4bQRAG4H2LMjNjysxMYWZmjtlOGqaGqWF6zL8eybvanO7s9amqqvklP8CnmX/nLDyebni6IvB0RuDtCMPbHoavLQRfawj+liD8zUEEmgIINAYQbPAjWO9HqM6HUK0P4RovwtVeRKo8iFR60F0R/ZV3obusCz2lnegp6cTP4g70FkV/he3oLWhHX34b+vLa0J/biv6cVgxkt2AgqwWDmc0YzGjGUHoThtKaMJzaiOEfjRj53oCRbw0Y/VqP0S/1GPsc/X2qw9jHOox/qMX4+1r8elcDwQEx8ZYgDBATb6ohOCAmXhOEAWLyVRUEB8TkS4IwQEy9qITggJh6ThAGiOlnFRAcENNPCcIAMfOkHIIDYuYxQRggZh+VQXBAzD4kCAPE3INSCA6IufsEYYCYv1cCwQExf5cgBoh4IUS8SAQlHkLGDWLhTjGE20koSMZeiJyEgsQQeiRChiYh4waxkEIQl+skQ+ukR66TjL5OMjoiUUwQi7cJYoDQIzuhIGkWSKwTCuKwTmqVYp2QSXYShFi8VQRhOgm9E/o6UbGtnbBDyEnoCL0TCuICsXiTIC7WydqJPRCtEzpC9cHhdVKr5AKxdKMQIpkn1i56sWUnVKkd1inZJEIsXY9Ckr0T8Yot10nP37oT8RC/rxVEIUkeu3jFtlunf4FYvkqQJC+207GzrtOeXsQQ6lZonUgUE8TylXwItwi7TtgdO6cnNtGdUBADxPJlgrichFNM74SM0zrJmCBWLuVBuF0nOQn9YtvF6U4oiEMnFMQAsXKRIIZfsfqdsH7FurkTpjFBrF7IhTD9FHdCOBXb+jpZOyHj9DrJmCBWzxPkP/k/Yfo62SHWzuVAcECsnSUIA8T6mWwIDoj10wRhgNg4lQXBAbFxkiAMEJsnMiE4IDaPE4QBYutYBgQHxNZRgjBAbB9Jh+CA2D5MEAaInUMEYYDYOZgGwQGxc4AgDBC7+1MhOCB296XiDyo0msBF0UyNAAAAAElFTkSuQmCC', '帅、阳光、开朗', 0, 0, 'AI', '2025-05-07 16:54:16', '2025-05-07 16:54:16', 0);
INSERT INTO `user` VALUES (11, '学生', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 李欣欣', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACtklEQVR42t3X927UQBAG8HlTihBNiC66EAEU0UVXaCGk90I66QnpJNTQQn+AO5c72/z1sRu0sFrZZ98ZJJhPmgf4aWY8a1r+/g1LwVcsBl+wIGo++Iy54BNmg4+YETUdfMBUsIpJfxUT/nuM++8wJmrUf4sR/w2GRQ35rzHor2DAW0G/9wp93kv0ei/QI6rbe44u7xk6RXV4T9GeX0abqNb8ElryT9AsqjG/iIb8AupF1eXnUZubQ01uFtWiqnIzoqZRKepe7jHu5qZwR9RtdxK33AlUiLrpjoM4IG64YyAOiOvuKIgD4pqEcEBcdUdAHBBX3GEQB8RlR0A4IC45QyAOiIvOIxAHxAUJ4YA47wyCOCDOOQMgDoizTj+IA+KMhHBAlDt9IA6IcltAOCBO270gDohTdg8oLUKlWIQeiVApBXHS7gYlRZQahYiK6oRKKYgyCUkzTmYKdUIlapwKJQ5xwn4ISjNOUQkbJ5VCCLMTKnGI43YXqBiEGbkTKrITZsJ2ImyxzRSLWIMkQYRFLfZvyM9xCkuFBgn7OpmRO6GSBHHM7gT9ra+TuRNxkeOk78QvSALEUbsDVOydSBrzTqiY41TqTuiII5aA/KljFzZO+mKbd0LvhPrE6ikGcdhqB6VFxHUi6k7oi63uhJ5iEIesNlBSRKmJ+sTqi20iVJIiDlqtoLRvp7hORO1E2GKrTuhJgjggIWkfgHEX27wT5mKbUeOkJw6x32oBpX3FFrrY+gOw0GKbiDINkgSxT0LSjJOeuKd41GLLr5OJSDpOCrHXagb9K/8TaRB7rCYQB8TubCOIA2KXhHBA7Mw2gDggdmTrQRwQaxAOiO3ZOhAHxLZsrYT8/4itEsIBsSVbA+KA2JypBnFAbMo8AHFArEE4IDZmqkAcEBsy90EcEOslhANiXaYSPwB7jal1QY8EoQAAAABJRU5ErkJggg==', '暴躁、搞笑', 0, 0, 'AI', '2025-05-07 16:54:17', '2025-05-07 16:54:17', 0);
INSERT INTO `user` VALUES (12, '下属', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 邓浩波', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAC8klEQVR42t3X6UsVYRTH8XkbgYII0oog0oIUIoUIIoUIFi20IkV7FGIbLbSRFEkhFUYLrUjRHoUUFi20IFKUIFKIFIKFCHLtNmu9/HXmxYGHy8zcZ4aION//4MNzzpx7DTPnF9K5HlJ5HobzPQwVeBgc4+H7eA8DEzz0F3r4UuShr9hF72QXn6e66Clx0T3NRVepi49lLt7PdNFZ7qKjwsGbSgevqxy8nO3gebWDpzUO2msdPJ7roG2+g4cLbdxfbOPuEhu3l9u4WWfj+kobrattXF1r4/J6Gxc3Wji/2cLZegunt1ho2Wbh5A4LzbssHN9joWmfhaMHTBw+ZKKx0cTBIyYMCYj9TQSRgNh7jCASELubCSIBsfMEQSQgtp8iiATE1pafMCQgGs4QRAKi/hxBJCA2XSCIBMSGSwSRgFh3hSASEGtaCSIBseoaQSQgVtwgiARE3a00DAmIZXcIIgGx9B5BdBBR+YioGOEXheCSIBY9IEjSl+D8l1Djl+AYocYIzn8JLgliQRtBko4T54+TGo8Tp44TpyKypYOY94ggOgg13gnO3wk13gkubJw43gku7kv4iDntBNF9CXUn1HHyFztzJ4IQ/BIqQt0JLgmi9glBkoxT5k6oqTuhIriwrxOXBFHzjCBxPrFBqYvNO8GFjVPcsiGqXxAk7p2IWmweJ7W/dSeiELNe/YAR99hFLXbQOP0LRNVbgsS92GHHLnOc1BjBqTuRLR1EZQdBkiKCdiLo2IV9YrPdCU4HUdFJkKQvEZbuneDCxonTQZS/I0jSceKXUC92UGF3ggvbCU4HMeMDQXR/xap3IvNXbJI7oZsOoqyLILo/xcMQYYud+XXK3Aku7OvE6SBKuwnyv/yf0P06BSGm9xBEAqLk0wgMCYgpvQSRgJjURxAJiOKvBJGAKOoniARE4QBBJCAmfiOIBMS4QYJIQIwdIogERMFwCoYERP4IQSQg8tIEkYDINQkiAZFjE0QCYrRHEAmIUb9T+ANtMJHj08MTjAAAAABJRU5ErkJggg==', '友好善良喜欢帮助人', 0, 0, 'AI', '2025-05-07 16:54:25', '2025-05-07 16:54:25', 0);
INSERT INTO `user` VALUES (13, 'Jezira', '3a20abef00881f3a9549f50d5d507f99', 1, NULL, NULL, 'Jezira', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACe0lEQVR42t3WCUuUURQG4PuDIooiIoqiiIiiiMQss8xEyxQT0SxLzTLLxKxMccbZ931fnOWbzcEUJfpFb4eYifmmYSC4DnFeuD/g4b7n3CvKP9uw9YPOfjtKe7dQ2u1Acec2itudKJbvolDqQqFwH/l8N/LKA+SyPcilH0JJ9UJJ9kGJ9yMbfYRseACZ0BNkAoNI+4eQ9g4j7X6KlHMEKccoNm10LGNImseRND5DwjCBhO4FEtpJxNdfIr42hdjqNGIrM4h+fY3o51lElt8gsjSHyOI7hBfmEX7/AaH5BYTmPiL4dhHB2SUEZz4hMLUMwQERePWFIAwQ/kmCcED4n68QhAHCN/ENggPCN75KEAYI79gaQRggvKPrEBwQ3hENQRggPMNaCA4Iz5COIAwQ7kE9BAeEe8BAEAYI12MjBAeEq99EEAYIZ5+ZIAwQzl4rBAeEs8dGEAYIR7cdQjaiNq1COO45CSL5JlSQFiHsXS4I2XWqTasQ9k43QSTPhApSh6iPLITtjocgkge7Ns0Q1chA2Dp8ELK3kwrSAFGt0x+IBISt3U8QyStWBanMRLPIQFjbAhCy34naVAe7WWQgrDdDBJH82Kkgle10EDNRi7DcIIisOtUjfs9DZcWqIAeAsFyPEERyneoR1RXbKLIQ5mtRCNl1aoSo1ukviCSE+WqMIP/hB/BfEaYrcYIwQJguJyE4IEyXNgnCAGG8mILggDBeyBCEAcJwPgvBAWE4pxCEAUJ/NgfBAaE/kycIA4TudIEgDBC6UyUIDgjdyS2CMEBsnChDcEBsHN8mCAOE9th3CA4I7dEdgjBAaI7sEoQBQnN4D4IDQnNoH78AWbAlm9MLcGYAAAAASUVORK5CYII=', NULL, 0, 0, 'user', '2025-05-07 16:56:50', '2025-05-07 17:05:02', 0);
INSERT INTO `user` VALUES (14, 'zhongxy', '3a20abef00881f3a9549f50d5d507f99', 1, NULL, NULL, 'zhongxy', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACOUlEQVR42t3W/2vNURzH8ft/EdGyiCyRRSQiIovImmhrkUUkYpt9sdndnc1sNvS593O+ERGR/ENvr9cPjmvutXLu56b3qWfdzueX++h8+XxK2feXkn1blewr+oI+r0j2CX1EH9D7F5K9Q2/Rm2WpeuSQQfmSVKsoQ6+fS/UVWkUraHlRaktoES2g+WdSm0MVVF6Q2gyaRlNocl7ycTSGRp9KPoIeogfo/pzk99BddKci+e2KmFvoJhqaFXMDXZ+VkgaEuUaIAoQZLAOiAGEGCFGAMP2EKECYqzOAKECYK4QoQNjLhChA2D5CFCBs7xNAFCDsJUIUIOxFQDQg7IVpQBQg7HlCFCDsOUIUIGwPIQoQ9uwUIAoQ9gwhbUD8HEUh3GlC2rASEVIQwp16DEgbtlOEFIRwJwlpw5mIkIIQ7gQhiYj1BrdT/A3EH89bgHDHAUldiXUhQ7/+PFei0UhFuGOTgBR0sOvPxG9zddspQhIR7ighBSHqz0QjBLdThCQi3BFCCkbUb6e1BztCEhHuMCEFI3g7NTvYEZKIcIcmAGnhe6LZFRufrbmdIiQR4Q4S0kJEw1urv9z0dorziQh3gJAWveyaQv5yO8X5RITvHgfkP/uK/ReE30+IAoTfR4gChN8LiAaE3zMGiAKE7yJEAcLvJkQBwu96BIgChN9JiAKE30GIAoTfTogCROgcBUQBImwjRAEidBCiABG2jkhJAyJsIUQBImwmRAEibCJEASJsHAZEASJsGJYfYSjFqnJe2WEAAAAASUVORK5CYII=', NULL, 0, 0, 'user', '2025-05-07 16:57:35', '2025-05-07 17:03:12', 0);
INSERT INTO `user` VALUES (15, '霸总', 'f6f36df3fcf99c567a9cb1d606e85452', 1, NULL, NULL, '[AI] 顾景辰', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADPUlEQVR42t2X/S/WURjG75/0bnovTZRMpLwkSkJSmESEJD0lKb2RSZlKLypKUpnMSCYqMZWSjFSiFLP6h66+x5xnZ9999ZznsVo7n//gs+tc930fsjM5w87kgmmHVmJ6hitmHHbDzEx3zDrigdlZnphzzAv22d6wP+4DhxN+cDi5HnNPB2BeTiDm527CgjNBWJi3BYvyQ7H4bBiWFIRj6bkIOJ7fAcfCSCwriobThRg4XYzF8ktxcC6Oh8uVBKy4ugcrryXDtSQFq66nwu1mGtxK0+FeZoL7rYNYfTsDHuWZ8KzIwpqKo/CqzMbaeyew7v4peFflwKcqF77VefB9mA+/mgKQChL+tedBKkj41xaCVJDYUFcEUkEioP4iSAWJwEfFIBUkNjZcBqkgsenxVZAKEkGNJSAVJDY33dBEFJAIflIKUkEiuLlME1FAIqSlHKSCRMjTOyAVJEKf3wWpIBHWWglSQWLriwcgFSTC26pAshJTgUtYi6zEtvZqkGwSU4EnwbGUBEdWIqKjBiT7nDjsOdkiwZ6TtchKbH9ZC5LtBId1whrETnAsdcIsIimx41UdSLbYHFZsBiu2Hn2xGWKxrUVWIvJ1vSYiOZ3MItp0GhfRppMeJiEmMd4HC9PJlmLrJaI6G0CyI5bDk2Aj1mg6cXgnbElCjyWJqDeNINk9YRaZSILtCaNimyfTRCdYElPFkkR0V5MmIrnsOEZJ6J+TmIT4nP5GEkwi5l0zSHZjc3gSYrH1z0lMQuwEx9LGtiYJJhHT3QKSPTs47OzgxRYl9M+JJcEwKrYsshI73z8Dyd5O4ojVo98T+iT+dDtxZKeTkURsTytI9gCcDCMJESMJcdlxuIS1STCJXb1tIGskxOc02dlhVGz9xhaXnb7YIrIScX3tINlTXLxi9af4ZM+JSxht7D+NWBEZifgPHaB/9Z/Q304ye2JcREJid/8r0P/wKbKlE6JEwsdOTUQBicTPb0EqSCQOdGkiCkgkfekGqSCRNNgDUkEieagXpIJEytc+kAoSe4f7QSpIpA5/Aqkgse/HAEgFibSRQZAKEvtHh0AqSKSPfQOpIHFg7LsmooCE6ecISAUJ069R/AYi1fITob7SPQAAAABJRU5ErkJggg==', '霸道', 0, 0, 'AI', '2025-05-07 17:15:36', '2025-05-07 17:15:36', 0);

-- ----------------------------
-- Table structure for user_friend_relate
-- ----------------------------
DROP TABLE IF EXISTS `user_friend_relate`;
CREATE TABLE `user_friend_relate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户 id',
  `relateId` bigint(20) NOT NULL COMMENT '关系 id',
  `relateType` int(11) NULL DEFAULT NULL COMMENT '关系类型 1群聊 2好友',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_friend_id`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_friend_relate
-- ----------------------------
INSERT INTO `user_friend_relate` VALUES (1, 3, 1, 2, '2025-05-02 11:11:35', '2025-05-02 11:11:35');
INSERT INTO `user_friend_relate` VALUES (2, 1, 3, 2, '2025-05-02 11:11:35', '2025-05-02 11:11:35');
INSERT INTO `user_friend_relate` VALUES (3, 1, 2, 2, '2025-05-04 16:16:40', '2025-05-04 16:16:40');
INSERT INTO `user_friend_relate` VALUES (4, 2, 1, 2, '2025-05-04 16:16:40', '2025-05-04 16:16:40');
INSERT INTO `user_friend_relate` VALUES (5, 2, 1, 2, '2025-05-04 16:16:48', '2025-05-04 16:16:48');
INSERT INTO `user_friend_relate` VALUES (6, 1, 2, 2, '2025-05-04 16:16:48', '2025-05-04 16:16:48');
INSERT INTO `user_friend_relate` VALUES (7, 4, 1, 2, '2025-05-04 21:54:17', '2025-05-04 21:54:17');
INSERT INTO `user_friend_relate` VALUES (8, 1, 4, 2, '2025-05-04 21:54:17', '2025-05-04 21:54:17');
INSERT INTO `user_friend_relate` VALUES (9, 8, 1, 2, '2025-05-07 16:00:55', '2025-05-07 16:00:55');
INSERT INTO `user_friend_relate` VALUES (10, 1, 8, 2, '2025-05-07 16:00:55', '2025-05-07 16:00:55');
INSERT INTO `user_friend_relate` VALUES (11, 8, 3, 2, '2025-05-07 16:01:09', '2025-05-07 16:01:09');
INSERT INTO `user_friend_relate` VALUES (12, 3, 8, 2, '2025-05-07 16:01:09', '2025-05-07 16:01:09');
INSERT INTO `user_friend_relate` VALUES (13, 13, 8, 2, '2025-05-07 16:57:58', '2025-05-07 16:57:58');
INSERT INTO `user_friend_relate` VALUES (14, 8, 13, 2, '2025-05-07 16:57:58', '2025-05-07 16:57:58');
INSERT INTO `user_friend_relate` VALUES (15, 14, 1, 2, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_friend_relate` VALUES (16, 1, 14, 2, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_friend_relate` VALUES (17, 14, 3, 2, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_friend_relate` VALUES (18, 3, 14, 2, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_friend_relate` VALUES (19, 13, 1, 2, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_friend_relate` VALUES (20, 1, 13, 2, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_friend_relate` VALUES (21, 13, 3, 2, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_friend_relate` VALUES (22, 3, 13, 2, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_friend_relate` VALUES (23, 13, 14, 2, '2025-05-07 16:59:35', '2025-05-07 16:59:35');
INSERT INTO `user_friend_relate` VALUES (24, 14, 13, 2, '2025-05-07 16:59:35', '2025-05-07 16:59:35');

-- ----------------------------
-- Table structure for user_room_relate
-- ----------------------------
DROP TABLE IF EXISTS `user_room_relate`;
CREATE TABLE `user_room_relate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户 id',
  `roomId` bigint(20) NOT NULL COMMENT '房间 id',
  `latestReadMsgId` bigint(20) NULL DEFAULT NULL COMMENT '最新已读 id',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_room_id`(`userId` ASC, `roomId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_room_relate
-- ----------------------------
INSERT INTO `user_room_relate` VALUES (1, 1, 1, NULL, '2025-05-02 10:39:24', '2025-05-02 10:39:24');
INSERT INTO `user_room_relate` VALUES (2, 2, 1, NULL, '2025-05-02 10:44:06', '2025-05-02 10:44:06');
INSERT INTO `user_room_relate` VALUES (3, 3, 1, NULL, '2025-05-02 11:10:57', '2025-05-02 11:10:57');
INSERT INTO `user_room_relate` VALUES (4, 1, 2, NULL, '2025-05-02 11:11:35', '2025-05-02 11:11:35');
INSERT INTO `user_room_relate` VALUES (5, 3, 2, NULL, '2025-05-02 11:11:35', '2025-05-02 11:11:35');
INSERT INTO `user_room_relate` VALUES (6, 1, 3, NULL, '2025-05-04 16:16:40', '2025-05-04 16:16:40');
INSERT INTO `user_room_relate` VALUES (7, 2, 3, NULL, '2025-05-04 16:16:40', '2025-05-04 16:16:40');
INSERT INTO `user_room_relate` VALUES (8, 4, 1, NULL, '2025-05-04 21:53:25', '2025-05-04 21:53:25');
INSERT INTO `user_room_relate` VALUES (9, 1, 4, NULL, '2025-05-04 21:54:17', '2025-05-04 21:54:17');
INSERT INTO `user_room_relate` VALUES (10, 4, 4, NULL, '2025-05-04 21:54:17', '2025-05-04 21:54:17');
INSERT INTO `user_room_relate` VALUES (11, 2, 5, NULL, '2025-05-06 15:45:26', '2025-05-06 15:45:26');
INSERT INTO `user_room_relate` VALUES (12, 5, 5, NULL, '2025-05-06 15:45:26', '2025-05-06 15:45:26');
INSERT INTO `user_room_relate` VALUES (13, 2, 6, NULL, '2025-05-06 15:47:11', '2025-05-06 15:47:11');
INSERT INTO `user_room_relate` VALUES (14, 6, 6, NULL, '2025-05-06 15:47:11', '2025-05-06 15:47:11');
INSERT INTO `user_room_relate` VALUES (15, 2, 7, NULL, '2025-05-06 15:48:58', '2025-05-06 15:48:58');
INSERT INTO `user_room_relate` VALUES (16, 7, 7, NULL, '2025-05-06 15:48:58', '2025-05-06 15:48:58');
INSERT INTO `user_room_relate` VALUES (17, 2, 8, NULL, '2025-05-07 16:00:21', '2025-05-07 16:00:21');
INSERT INTO `user_room_relate` VALUES (18, 8, 8, NULL, '2025-05-07 16:00:21', '2025-05-07 16:00:21');
INSERT INTO `user_room_relate` VALUES (19, 1, 9, NULL, '2025-05-07 16:00:55', '2025-05-07 16:00:55');
INSERT INTO `user_room_relate` VALUES (20, 8, 9, NULL, '2025-05-07 16:00:55', '2025-05-07 16:00:55');
INSERT INTO `user_room_relate` VALUES (21, 3, 10, NULL, '2025-05-07 16:01:09', '2025-05-07 16:01:09');
INSERT INTO `user_room_relate` VALUES (22, 8, 10, NULL, '2025-05-07 16:01:09', '2025-05-07 16:01:09');
INSERT INTO `user_room_relate` VALUES (23, 8, 11, NULL, '2025-05-07 16:05:51', '2025-05-07 16:05:51');
INSERT INTO `user_room_relate` VALUES (24, 3, 11, NULL, '2025-05-07 16:05:51', '2025-05-07 16:05:51');
INSERT INTO `user_room_relate` VALUES (25, 1, 11, NULL, '2025-05-07 16:05:51', '2025-05-07 16:05:51');
INSERT INTO `user_room_relate` VALUES (26, 8, 12, NULL, '2025-05-07 16:08:10', '2025-05-07 16:08:10');
INSERT INTO `user_room_relate` VALUES (27, 9, 12, NULL, '2025-05-07 16:08:10', '2025-05-07 16:08:10');
INSERT INTO `user_room_relate` VALUES (28, 8, 13, NULL, '2025-05-07 16:51:02', '2025-05-07 16:51:02');
INSERT INTO `user_room_relate` VALUES (29, 1, 13, NULL, '2025-05-07 16:51:02', '2025-05-07 16:51:02');
INSERT INTO `user_room_relate` VALUES (30, 3, 13, NULL, '2025-05-07 16:51:19', '2025-05-07 16:51:19');
INSERT INTO `user_room_relate` VALUES (31, 3, 14, NULL, '2025-05-07 16:54:16', '2025-05-07 16:54:16');
INSERT INTO `user_room_relate` VALUES (32, 10, 14, NULL, '2025-05-07 16:54:16', '2025-05-07 16:54:16');
INSERT INTO `user_room_relate` VALUES (33, 8, 15, NULL, '2025-05-07 16:54:17', '2025-05-07 16:54:17');
INSERT INTO `user_room_relate` VALUES (34, 11, 15, NULL, '2025-05-07 16:54:17', '2025-05-07 16:54:17');
INSERT INTO `user_room_relate` VALUES (35, 1, 16, NULL, '2025-05-07 16:54:25', '2025-05-07 16:54:25');
INSERT INTO `user_room_relate` VALUES (36, 12, 16, NULL, '2025-05-07 16:54:25', '2025-05-07 16:54:25');
INSERT INTO `user_room_relate` VALUES (37, 2, 17, NULL, '2025-05-07 16:56:50', '2025-05-07 16:56:50');
INSERT INTO `user_room_relate` VALUES (38, 13, 17, NULL, '2025-05-07 16:56:50', '2025-05-07 16:56:50');
INSERT INTO `user_room_relate` VALUES (39, 2, 18, NULL, '2025-05-07 16:57:35', '2025-05-07 16:57:35');
INSERT INTO `user_room_relate` VALUES (40, 14, 18, NULL, '2025-05-07 16:57:35', '2025-05-07 16:57:35');
INSERT INTO `user_room_relate` VALUES (41, 8, 19, NULL, '2025-05-07 16:57:58', '2025-05-07 16:57:58');
INSERT INTO `user_room_relate` VALUES (42, 13, 19, NULL, '2025-05-07 16:57:58', '2025-05-07 16:57:58');
INSERT INTO `user_room_relate` VALUES (43, 13, 11, NULL, '2025-05-07 16:58:24', '2025-05-07 16:58:24');
INSERT INTO `user_room_relate` VALUES (44, 1, 20, NULL, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_room_relate` VALUES (45, 14, 20, NULL, '2025-05-07 16:58:30', '2025-05-07 16:58:30');
INSERT INTO `user_room_relate` VALUES (46, 3, 21, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (47, 14, 21, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (48, 1, 22, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (49, 13, 22, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (50, 3, 23, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (51, 13, 23, NULL, '2025-05-07 16:58:31', '2025-05-07 16:58:31');
INSERT INTO `user_room_relate` VALUES (52, 13, 24, NULL, '2025-05-07 16:59:35', '2025-05-07 16:59:35');
INSERT INTO `user_room_relate` VALUES (53, 14, 24, NULL, '2025-05-07 16:59:35', '2025-05-07 16:59:35');
INSERT INTO `user_room_relate` VALUES (54, 14, 11, NULL, '2025-05-07 16:59:42', '2025-05-07 16:59:42');
INSERT INTO `user_room_relate` VALUES (55, 8, 25, NULL, '2025-05-07 16:59:51', '2025-05-07 16:59:51');
INSERT INTO `user_room_relate` VALUES (56, 3, 25, NULL, '2025-05-07 16:59:51', '2025-05-07 16:59:51');
INSERT INTO `user_room_relate` VALUES (57, 1, 25, NULL, '2025-05-07 16:59:51', '2025-05-07 16:59:51');
INSERT INTO `user_room_relate` VALUES (58, 13, 25, NULL, '2025-05-07 16:59:51', '2025-05-07 16:59:51');
INSERT INTO `user_room_relate` VALUES (59, 8, 26, NULL, '2025-05-07 17:15:36', '2025-05-07 17:15:36');
INSERT INTO `user_room_relate` VALUES (60, 15, 26, NULL, '2025-05-07 17:15:36', '2025-05-07 17:15:36');

SET FOREIGN_KEY_CHECKS = 1;
