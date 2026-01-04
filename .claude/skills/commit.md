---
name: commit
description: 快速提交代码到 Git 仓库并推送到远程
---

# Git 提交 Skill

请执行以下 Git 操作：

1. **检查状态**：运行 `git status` 查看当前更改
2. **添加更改**：使用 `git add .` 添加所有更改到暂存区
3. **创建提交**：使用 `git commit -m "用户提供的提交信息"` 创建提交
4. **推送到远程**：运行 `git push` 推送到远程仓库
5. **确认结果**：显示提交是否成功

## 参数
- `message` (必需): 提交信息

## 使用示例
```
/commit "添加新功能"
/commit "fix: 修复登录问题"
/commit "docs: 更新 README"
```

## 提交信息规范建议
- 使用清晰简洁的描述
- 可以使用约定式提交格式：
  - `feat:` 新功能
  - `fix:` 修复问题
  - `docs:` 文档更新
  - `style:` 代码格式调整
  - `refactor:` 重构代码
  - `test:` 添加测试
  - `chore:` 构建/工具链更新
