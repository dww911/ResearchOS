# Third-Party Notices

本阶段只审计和运行上游仓库自带代码，未复制、修改或发布其源码。五个候选仓库均包含 MIT `LICENSE` 文件；具体版权文本保留在 `phase00/upstream/*/LICENSE`。

| 上游 | 许可证 | 备注 |
|---|---|---|
| [Knowledge Vault](https://github.com/psypeal/knowledge-vault) | MIT | README 还提到可选 PageIndex（MIT）和多个可选 MCP/检索组件；接入前需单独核验版本和许可证。 |
| [MindCite](https://github.com/YYCCCHAOOO/MindCite) | MIT | 另有 `NOTICE.md` 和 `SECURITY.md`；真实模型/embedding provider 不在本阶段启用。 |
| [Research Knowledge Workflow](https://github.com/muyunping123/research-knowledge-workflow) | MIT | MCP server 的 Python 依赖由 `mcp-server/pyproject.toml` 声明。 |
| [Codex Literature Workflow](https://github.com/ParkerGong/codex-literature-workflow) | MIT | 依赖 pypdf、pdfplumber、PyMuPDF、Pillow、requests、BeautifulSoup、Selenium 等；可选 QMD 和浏览器组件须单独核验。 |
| [Damon Academic Workflow](https://github.com/cll461943-rgb/damon-academic-workflow) | MIT | 主要为 Skills、JSON schema、模板和文档；示例资源随仓库保留。 |

## Planned references

官方 Zotero Skill、第三方 Zotero MCP、MinerU 和 QMD 仅列入规划参考，尚未下载或安装。进入 Phase 01 前，需要为每个实际启用的组件记录来源 commit、许可证、依赖版本、网络范围和数据写入边界。
