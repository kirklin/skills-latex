# skills-latex

Kirk Lin's LaTeX skill for AI agents — curated, compile-tested document templates
with a one-command PDF build. Describe a document; get a finished PDF. No LaTeX
wrangling required.

## Layout

| Path | What |
|---|---|
| [`SKILL.md`](SKILL.md) | Skill entry point (the agent reads this) |
| [`templates/`](templates/) | Self-contained document templates — start with `neurips-paper` |
| [`scripts/compile.sh`](scripts/compile.sh) | Build a `.tex` to PDF + PNG previews |
| [`references/`](references/) | Template catalog and the "add a template" guide |
| [`examples/`](examples/) | Rendered previews of each template |

## Build

```bash
bash scripts/compile.sh templates/neurips-paper/paper.tex --preview
```

Requires TeX Live (`pdflatex`/`xelatex`, `latexmk`) and `poppler-utils`
(`pdftoppm`) for previews.

## Templates

- **neurips-paper** — single-column NeurIPS/arXiv-style research paper. Two
  variants: pixel-faithful (real `nips_2017.sty`) and portable standalone.
- **cn-doc** — everyday Chinese document base（中式公文排版：黑体标题、
  「一、（一）1.」层级、首行缩进、落款）for 通知 / 报告 / 总结 / 请示 / 函 / 制度.
  The default for Chinese documents.
- **cn-gongwen** — 党政机关公文 per **GB/T 9704—2012**: 红色机关标志、发文字号、
  红线、版记、镜像页码, all hard spec dimensions pixel-verified; auto-detects
  方正小标宋/仿宋_GB2312 with graceful fallbacks.

Adding your own → [`references/adding-templates.md`](references/adding-templates.md).

## Install as an agent skill

`SKILL.md` uses the open Agent Skill format, so it isn't tied to any one AI agent.
Place (or symlink) this repository wherever your agent loads skills from, as a
folder named `kirklin-latex` (matching the `name:` in `SKILL.md`).
