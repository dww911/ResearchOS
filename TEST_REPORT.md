# Phase 00 Test Report

测试日期：2026-11-26。所有命令均在 `E:\自媒体\zotero_obsidian_codex\phase00\upstream\...` 下执行，使用仓库自带合成数据或临时目录；没有接入真实 Zotero 全库、生产 Obsidian Vault 或私人 PDF。

## Results

| 项目 | 命令 | 结果 | 说明 |
|---|---|---|---|
| Knowledge Vault | `py tests/test_kv.py` | **failed**：9 passed，1 error | `Path.read_text()` 按 Windows GBK 解码生成的 UTF-8 `AGENTS.md`，出现 `UnicodeDecodeError`。这是本机默认编码下的兼容问题。 |
| Knowledge Vault | `$env:PYTHONUTF8='1'; py tests/test_kv.py` | **verified**：10/10 passed | 核心 Python 回归测试通过；不代表 POSIX 插件验证通过。 |
| MindCite | `py tools/smoke_test.py` | **verified** | `ok: true`；结构、安全扫描、demo 索引、分类队列、标签预览、契约和空索引探针均通过。 |
| Research Knowledge Workflow | `$env:PYTHONPATH='src'; py -m unittest discover -s tests -v` | **verified**：11 passed，2 skipped | 核心测试通过；两项 stdio/MCP 测试因官方 `mcp` SDK 未安装而跳过。第一次未设置 `PYTHONPATH` 的直接运行无法导入 `src` 包，属于未安装状态下的入口差异。 |
| Codex Literature Workflow | `py -m unittest discover -s tests -v` | **verified**：40/40 passed | 包括安装器安全、PDF 探针、工作区初始化、Zotero 脚本别名保护等。 |
| Damon Academic Workflow | `py scripts/validate_card.py examples/heavy-paper-deep-read.example.json` | **verified** | 示例 `HeavyPaperDeepRead` JSON schema 校验通过。未发现完整自动化测试入口。 |

## Interpretation

- 已验证的是确定性脚本和合成数据行为，不是论文理解、图表理解或证据定位准确率。
- Knowledge Vault 的失败具有可复现的 Windows 默认编码触发条件；后续适配器需强制 UTF-8 读写或在测试前设置 UTF-8 模式。
- Research Knowledge Workflow 的 MCP 协议面仍未实测，不能把核心 unittest 通过等同于 MCP server 可用。
- 五个项目均没有在本阶段执行真实 Zotero 写入；“零未经授权写入”在本阶段成立，因为没有写入动作。

## Evidence files

- `phase00/evidence/repo-audit.txt`：commit、README、许可证、manifest 和危险命令静态扫描。
- `phase00/evidence/phase00-rerun.log`：通过 `scripts/phase00_audit.ps1` 在项目目录内重跑环境检查和五个项目的已选验证入口；各步骤退出码为 0。
- `phase00/upstream/*`：固定 shallow clone，保留各自 `.git`。
- 上游测试产生的临时目录在测试结束后由测试自身清理；MindCite demo 输出已由 smoke test 清理。
