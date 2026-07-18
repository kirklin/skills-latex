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

每个模板的详细说明、变体和改法见其目录下的 `README.md`，选型对照见
[`references/templates.md`](references/templates.md)。

### Academic & research

- **[neurips-paper](templates/neurips-paper/)** — 英文学术论文（NeurIPS /
  arXiv 风格，单栏）。写论文、预印本、课程报告用。样例完整复刻了
  《Attention Is All You Need》，有官方样式和免依赖两个版本。

### Everyday & personal（通用文档 / 简历）

- **[cn-doc](templates/cn-doc/)** — 中文日常文件的默认模板。写通知、报告、
  总结、请示、函、制度就用它，排版是中国读者最熟悉的公文式：黑体标题、
  「一、（一）1.」层级、正文首行缩进、右下落款。
- **[resume](templates/resume/)** — 中文一页式求职简历。经典版式：右上角
  证件照位、公司／职位／时间一行三列、编号要点、全黑无彩。样例用马斯克的
  公开履历填充，换成自己的经历即可。

### Government & statutory（公文 / 法规）

- **[cn-gongwen](templates/cn-gongwen/)** — 党政机关正式公文（红头文件），
  严格按国标 GB/T 9704—2012 排版，红头、发文字号、红线、版记一应俱全。
  需要发正式红头文件时用；附联合行文、信函、命令、纪要四个变体。
- **[cn-fagui](templates/cn-fagui/)** — 法律法规的正式发布文本（条文式），
  按 GB/T 47229.1—2026 排版，编／章／节／条自动编号。做法规汇编、司法解释
  发布文本用；写普通法律文书不用它。样例节选自《民法典》。

### Legal & capital markets（法律 / 资本市场）

三个模板共用同一个虚构公司与案件世界，数据互相勾稽，可成套使用。

- **[cn-ipo](templates/cn-ipo/)** — A股 IPO 招股说明书全套（申报稿）。按
  证监会信息披露准则第 57 号搭骨架，并对照真实科创板申报稿逐项校验。
  封面、声明、十二节正文、签字页齐全，示例财务数据内部自洽（67 页）。
- **[cn-legal-opinion](templates/cn-legal-opinion/)** — 律师事务所的三种
  执业文书：法律意见书（信头式封面）、补充法律意见书（信函式，问询逐条
  作答）、律师函（催告函）。版式取自头部律所公开披露文书的逐页实测，
  常见差异（之／的、经办／承办、页码制式）都做成了开关。
- **[cn-litigation](templates/cn-litigation/)** — 打官司和仲裁用的文书，
  覆盖民事、劳动、刑事：民事起诉状与答辩状（按最高法 2025 年要素式示范
  文本，表格勾选式）、劳动仲裁申请书（官方表格式）、刑事辩护词（通行
  体例）。

### Previews

Click any page to open the sample PDF.

#### Academic & research

<table>
  <tr>
    <td align="center"><a href="examples/neurips-paper/paper.pdf"><img src="examples/neurips-paper/paper-page-01.png" width="260" alt="neurips-paper preview"></a><br><sub><b>neurips-paper</b></sub></td>
    <td></td>
    <td></td>
  </tr>
</table>

#### Everyday & personal

<table>
  <tr>
    <td align="center"><a href="examples/cn-doc/main.pdf"><img src="examples/cn-doc/main-page-1.png" width="260" alt="cn-doc preview"></a><br><sub><b>cn-doc</b></sub></td>
    <td align="center"><a href="examples/resume/main.pdf"><img src="examples/resume/main-page-1.png" width="260" alt="resume preview"></a><br><sub><b>resume</b></sub></td>
    <td></td>
  </tr>
</table>

#### Government & statutory

<table>
  <tr>
    <td align="center"><a href="examples/cn-gongwen/main.pdf"><img src="examples/cn-gongwen/main-page-1.png" width="260" alt="cn-gongwen preview"></a><br><sub><b>cn-gongwen</b></sub></td>
    <td align="center"><a href="examples/cn-gongwen/xinhan.pdf"><img src="examples/cn-gongwen/xinhan-page-1.png" width="260" alt="cn-gongwen xinhan preview"></a><br><sub><b>cn-gongwen · 信函</b></sub></td>
    <td align="center"><a href="examples/cn-fagui/main.pdf"><img src="examples/cn-fagui/main-page-1.png" width="260" alt="cn-fagui preview"></a><br><sub><b>cn-fagui</b></sub></td>
  </tr>
</table>

#### Legal & capital markets

<table>
  <tr>
    <td align="center"><a href="examples/cn-ipo/main.pdf"><img src="examples/cn-ipo/main-page-01.png" width="260" alt="cn-ipo preview"></a><br><sub><b>cn-ipo</b></sub></td>
    <td align="center"><a href="examples/cn-legal-opinion/main.pdf"><img src="examples/cn-legal-opinion/main-page-01.png" width="260" alt="cn-legal-opinion preview"></a><br><sub><b>cn-legal-opinion</b></sub></td>
    <td align="center"><a href="examples/cn-legal-opinion/supplemental.pdf"><img src="examples/cn-legal-opinion/supplemental-page-1.png" width="260" alt="cn-legal-opinion supplemental preview"></a><br><sub><b>cn-legal-opinion · 补充意见书</b></sub></td>
  </tr>
  <tr>
    <td align="center"><a href="examples/cn-legal-opinion/demand-letter.pdf"><img src="examples/cn-legal-opinion/demand-letter-page-1.png" width="260" alt="cn-legal-opinion demand-letter preview"></a><br><sub><b>cn-legal-opinion · 律师函</b></sub></td>
    <td align="center"><a href="examples/cn-litigation/complaint.pdf"><img src="examples/cn-litigation/complaint-page-1.png" width="260" alt="cn-litigation complaint preview"></a><br><sub><b>cn-litigation · 起诉状</b></sub></td>
    <td align="center"><a href="examples/cn-litigation/defense-statement.pdf"><img src="examples/cn-litigation/defense-statement-page-1.png" width="260" alt="cn-litigation defense-statement preview"></a><br><sub><b>cn-litigation · 辩护词</b></sub></td>
  </tr>
</table>

Adding your own → [`references/adding-templates.md`](references/adding-templates.md).

## Install as an agent skill

`SKILL.md` uses the open Agent Skill format, so it isn't tied to any one AI agent.
Place (or symlink) this repository wherever your agent loads skills from, as a
folder named `kirklin-latex` (matching the `name:` in `SKILL.md`).
