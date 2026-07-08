# neurips-paper — kirklin LaTeX 模板

一套单栏、NeurIPS 风格的学术论文模板，以 **《Attention Is All You Need》**（Vaswani et al., NeurIPS 2017）为样张，逐像素还原一篇顶会论文该有的所有元素：带上下横线的标题、多作者等贡献脚注、Transformer 架构图、注意力机制图、缩放点积/多头注意力公式、三张 booktabs 表格、数字编号参考文献、以及附录里的注意力权重可视化。

## 两种构建方式

| 文件 | 说明 | 依赖 |
|---|---|---|
| **`paper.tex`**（主，推荐） | 用论文原版 `nips_2017.sty` 排版，样式与已发表版本完全一致 | `nips_2017.sty` + 章节文件 + `Figures/` + `vis/` |
| `paper-standalone.tex`（备选） | 自造导言区、不依赖任何出版方 `.sty`，可选用 `figures-tikz-alt.tex` 里手绘的 TikZ 架构图（无需外部图片） | 仅标准 TeX Live 宏包 + `references.bib` |

```bash
# 主模板（自动多轮编译）
latexmk -pdf paper.tex

# 备选：自成一体版
latexmk -pdf paper-standalone.tex
```

产物为 15 页 PDF。用 `pdftoppm -png -r 150 paper.pdf page` 生成逐页 PNG 预览。

## 文件结构

```
paper.tex               主文件（\input 各章节 + 内联参考文献）
nips_2017.sty           NeurIPS 2017 官方样式（样式的核心）
introduction.tex …      章节内容：introduction / background / model_architecture /
                        why_self_attention / training / results / visualizations
parameter_attention.tex 可选附录（默认未启用，见 paper.tex 末尾注释）
sqrt_d_trick.tex        可选附录（默认未启用）
Figures/ModalNet-*.png  Figure 1 架构图、Figure 2 注意力图
vis/*.pdf               附录：注意力权重可视化
paper-standalone.tex    自成一体的备选模板
figures-tikz-alt.tex    手绘 TikZ 版 Figure 1/2（供 standalone 使用）
references.bib          BibTeX 库（供 standalone 使用）
```

## 改成你自己的论文

1. 改 `paper.tex` 里的 `\title` 和 `\author`（作者块用 `\And` 分隔、`\thanks` 加脚注）。
2. 逐个替换章节 `.tex` 的正文；不需要的章节删掉对应 `\input`。
3. 换掉 `Figures/` 与 `vis/` 里的图；正文用 `\includegraphics` 引用。
4. 内联的 `\begin{thebibliography}` 换成你的条目，或改用 `\bibliography{references}` + BibTeX。

## 出处与署名

本模板的正文、图表与参考文献取自《Attention Is All You Need》（arXiv:1706.03762），仅作**排版样张**。原论文附带声明：在注明出处的前提下，Google 允许为新闻或学术用途复制其中的表格与图。`nips_2017.sty` 为 NeurIPS 官方样式文件。把它当作模板使用时，请替换为你自己的内容。
