---
name: memory
description: 这个 Skill 可以告诉 Agent 如何保存和读取记忆
---

## 介绍

这个 Skill 负责管理 Agent 的记忆，包括存储、更新和检索记忆。

## 何时使用

- 当 Agent 启动一个新的会话时
- 当 Agent 需要询问用户信息时
- 当 Agent 需要保存重要的信息以供将来参考时
- 当 Agent 需要检索之前保存的记忆以提供更相关的响应时
- 当 Agent 需要更新现有的记忆以反映新的信息或更正时

## 启动时的初始化流程

扫描所有记忆文件（`*.md`），并加载它们的yaml头部信息（`name`和`tags`）到内存中，建立一个索引以便快速检索。

## 记忆存储路径

- 数据存放在`~/Documents/NAS/Memory/`目录下
- 每一类记忆以一个 `.md` 文件的形式存储，文件名是记忆的`name`

## 记忆文件格式

```
---
name: 个人信息
tags: 手机,邮箱
---

### 联络信息
- 手机: 1234567890
- 邮箱: abc@xxx.com
```

## 使用记忆后的强制执行步骤

### 读取记忆后（必须执行）
1. **记录 .log 文件**
   - 格式：`YYYY-MM-DD HH:MM:SS 读取了[记忆名]记忆，用于[具体用途]`
   - 必须调用 `Edit` 工具更新 `[记忆名].log` 文件

2. **验证执行**
   - 确认 log 文件已成功追加新记录

### 修改记忆后（必须执行）
1. **记录 .log 文件**
   - 格式：`YYYY-MM-DD HH:MM:SS 更新了[记忆名]记忆，变更：[变更内容简述]`

2. **更新 tags 字段**
   - 如果记忆内容新增了关键词，必须在 `.md` 文件的 yaml 头部更新 `tags`

3. **验证执行**
   - 重新读取确认修改已生效

### ⚠️ 警告：不执行这些步骤的后果
- 记忆追踪断裂，无法追溯历史操作
- 用户质疑技能有效性
- 需要手动补录，浪费时间

## 操作示例

### 读取记忆后的标准流程
```
1. Read ~/Documents/NAS/Memory/xxx.md
2. 使用记忆内容回答问题/完成任务
3. Read ~/Documents/NAS/Memory/xxx.log
4. Edit ~/Documents/NAS/Memory/xxx.log，追加新行：
   "2024-01-15 10:30:00 读取了[xxx]记忆，用于[具体用途]"
```

### 修改记忆后的标准流程
```
1. Read ~/Documents/NAS/Memory/xxx.md
2. Edit ~/Documents/NAS/Memory/xxx.md，修改内容
3. Read ~/Documents/NAS/Memory/xxx.log
4. Edit ~/Documents/NAS/Memory/xxx.log，追加新行：
   "2024-01-15 10:30:00 更新了[xxx]记忆，变更：[简述]"
5. 如有新关键词，同步更新 .md 的 tags 字段
```
