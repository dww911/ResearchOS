# ResearchOS Phase 00 Architecture

当前架构只定义边界，不实现正式产品。

```text
Codex / Skills
      │ 任务编排、人工审批、证据约束
      ▼
ResearchOS adapters  ← Phase 01+ 才实现
      ├── Zotero read-only connector
      ├── Obsidian file-first connector
      ├── upstream workflow adapters
      └── deterministic validation
      ▼
Research Core
      ├── canonical entities and IDs
      ├── source manifests and hashes
      ├── Claim–Evidence records
      ├── SQLite/FTS derived index
      └── task state and recovery
```

## Source of truth

| 数据 | 权威来源 |
|---|---|
| 作者、标题、DOI、附件身份 | Zotero |
| 科研知识与人工笔记 | Obsidian Markdown |
| 主张、证据和验证状态 | ResearchOS 结构化记录 + 可读 Markdown |
| 实验原始数据 | 用户科研项目目录 |
| 检索索引 | 可重建 SQLite 缓存 |
| Agent 任务状态 | 项目内持久化任务记录 |

SQLite 只能做派生索引，不能替代 Zotero 或 Obsidian。Zotero 接入默认只读，任何导入/修改都必须走用户确认的 Desktop/API 流程，绝不直接写 `zotero.sqlite`。

## Phase 00 隔离边界

`phase00/upstream` 只保存候选仓库；`phase00/test-vaults` 只保存合成测试 Vault；`phase00/evidence` 保存可复核证据。真实论文、私人笔记、Zotero 数据库和未发表实验数据不得进入此目录。

## 后续数据契约草案

后续实现使用 `Paper`、`Concept`、`Method`、`Claim`、`Evidence`、`Experiment`、`Artifact`、`Task` 等实体，所有实体都需要稳定 ID、来源定位、验证状态和版本信息。正式 schema 在真实评估集确定后再冻结。
