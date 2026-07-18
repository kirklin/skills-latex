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

<!-- Add new templates below in the same shape: Produces / When to use / Build /
     Variants / Adapt it / Preview. Keep one H2 per template. -->
