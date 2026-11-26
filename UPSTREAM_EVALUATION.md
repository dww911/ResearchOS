# Upstream Evaluation

审计日期：2026-11-26。五个仓库均以 `git clone --depth 1` 拉取到 `phase00/upstream/`，未执行安装脚本。commit、文件清单和脚本扫描保存在 `phase00/evidence/repo-audit.txt`。

## Candidate matrix

| 项目 | commit | 许可证 | 实测入口 | Windows 观察 | 适合作用 |
|---|---|---|---|---|---|
| Knowledge Vault | `d08f39b` | MIT | `py tests/test_kv.py` | Python 核心可运行；默认 GBK 下有编码错误，启用 UTF-8 后通过；完整插件验证依赖 Bash/Codex | 知识库底层候选 |
| MindCite | `ac20ef5` | MIT | `py tools/smoke_test.py` | 合成 demo 在 Windows 通过；真实 Zotero/模型路径未测 | Zotero 索引、精读和分类流程参考 |
| Research Knowledge Workflow | `4166c21` | MIT | MCP server unittest，`PYTHONPATH=src` | 核心测试通过；MCP SDK 未安装导致两项跳过；安装脚本会写用户配置，暂不执行 | 证据约束、主题知识和写作流程参考 |
| Codex Literature Workflow | `84b7fff` | MIT | `py -m unittest discover -s tests -v` | 40/40 通过；README 明确 Windows 未验证，依赖 Poppler/Tesseract/QMD 等可选组件 | 文献发现、PDF-first、manifest 和任务编排参考 |
| Damon Academic Workflow | `4459b13` | MIT | `py scripts/validate_card.py ...` | 示例 JSON 校验通过；未发现完整自动化测试 | 图表精读、证据卡和审计模板参考 |

## 功能和安全观察

### Knowledge Vault

源码显示 `scripts/kv.py` 负责 manifest、锁、原子写入、回滚、索引和 lint；旧 `.sh` 文件是兼容包装器。README 声称 Windows 支持，但完整插件检查脚本仍以 POSIX shell 为入口。Zotero、PageIndex 和学术检索属于可选集成，不能从 README 推断已在本机可用。

### MindCite

仓库包含合成 `examples/demo-vault`、结构检查、安全扫描、Zotero 索引和精读脚本。smoke test 通过了 demo 健康检查、分类审核队列、标签候选预览、数据契约校验和空索引探针。真实 Zotero 路径、模型 key、全文质量和写回能力尚未测试。

### Research Knowledge Workflow

MCP server 的核心是只读索引和显式 `apply=true` 写入；测试使用临时 Vault 和 mocked Zotero。README 提供 PowerShell 安装路径，但安装脚本会创建环境并写入用户配置，因此本阶段只审计不执行。其“知识笔记”是检索线索，不应替代原始论文证据。

### Codex Literature Workflow

该项目的确定性辅助脚本和回归测试最完整，覆盖环境报告、PDF 探针、安装安全、Zotero linked-file mapping 和别名/硬链接保护。项目自身明确把 macOS 作为维护测试平台、Windows 记为未验证；因此测试通过不能自动证明 Windows 端到端可用。

### Damon Academic Workflow

Damon 强制先生成 `HeavyPaperDeepRead` JSON，再做图表/表格询问、Obsidian 渲染和审计。其核心资产是 Skills、模板和 schema，自动化运行面较少；当前应作为精读和证据卡设计参考，不作为底层运行时。

## 初步技术判断

Phase 00 尚未完成真实论文横向 benchmark，因此不做最终 Fork 决策。当前最合理的候选组合是：以 ResearchOS 自有适配层为边界，吸收 Knowledge Vault 的状态管理、Codex Literature Workflow 的 manifest/PDF 安全测试、MindCite 的 Zotero/分类流程、Research Knowledge Workflow 的证据约束、Damon 的结构化深读模板；是否 Fork 某一仓库必须等真实评估集和许可证依赖清单完成后决定。
