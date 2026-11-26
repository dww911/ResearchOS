# Decision Log

## 2026-11-26 — Start Phase 00

- **决定**：在 `E:\自媒体\zotero_obsidian_codex\phase00` 建立隔离工作区。
- **原因**：用户要求直接在当前项目中开发，且不安装到 C 盘。
- **动作**：浅克隆五个候选仓库；只做源码/许可证/脚本审计和离线 smoke test。
- **未做**：未运行未知安装脚本，未创建 Conda/venv，未连接真实 Zotero/Obsidian，未接入真实论文。

## 2026-11-26 — Test interpretation

- Knowledge Vault 通过 `PYTHONUTF8=1` 后纳入“核心脚本可测”，但保留默认 Windows 编码失败记录。
- Research Knowledge Workflow 核心 unittest 纳入“已验证”，MCP stdio 因缺 SDK 单独标为 skipped。
- Codex Literature Workflow 的 40 项回归测试通过，但不改变其 README 对 Windows 未验证的声明。
- 暂不选择 Fork 基础仓库；等待统一真实论文 benchmark。
