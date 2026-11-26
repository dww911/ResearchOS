# ResearchOS

基于 Codex + Zotero + Obsidian 的个人科研工作台。当前处于 **Phase 00：开源项目实测与技术选型**，先建立可复核的证据，再决定是否进入正式产品开发。

## 当前状态

- 已在本项目目录建立 `phase00/` 隔离测试工作区。
- 已克隆并审计五个候选仓库，未执行未知安装脚本，未写入 Zotero 或 Obsidian。
- 已运行可离线运行的合成测试，结果见 [TEST_REPORT.md](TEST_REPORT.md)。
- 当前暂不开发正式 UI、三维图谱、复杂多 Agent 系统或科研代码适配器。
- 真实 10 篇论文评估集尚未接入，不能把当前 smoke test 当作科学论文能力结论。

## 目录

```text
ResearchOS/
├── phase00/                 # 隔离的上游仓库、证据和合成测试空间
│   ├── upstream/            # 五个候选仓库（各自保留 .git）
│   ├── evidence/            # 审计输出与命令证据
│   ├── reports/             # 阶段报告
│   └── test-vaults/         # 仅放合成测试 Vault
├── ENVIRONMENT.md
├── UPSTREAM_EVALUATION.md
├── TEST_REPORT.md
├── ARCHITECTURE.md
├── ROADMAP.md
├── FAILED_AND_OPEN.md
├── THIRD_PARTY_NOTICES.md
├── DECISION_LOG.md
└── AGENTS.md
```

## 本地运行约束

所有本项目脚本、虚拟环境、缓存和测试输出必须放在 `E:\自媒体\zotero_obsidian_codex` 下。不要把依赖安装到 C 盘，也不要修改现有 Zotero 数据库、Obsidian Vault 或 Codex 用户配置。需要新增依赖时，先建立项目内 `.venv` 并记录路径，安装前再单独确认。

## 下一步

先补齐真实论文评估集的合法文件和人工参考答案，再以统一问题集对候选项目做可比测试。只有 Phase 00 的门禁通过后，才进入 Phase 01 的最小科研闭环。
