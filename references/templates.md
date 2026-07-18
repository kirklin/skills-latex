# Template Catalog

The registry of available kirklin-latex templates. Match the user's request to a
template here, then follow the main workflow in [../SKILL.md](../SKILL.md).

---

## neurips-paper

- **Produces:** a single-column, NeurIPS/arXiv-style research paper — title with
  rules, multi-author block with equal-contribution footnotes, figures, display
  equations, `booktabs` tables, numbered citations, and an appendix of figures.
- **When to use:** academic / research papers, ML or CS conference submissions,
  preprints, or anything that should look like a published NeurIPS / arXiv paper.
- **Sample content:** faithfully recreates *Attention Is All You Need*
  (Vaswani et al., 2017), so the compiled output looks finished, not skeletal.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/neurips-paper/paper.tex --preview \
       --preview-dir examples/neurips-paper
  ```
- **Variants:**
  | File | Use | Notes |
  |---|---|---|
  | `paper.tex` (default) | Pixel-faithful to the published paper | Uses the real `nips_2017.sty`; content lives in `\input` section files |
  | `paper-standalone.tex` | Portable, no publisher `.sty` | Self-contained preamble; can use hand-drawn TikZ figures from `figures-tikz-alt.tex` (no external images needed) |
- **Adapt it:** see `templates/neurips-paper/README.md` for the file map and exactly
  what to replace (title, `\author`, section `.tex` files, figures, bibliography).
- **Preview:** rendered pages in `examples/neurips-paper/`.

---

## cn-doc

- **Produces:** an everyday Chinese document in the layout Chinese readers expect
  (中式公文/办公排版) — 黑体二号居中大标题 with optional 文号 line, heading levels
  「一、」(黑体)/「（一）」(楷体)/「1.」(宋体加粗) all indented 2 chars like body
  text, 宋体小四 body with 2-char first-line indent and 1.5 line spacing, full-grid
  tables with 「表 1　××」captions, 附件 list, right-aligned 落款 (署名单位 + 成文
  日期), and 「— 1 —」centered page numbers.
- **When to use:** the **default for Chinese documents** — 通知、报告、总结、请示、
  函、制度、方案说明 and other day-to-day 文件. Its README maps each scenario to
  the exact blocks to keep, swap, or delete. Not for academic papers (use
  `neurips-paper`).
- **Sample content:** a complete, fictional 培训通知 — instantly recognizable as a
  real Chinese office document, exercising every element above.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/cn-doc/main.tex --preview \
       --preview-dir examples/cn-doc
  ```
  (`compile.sh` auto-detects ctex and switches to xelatex; fonts auto-selected
  per OS by ctex.)
- **Adapt it:** see `templates/cn-doc/README.md` — per-scenario adaptation table
  (通知/报告/请示/制度/纪要), plus font-set, size, spacing, and page-number knobs.
- **Preview:** rendered pages in `examples/cn-doc/`.

---

## cn-gongwen

- **Produces:** a formal Party/government official document (公文) per
  **GB/T 9704—2012《党政机关公文格式》** — 份号, red 发文机关标志 (top edge at
  版心+35mm, measured 72.14mm vs 72.0 target), 发文字号 with 六角括号, red
  separator rule 4mm below it, 2号 title, 主送机关, 3号仿宋 body on a 22-line
  grid, 层次序数 一、黑体/（一）楷体/1.（1）仿宋, 附件说明, seal-style 署名+成文
  日期, 附注, separately-paged attachments, and a 版记 (0.35/0.25mm rules, 抄送,
  印发机关和日期) whose last rule sits on the 版心 bottom edge; mirrored
  「— n —」page numbers 7mm below the text block (twoside).
- **When to use:** 党政机关公文 / 红头文件 — 通知、意见、请示、报告、函 etc. that
  must follow the national standard exactly. For everyday non-government
  documents use `cn-doc` instead. Every layout block in `main.tex` cites its
  clause number; hard dimensions are pixel-verified against a 150dpi render
  (table in the template README).
