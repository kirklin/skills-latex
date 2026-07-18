# Adding a Template

kirklin-latex grows by adding templates, not by editing one giant document. A
template is a self-contained directory a user can copy and compile on its own.

## Required layout

```
templates/<name>/
  <main>.tex          # the document — title, authors, body
  README.md           # what it produces, its file map, what to replace
  <assets…>           # any .sty, .bib, figures, or \input section files it needs
```

## Quality rules

1. **Self-contained.** Bundle every dependency (style files, figures, `.bib`,
   section files). A user who copies only `templates/<name>/` must be able to
   compile it with nothing else.
2. **Compile-tested.** It must build cleanly through `scripts/compile.sh` and
   produce **zero** LaTeX errors (warnings tolerated, but check overfull boxes).
3. **Real sample content.** Fill it with realistic content so the output looks
   like a finished document — not `\lipsum` placeholders or empty sections.
4. **Placeholder identities.** Invented sample content must use transparently
   generic stand-ins, never anything that looks (or is) real: 「示例公司」/
   「示例企业」/ "Example Corp" for organizations, generic units like 「××部」/
   「人力资源部」/「架构组」 for authors, `example.com` for e-mail domains, and
   obviously fake phone numbers. No real people or companies, no personal data,
   and no made-up brand names that read as real. (Faithful recreations of
   published documents — see "Prefer authentic sources" below — keep their
   original real content.)
5. **Documented.** `README.md` gives the file map and names exactly what a user
   swaps to make it their own.
6. **Previewed.** Commit rendered PNGs (and the sample PDF) under
   `examples/<name>/` so the look is visible without compiling.

## Register it

1. Add a row to the `## Templates` table in [../SKILL.md](../SKILL.md).
2. Add a section to [templates.md](templates.md) with the standard shape:
   Produces / When to use / Build / Variants / Adapt it / Preview.

## Prefer authentic sources

When recreating a known document (a paper, a report format, a publisher's style),
build from its **real** source or official `.sty` for exact fidelity, rather than
hand-rolling an approximation. Keep a self-contained, dependency-free variant
(e.g. a standalone preamble, TikZ figures) as a *secondary* option.

## Checklist

- [ ] `templates/<name>/` compiles via `scripts/compile.sh --preview`
- [ ] Sample identities are generic placeholders (示例公司 / Example Corp,
      `example.com`, fake numbers) — no real or realistic-looking names
- [ ] `README.md` explains the structure and what to replace
- [ ] `examples/<name>/` has PNG previews (and a sample PDF)
- [ ] Registered in `SKILL.md` and `references/templates.md`
