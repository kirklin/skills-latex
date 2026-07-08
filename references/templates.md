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

<!-- Add new templates below in the same shape: Produces / When to use / Build /
     Variants / Adapt it / Preview. Keep one H2 per template. -->