- **Sample content:** a complete fictional municipal notice —
  示例市人民政府关于加强政务数据共享管理工作的通知, 示政发〔2026〕8号 — with two
  attachment pages (one with a ruled table) and a full 版记.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/cn-gongwen/main.tex --preview \
       --preview-dir examples/cn-gongwen
  ```
  Compiles out of the box: 方正小标宋/仿宋_GB2312/楷体_GB2312 are auto-detected
  and used when installed, with per-OS fallbacks otherwise.
- **Variants** (share `base.tex`; build any of them the same way):
  | File | Use | Covers |
  |---|---|---|
  | `main.tex` (default) | 下行文「文件」式 with attachments | 式样图1/2/6/9/10, clauses 7.2–7.5 |
  | `lianhe.tex` | 联合行文 (joint issuance) | 图3 联署标志, 图7/8 联合署名; 图4 上行文多签发人 as comment |
  | `xinhan.tex` | 信函格式 (letter) | 10.1, 图11 — 170mm double rules, no page number on p1, rule-less 版记 |
  | `mingling.tex` | 命令（令）格式 (decree) | 10.2, 图12 — 20mm logo drop, 令号, 职务+签名章位 |
  | `jiyao.tex` | 纪要格式 (minutes) | 10.3 — 出席/请假/列席 hang-aligned name lists |
  All seals/signature stamps are user-supplied transparent PNGs (commented
  `\includegraphics` hooks); no sample seal is rendered.
- **Adapt it:** see `templates/cn-gongwen/README.md` — clause-by-clause
  compliance table, 密级/紧急程度/签发人 comment switches, seal hooks, and
  documented deviations/boundaries.
- **Preview:** rendered pages in `examples/cn-gongwen/` (per-variant PDFs and
  PNGs).

---

## resume

- **Produces:** a one-page professional Chinese resume in the layout Chinese
  tech recruiters see every day — centered name header (姓名 / letterspaced
  English name / one contact line with vertical-bar separators), bold section
  heads over hairlines, and the signature **three-column entry row** (company
  left, role centered, 年.月 dates right, all bold black), 「1、2、」numbered
  achievement points with key metrics inline-bolded, compact one-line venture
  rows, three-column education rows, and a framed 2.5×3.5cm ID-photo slot in the top-right corner. Song/Hei pairing (宋体 body, 黑体 for heads/companies/emphasis via \hl — the professional Chinese convention where "bold" is a Song→Hei font switch). All black — no gray, no color, no icons.
  The LaTeX craft lives in the details: OpenType monospaced figures align the
  date column digit-for-digit, microtype optical margins, xeCJK CJK-Latin
  spacing and punctuation compression, letterspaced English name,
  no-hyphenation + \emergencystretch. CJK sans (PingFang/雅黑/Fandol via ctex
  fontsets) paired with Source Sans Pro.
- **When to use:** 简历 / resume requests. Chinese-first; the layout macros and
  fonts work unchanged for an English resume (just replace the text).
- **Sample content:** Elon Musk's publicly documented career (SpaceX, Tesla,
  xAI, X, Neuralink, Boring Co., OpenAI, PayPal, Zip2) — a public-figure
  showcase per rule 4(b) in adding-templates.md; contact details are
  placeholders and a footer note marks it as a template sample.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/resume/main.tex --preview \
       --preview-dir examples/resume
  ```
- **Adapt it:** see `templates/resume/README.md` — three layout macros
  (`\rsection`/`\entry`/`\entryline`), photo note, density knobs; delete
  the footer sample note before real use.
- **Preview:** rendered page in `examples/resume/`.

---

## cn-fagui

- **Produces:** a statute-style Chinese legal document per
  **GB/T 47229.1—2026《法律法规电子文件 第 1 部分：页面格式》** (general page
  format, clause 5.2) — 2号小标宋 title starting two blank lines into the
  first page (measured 57.4mm), 楷体 annotation block (题注) with its
  double-indent geometry, optional 发文字号, a 楷体 table of contents
  (编/章 indent 2 chars, 节 indent 4), and the statutory hierarchy
  编/分编/章/节/条/款/项/目 — 编·分编·章 in 黑体 centered, 节 in 宋体
  centered, 条 numbers auto-generated as Chinese numerals (第四百二十五条)
  in 黑体 with 仿宋 clause text, unnumbered 款 paragraphs, （一） items and
  1. sub-items. Page base (156×225mm text block, 3号仿宋 22-line grid,
  em-dash page numbers 7mm below, mirrored twoside) shared with GB/T 9704.
- **When to use:** the **official published text** of 法律、法规、规章、司法
  解释 and statute-style 制度汇编 — a specialist publishing format for
  legislative bodies and legal-affairs offices. NOT for everyday legal
  writing (contracts, pleadings, opinions); for 行政规范性文件 (clause 5.3)
  use `cn-gongwen`'s body conventions.
