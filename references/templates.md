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
- **Adapt it:** see `templates/cn-gongwen/README.md` — clause-by-clause
  compliance table, 密级/紧急程度/签发人 comment switches, seal-image hook,
  upward-document (上行文) variant, and documented deviations/boundaries
  (联合行文、信函/命令/纪要格式 not yet built in).
- **Preview:** rendered pages in `examples/cn-gongwen/`.

---

<!-- Add new templates below in the same shape: Produces / When to use / Build /
     Variants / Adapt it / Preview. Keep one H2 per template. -->
