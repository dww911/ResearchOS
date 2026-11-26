# ResearchOS Roadmap

## Phase 00 — 开源项目实测与选型（当前）

- [x] 建立项目内隔离测试目录
- [x] 克隆五个候选仓库
- [x] 审计 README、许可证、依赖、脚本和测试入口
- [x] 运行可离线/合成 smoke test
- [x] 记录 Windows 兼容性和失败原因
- [ ] 准备 10 篇合法测试论文与人工参考答案
- [ ] 统一执行文献身份、证据定位、参数提取和检索测试
- [ ] 完成最终基础仓库/适配器决策

## Phase 01 — 最小科研闭环

只在 Phase 00 门禁通过后开始：项目内配置、只读 Zotero 探测、Obsidian 测试 Vault、统一文献笔记模板、增量导入、重复检测和失败恢复。

## Phase 02 — Scientific Paper Intelligence

页面级 PDF 解析、章节/图表/公式/参数结构化和原文位置核验。复杂解析器按需接入，不能把未核对的模型输出当证据。

## Phase 03 — Research Knowledge Engine

概念与方法卡、跨论文对比、语义关系、矛盾结论和可重建检索索引。

## Phase 04 — Claim & Evidence Engine

Claim Ledger、Evidence Registry、引用核验、证据覆盖和写作守门。

## Phase 05 — 实验与写作联动

读取 manifest、日志、配置和结果文件；关联研究问题、假设、代码版本和论文证据。

## Phase 06 — Obsidian 产品化

先使用原生 Bases 和 file-first 输出，核心工作流稳定后再决定是否开发 TypeScript 插件和可视化工作台。
