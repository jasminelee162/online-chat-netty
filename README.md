# 在线聊天系统

本项目为一个基于 Netty 的在线聊天系统，包含前后端分离架构：

- **后端仓库**：[online-chat-netty](https://github.com/jasminelee162/online-chat-netty)
- **前端仓库**：[online-chat-react](https://github.com/jasminelee162/online-chat-react)

---

## 项目简介


- 本系统实现了用户注册、登录、好友管理、单聊、群聊、消息推送、离线消息、消息已读/未读、消息历史、权限校验等核心功能，适用于 IM 即时通讯场景。  
采用 Netty 实现高性能长连接通信，前端基于 React + Ant Design，界面简洁，交互流畅。
此外，系统集成了基于大模型的 AI 智能聊天功能，支持创建具有不同性格设定的 AI 虚拟角色，实现 AI 陪聊、角色扮演、情景对话等扩展能力。AI 模块结合聊天上下文与历史消息生成回复，并通过 WebSocket 实时推送，实现更加智能化的即时通讯体验。
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
- 支持头像上传（自动生成名字对应头像）、昵称修改
- 用户在线/离线状态管理

### 2. 好友管理

- 添加好友（申请/同意/拒绝流程）
- 删除好友、拉黑好友
- 查看好友列表、好友信息

### 3. 单聊模块

- 发起单聊，实时消息推送
- 消息已读回执、未读消息数统计
- 聊天历史消息查询
- 离线消息存储与补发
- 视频通话

### 4. 群聊模块

- 创建群聊，邀请好友入群
- 群聊消息实时推送、历史消息查询

### 5. AI 智能聊天模块

- 支持创建 AI 虚拟角色
- 支持自定义 AI 名称、账号与性格设定
- 基于大模型生成上下文对话内容
- 自动读取最近聊天记录作为上下文
- AI 回复消息自动保存至数据库
- 通过 WebSocket 实现 AI 消息实时推送
- 创建 AI 后自动生成专属聊天室
- 支持角色扮演、情景对话等聊天模式

#### AI 角色示例

```text
角色名称：ABC
角色性格：聪颖、果断
角色类型：AI 虚拟角色
```
### 6. 消息服务

- 基于 Netty 实现 WebSocket 长连接
- 支持文本、表情、文件等多种消息类型
- 消息发送确认、消息持久化（MySQL/Redis）
- 消息推送机制（点对点、广播）

### 7. 通知与系统消息

- 好友请求、群邀请、系统公告通知
- 通知已读、未读管理

### 8. 安全与权限

- JWT 用户身份认证
- 敏感词过滤、消息内容安全校验

---
## AI 模块实现说明

### AI 聊天流程

```text
用户发送消息
        ↓
获取最近聊天记录
        ↓
拼接角色设定与上下文
        ↓
调用 AI 大模型接口
        ↓
生成 AI 回复
        ↓
保存消息记录
        ↓
WebSocket 实时推送
```

### AI 大模型集成

系统已接入智谱 AI（Zhipu API），支持：

- 上下文连续对话
- 性格化角色回复
- 历史消息记忆
- 温度参数调节（temperature）
- 异步 AI 消息处理

### AI 数据设计

AI 用户与普通用户统一存储于用户表中，通过角色字段进行区分：

- `userRole`：角色类型（AI / USER）
- `userProfile`：AI 性格描述
- `userAccount`：AI 账号标识
- `userName`：AI 显示名称

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


<img width="2560" height="1369" alt="演示图片" src="https://github.com/user-attachments/assets/7546f1e7-3a70-4ca1-ad58-35709cbc9c93" />


---

## License

MIT
