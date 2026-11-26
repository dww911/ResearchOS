# Environment Audit

审计日期：2026-11-26（Asia/Shanghai）  
审计范围：本机工具可见性和候选项目运行前置条件。未安装新依赖。

| 项目 | 实测状态 | 证据/备注 |
|---|---|---|
| Windows | Windows 11 Home 10.0.26200，64 位 | PowerShell `Get-CimInstance Win32_OperatingSystem` |
| Python | 3.14.3 | `py --version` |
| Git | 2.50.1.windows.1 | `git --version` |
| Node.js | v24.14.0 | `node --version` |
| npm | 11.9.0 | `npm --version` |
| Conda | 23.1.0 | `conda --version` |
| micromamba | 未找到 | 未安装/不在 PATH |
| QMD | 未找到 | 未安装/不在 PATH |
| Codex | 已安装 | `C:\Users\Lenovo\AppData\Local\Programs\OpenAI\Codex\bin\codex.exe` |
| Zotero Desktop | 已安装，10.0.8 | `C:\Program Files\Zotero\app\application.ini`；本次未启动、未读库 |
| Zotero CLI | 未找到 | `Get-Command zotero` 无结果 |
| Obsidian Desktop | 已安装痕迹 | `C:\Users\Lenovo\AppData\Roaming\Obsidian` 和开始菜单快捷方式；未定位 CLI、未打开 Vault |
| Bash | Git for Windows 提供 | 可见 `bash`，仅用于判断 POSIX 脚本可用性，未作为主测试入口 |

## 依赖策略

本阶段没有创建虚拟环境，也没有执行 `pip install`、`npm install`、Conda 环境创建或上游安装脚本。后续若需要安装，目标必须显式设为项目目录内的 `.venv` 或其他 E 盘路径，并在安装前记录具体命令。

## 当前可运行性结论

- Python、Git、Node 和 Codex 基础条件满足。
- Zotero/Obsidian 桌面程序存在，但连接能力尚未验证；不能把“已安装”算作“已连接”。
- QMD、micromamba 和官方 Zotero MCP 未在本机命令行验证。
- Windows 默认文本编码会影响至少一个上游测试；见 [TEST_REPORT.md](TEST_REPORT.md)。
