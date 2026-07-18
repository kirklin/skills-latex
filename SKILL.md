---
name: kirklin-latex
description: >-
  Create polished, compile-tested LaTeX documents from curated kirklin templates
  and build them to PDF with per-page PNG previews. Use when the user wants to
  write, typeset, or compile a LaTeX document — especially an academic or research
  paper in NeurIPS/arXiv style (the neurips-paper template) — or says "make a LaTeX
  paper", "write a conference paper", "typeset this as a paper", "compile this
  .tex", or "turn this into a PDF paper". This is a template framework: pick a
  template under templates/, copy and customize it, then build with
  scripts/compile.sh (auto engine detection, latexmk, previews). New document types
  are added as templates.
---

# kirklin-latex

Curated LaTeX templates plus a one-command build. Each template is a complete,
compile-tested document you copy and fill in; `scripts/compile.sh` turns it into a
PDF with page previews. Paths below are relative to this skill's directory.

## When to use

- Writing a research / academic paper (NeurIPS / arXiv style) → `neurips-paper`.
- Writing an everyday Chinese document — 通知 / 报告 / 总结 / 请示 / 函 / 制度 —
  in the layout Chinese readers expect (黑体标题、「一、（一）1.」层级、首行缩进、
  落款) → `cn-doc`. **Default for Chinese documents.**
- Writing a formal Party/government official document — 公文 / 红头文件 per
  GB/T 9704—2012 (红色机关标志、发文字号、红线、版记、页码一字线) → `cn-gongwen`.
- Writing a one-page professional resume — 中文简历 (single-file layout macros,
  works for English too) → `resume`.
- Typesetting the official published text of Chinese statutes — 法律 / 法规 /
  规章 / 司法解释的正式发布文本 per GB/T 47229.1—2026 (编/章/节/条 statutory
  hierarchy, Chinese-numeral auto-numbering) → `cn-fagui`. Niche: for
  legislative/publishing scenarios only, NOT everyday legal writing
  (contracts, briefs — those are ordinary documents).
- Writing an A-share IPO prospectus — 招股说明书 / 招股书 / IPO 申报文件 per
  证监会信息披露准则第 57 号 (封面/声明及承诺/致投资者声明/发行概况/十二节正文/签字页/附件系列(承诺全文/权利清单等)
  full skeleton, 结构与措辞已对照准则原文及真实科创板申报稿逐项校验; 投行
  申报版式: 黑体节标题、全线框财务表、1-1-N 卷册页码, TikZ 股权结构图;
  治理结构按新《公司法》) → `cn-ipo`. Also the base for similar disclosure
  documents (债券募集说明书、重组报告书 adapt from it).
- Compiling any `.tex` to PDF and showing previews.
- More document types will arrive as templates — always check `references/templates.md`
  before assuming a type isn't covered.

## Workflow

1. **Pick a template.** Match the user's document type to a template using the
   catalog in [references/templates.md](references/templates.md).
2. **Copy it out.** Copy the whole template directory to the user's working area
   (default `./outputs/`). Templates are self-contained — styles, figures, and
   section files travel with them.
3. **Customize.** Edit the main `.tex` (title, authors, sections). Each template's
   own `README.md` documents its file map and exactly what to replace.
4. **Compile.**
   ```bash
   bash scripts/compile.sh <path>/paper.tex --preview
   ```
   Auto-detects the engine, runs `latexmk` (multi-pass, bibliography,
   cross-references), writes the PDF, and renders one PNG per page.
5. **Deliver.** Read the PNG previews to confirm the result, show them to the user,
   and hand over the PDF.

## Templates

| Template | Produces | Build file |
|---|---|---|
| `neurips-paper` | Single-column NeurIPS/arXiv-style research paper (sample: *Attention Is All You Need*) | `templates/neurips-paper/paper.tex` |
| `cn-doc` | Everyday Chinese document base — 中式公文排版 (通知/报告/总结/请示/函; sample: a complete training notice) | `templates/cn-doc/main.tex` |
| `cn-gongwen` | GB/T 9704—2012 党政机关公文 — 红头、版头/主体/版记全要素, spec-verified; variants for 联合行文/信函/命令/纪要 (see its README) | `templates/cn-gongwen/main.tex` |
| `resume` | One-page Chinese professional resume — classic Chinese professional layout (三列条目行/编号要点/黑体强调/证件照位), 宋黑搭配 all-black, 年.月 dates digit-aligned, single file (sample: Elon Musk's public career) | `templates/resume/main.tex` |
| `cn-fagui` | GB/T 47229.1—2026 法律法规电子文件 — 法规/司法解释正式文本 (标题/题注/目录/编·章·节·条 自动中文编号; sample: 民法典真实条文节选) | `templates/cn-fagui/main.tex` |
| `cn-ipo` | A股IPO招股说明书 per 证监会准则第57号 — 封面/声明/概况/十二节/签字页全要素, 对照准则原文与真实申报稿校验, 投行申报版式, 财务数据内部勾稽 (sample: 虚构AI大模型公司科创板申报稿, 66页) | `templates/cn-ipo/main.tex` |

Full details, variants, and "when to use each" → [references/templates.md](references/templates.md).

## Compiling

```bash
bash scripts/compile.sh FILE.tex [--engine pdflatex|xelatex|lualatex] \
     [--preview] [--preview-dir DIR] [--dpi N] [--clean]
```

Engine defaults to auto (xelatex when the source loads `fontspec`/`xeCJK`/
`polyglossia` or a `ctex` class/package, otherwise pdflatex). Run
`scripts/compile.sh --help` for the full list. Requires TeX Live (`latexmk`) and `poppler-utils` (`pdftoppm`) for previews.

## Adding a template

This skill is a framework — new document types are added as template directories,
not by editing a monolith. The contract (required layout, quality rules, how to
register) is in [references/adding-templates.md](references/adding-templates.md).

## Conventions

- Write generated documents into `./outputs/` for user visibility; never edit a
  template in place — copy it first.
- Always render and view PNG previews after compiling, then show the user.
- Escape LaTeX specials in user-supplied text: `%` `$` `&` `#` `_` become
  `\%` `\$` `\&` `\#` `\_`; use math mode for `<` and `>` (e.g. `$<$5\%`).
