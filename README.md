# 在线聊天系统

本项目为一个基于 Netty 的在线聊天系统，包含前后端分离架构：

- **后端仓库**：[online-chat-netty](https://github.com/jasminelee162/online-chat-netty)
- **前端仓库**：[online-chat-react](https://github.com/jasminelee162/online-chat-react)

---

## 项目简介

本系统实现了用户注册、登录、好友管理、单聊、群聊、消息推送、离线消息、消息已读/未读、消息历史、权限校验等核心功能，适用于 IM 即时通讯场景。  
采用 Netty 实现高性能长连接通信，前端基于 React + Ant Design，界面简洁，交互流畅。

---

## 系统架构

```
┌─────────────┐         ┌──────────────────┐
│  React前端  │◄───────►│ Spring Boot+Netty │
└─────────────┘         └──────────────────┘
         │                      │
         │      Redis/MySQL     │
         └──────────────────────┘
```

- 前端：React + Ant Design + WebSocket 客户端
- 后端：Spring Boot + Netty + WebSocket + Redis + MySQL

---

## 功能模块详解

### 1. 用户模块

- 用户注册、登录（密码加密存储，JWT 鉴权）
- 支持头像上传、昵称修改
- 用户在线/离线状态管理

### 2. 好友管理

- 添加好友（申请/同意/拒绝流程）
- 删除好友、拉黑好友
- 查看好友列表、好友信息

### 3. 单聊模块

- 发起单聊，实时消息推送
- 消息已读回执、未读消息数统计
- 消息撤回、删除
- 聊天历史消息查询
- 离线消息存储与补发

### 4. 群聊模块

- 创建群聊，邀请好友入群
- 群主/管理员权限管理
- 群成员管理（踢人、禁言、退群等）
- 群组公告、群资料修改
- 群聊消息实时推送、历史消息查询

### 5. 消息服务

- 基于 Netty 实现 WebSocket 长连接
- 支持文本、表情、图片等多种消息类型
- 消息发送确认、消息持久化（MySQL/Redis）
- 消息推送机制（点对点、广播）

### 6. 通知与系统消息

- 好友请求、群邀请、系统公告通知
- 通知已读、未读管理

### 7. 安全与权限

- JWT 用户身份认证
- 敏感词过滤、消息内容安全校验
- 权限分级（普通用户、管理员、群主）

### 8. 其他扩展

- 支持多端同时在线
- 支持消息撤回、漫游消息
- 支持简单表情包和图片发送

---

## 技术栈

- **前端**：React, Ant Design, WebSocket
- **后端**：Spring Boot, Netty, WebSocket, Redis, MySQL, Lombok, MyBatis

---

## 快速启动

### 后端

1. 克隆后端项目  
   `git clone https://github.com/jasminelee162/online-chat-netty.git`
2. 配置数据库、Redis 连接
3. 启动 Spring Boot 应用

### 前端

1. 克隆前端项目  
   `git clone https://github.com/jasminelee162/online-chat-react.git`
2. `npm install` 安装依赖
3. `npm start` 启动开发服务器

---

## 相关仓库

- [online-chat-netty](https://github.com/jasminelee162/online-chat-netty) （后端源码）
- [online-chat-react](https://github.com/jasminelee162/online-chat-react) （前端源码）

---

## 截图预览

> 可以在此处放置前后端运行截图。

---

## License

MIT
