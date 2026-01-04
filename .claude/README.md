# Claude Code Skills

本项目包含自定义 Claude Code Skills，用于简化开发工作流。

## 可用 Skills

### `/commit` - 提交代码
快速提交代码到 Git 仓库并推送到远程。

**用法：**
```
/commit "你的提交信息"
```

**示例：**
```
/commit "feat: 添加用户登录功能"
/commit "fix: 修复导航栏显示问题"
/commit "docs: 更新 API 文档"
```

### `/save` - 快速保存
快速保存当前更改并推送（自动生成提交信息）。

**用法：**
```
/save
```

## 项目结构

```
.claude/
├── skills/
│   ├── commit.md    # 代码提交 Skill
│   └── save.md      # 快速保存 Skill
└── README.md        # 本文件
```

## 约定式提交格式

建议使用以下前缀：

- `feat:` 新功能
- `fix:` 问题修复
- `docs:` 文档更新
- `style:` 代码格式
- `refactor:` 代码重构
- `test:` 测试相关
- `chore:` 构建/工具
