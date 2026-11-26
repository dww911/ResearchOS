# ResearchOS Agent Rules

## Scope

当前只执行 Phase 00：上游项目审计、隔离 smoke test、统一评估设计和技术选型。不要提前开发正式 UI、Obsidian 插件、三维图谱、复杂多 Agent 系统或实验代码重构。

## Storage and safety

- 项目根目录固定为 `E:\自媒体\zotero_obsidian_codex`。
- 不要在 C 盘安装依赖、创建虚拟环境或写入生成物。
- 不读取或输出凭据、API key、浏览器 cookie、Zotero SQLite 内容或私人 Vault 内容。
- 不执行未经审计的上游安装脚本；先检查其依赖、网络请求和写入路径。
- 不直接写入 `zotero.sqlite`，不对真实 Zotero 文献执行删除、合并或修改。
- 测试只使用 `phase00/test-vaults` 或上游自带合成数据，真实论文需有明确允许范围。

## Evidence discipline

把结果分为 `verified`、`failed`、`skipped`、`not tested` 和 `docs-only`。README 中的声明不算运行证据。所有性能和准确率结论必须引用命令、commit、输入范围和输出文件。

## Write policy

只写入本项目新增的报告、审计脚本和合成测试目录。任何 Zotero、Obsidian 或个人科研目录写入都要单独确认并记录目标路径、变更预览和回滚方式。
