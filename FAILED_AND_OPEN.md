# Failed and Open Items

## Reproducible failures

1. **Knowledge Vault 默认编码错误**：Windows PowerShell 环境运行 `py tests/test_kv.py` 时，测试用 `Path.read_text()` 读取 UTF-8 生成的 `AGENTS.md`，按系统 GBK 解码失败。设置 `PYTHONUTF8=1` 后通过。后续适配不能依赖调用者临时设置环境变量，应修复上游或在隔离入口明确强制 UTF-8。
2. **Research Knowledge Workflow 未安装状态的直接 unittest 入口**：从 `mcp-server` 目录直接运行测试时找不到 `src` 包；使用安装后的包或 `PYTHONPATH=src` 可通过。官方 MCP SDK 未安装，stdio 两项被跳过。

## Open items before Phase 01

- 合法获取并登记 10 篇 4D-STEM/DPC/Ptychography/PN 结/CTF 论文；当前没有用户指定的测试文件。
- 为每篇论文制作 DOI/标题/版本、页码证据、图表、公式、实验参数和人工参考答案。
- 决定是否在 E 盘创建项目内 `.venv`，并只安装最小测试依赖；不能落到 C 盘。
- 验证官方 Zotero Skill/connector 在当前 Codex 会话中是否可用；当前尚未启用或对真实库发起只读请求。
- 定位用户允许使用的 Obsidian Vault 路径；当前只检测到桌面程序痕迹，没有写入授权路径。
- 评估 Knowledge Vault、MindCite 和 Research Knowledge Workflow 的第三方依赖许可证及实际网络请求。
- 补齐 Research Knowledge Workflow 的 MCP SDK 测试，确认 stdio 协议层。
- 定义统一 Token/运行时记录格式；当前 smoke test 没有可比的 LLM 成本数据。
- 在真实论文 benchmark 前不做“最佳项目”或“准确率”结论。