- **Sample content:** genuine excerpts from《中华人民共和国民法典》(总则编
  第一至三条; 物权编 第四百二十五至四百二十七条 with 分编/章/节/款/项) —
  statutory texts are exempt from copyright per 著作权法 Art. 5, and the
  standard's own annex examples use the same provisions.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/cn-fagui/main.tex --preview \
       --preview-dir examples/cn-fagui
  ```
  Font auto-detection and fallbacks identical to `cn-gongwen`.
- **Adapt it:** see `templates/cn-fagui/README.md` — clause-by-clause table,
  structure macros (`\fabianX`/`\fazhangX`/`\fajieX`/`\fatiaoX`, counters
  reset per the standard, `\setcounter` for excerpts), 题注/目录 blocks, and
  documented boundaries (clause 5.3 and annex-A materials not built in).
- **Preview:** rendered pages in `examples/cn-fagui/`.

---

## cn-ipo

- **Produces:** a complete A-share IPO prospectus（招股说明书·申报稿）in the
  layout of top-tier investment-bank filings, structured clause-by-clause on
  中国证监会《公开发行证券的公司信息披露内容与格式准则第 57 号——招股说明书》
  (2023 全面注册制) and cross-checked against the rule's official text plus
  real STAR-Market filings (2023 and 2026): cover with 预披露提示/科创板风险
  提示, 声明及承诺 (第十六条两段法定声明), 致投资者声明 (2025—2026 新增件:
  上市目的/现代企业制度/融资必要性/持续经营, 实控人签署), 本次发行概况
  (第十七条九项, 申报稿「【　】」留空), auto TOC, then the twelve mandated sections — 释义,
  概览 (第二十二条参考格式: 重大事项提示居首、中介机构三表、发行概况详表、
  重要日期表), 风险因素 (第二十三条三分类: 发行人/行业/其他), 发行人基本情况
  (发行前后股本结构, TikZ 股权结构图, 新《公司法》治理: 不设监事会、审计委员
  会履职、职工代表董事), 业务与技术, 财务会计信息与管理层分析, 募集资金运用,
  公司治理与独立性, 投资者保护, 其他重要事项, 声明 (第八十五至九十条措辞,
  签字栏含项目协办人、审计委员会成员三分栏), 附件 + 2025 精简改革后的附件系列
  附件一–六 (投资者保护承诺全文、专利/软著/业务许可备案清单样表、申报前
  十二个月新增股东; 未选录附件以注释说明理由). 版式: 宋体小四 1.5 倍行距,
  Times New Roman 数字, 黑体节标题居中自动中文编号, 页眉「公司名｜招股说明书
  （申报稿）」, 页脚 1-1-N 卷册页码, 全线框垂直居中表格 + 「单位：万元」右上
  标注 + longtable 跨页续表头.
- **When to use:** IPO 招股说明书 / 招股书 / 招股意向书, and as the closest
  base for other CSRC-style disclosure documents (债券募集说明书、非公开发行
  预案、重组报告书). Board switches (科创板→主板/创业板), 申报稿→注册稿,
  plain page numbers, and legacy-监事会 governance are documented knobs.
- **Sample content:** a fictional 示例科技股份有限公司 — an AI large-model
  company (大模型解决方案 / 开放平台 MaaS / 智能应用) applying to the SSE
  STAR Market (66 pages, 报告期 2023–2025). All parties are transparent
  placeholders (示例××公司 / 林××); financials are invented but
  **internally consistent** — balance sheet ties, equity rolls forward by
  net profit, every ratio (流动/速动比率、周转率、加权 ROE、EPS per 编报规则
  第 9 号) recomputes from the statements, and client/product percentage
  tables cross-foot to revenue.
- **Build:**
  ```bash
  bash scripts/compile.sh templates/cn-ipo/main.tex --preview \
       --preview-dir examples/cn-ipo
  ```
  Chinese fonts via ctex per-OS defaults (SimSun/SimHei on Windows matches
  real filings); Times New Roman auto-detected for Latin/digits.
- **Adapt it:** see `templates/cn-ipo/README.md` — metadata `\renewcommand`
  block in `main.tex`, one file per section under `sections/`, table macros
  (`\thA`/`\thBw`/`\biaodw`/`\tabnote`), signature macros (`\sigblock`/
  `\sigzrow`/`\sigseal` with seal-image hooks), the data-consistency contract to keep
  when replacing numbers, and the verification log of what was checked
  against the official rule text and real filings.
- **Preview:** rendered pages in `examples/cn-ipo/`.

<!-- Add new templates below in the same shape: Produces / When to use / Build /
     Variants / Adapt it / Preview. Keep one H2 per template. -->
