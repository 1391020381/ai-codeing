---
name: go-run-rewrite-go-files
description: >-
  Before running `go run *.go` (or multiple package .go files), rewrites those
  .go files from the shell so disk matches intent, then runs. Use when the user
  runs Go with globs, asks to refresh .go files before run, or mentions this
  skill by name.
---

# go run 前先重写 .go 文件

## 目标

执行 `go run *.go`（或同一包内多个 `.go` 文件）时，**先用命令行把将要参与编译的 `.go` 文件写回磁盘**，再执行 `go run`，避免未保存缓冲、编码或换行与磁盘不一致等问题。

## 推荐流程（默认）

1. 在工作目录中确定与 `go run` 相同的文件集合（通常为当前目录 `*.go`，或用户给出的路径列表）。
2. **重写磁盘上的源码**：对这批文件执行 `gofmt -w`（Go 自带，会按标准格式写回文件，等价于“从命令行重新写入”）。
3. 再执行 `go run`，例如 `go run *.go` 或 `go run .`（若该目录为单包且更合适）。

### PowerShell（Windows）一行示例

```powershell
gofmt -w *.go; if ($LASTEXITCODE -eq 0) { go run *.go }
```

### Bash（Git Bash / WSL / macOS / Linux）

```bash
gofmt -w *.go && go run *.go
```

### 若当前目录是单包且希望用目录语义

```powershell
gofmt -w .; if ($LASTEXITCODE -eq 0) { go run . }
```

## Agent 执行约定

当用户要求运行 `go run *.go` 或等价多文件 `go run` 时：

1. 在正确的工作目录下先运行 `gofmt -w`，作用范围至少覆盖本次 `go run` 会编译的 `.go` 文件（常用：`gofmt -w *.go` 或 `gofmt -w .`）。
2. `gofmt` 成功后再运行 `go run ...`。
3. 若用户明确不需要格式化、只要“原样刷盘”，再改用项目内脚本或用户指定方式；默认仍优先 `gofmt -w`。

## 可选：本 skill 附带脚本

[scripts/go-run-with-rewrite.ps1](scripts/go-run-with-rewrite.ps1)：对参数中的每个 `.go` 文件先 `gofmt -w`，再 `go run` 传入相同参数；无参数时对当前目录全部 `*.go` 执行。

```powershell
# 从仓库根目录（路径按你本机调整）
& "d:\github\ai-codeing\.cursor\skills\go-run-rewrite-go-files\scripts\go-run-with-rewrite.ps1" *.go
```
