# wdslides

`wdslides` 是从现有中期汇报 slides 抽取出的 Beamer 模板。核心版式、颜色、代码块、引用环境、封面、目录页、章节页、封底页和常用数学/高亮命令集中在 `wdslides.cls`；每次做新 slides 时主要改 `wdslides-meta.tex` 和 `sections/*.tex`。

## 快速使用

中文版本：

```tex
\documentclass[chinese]{wdslides}
```

英文版本：

```tex
\documentclass[english]{wdslides}
```

推荐编译：

```powershell
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

如果没有引用文献，可以跳过 `bibtex main`。

## 文件结构

- `wdslides.cls`：模板类文件，集中原来 `init/color.tex`、`init/pkg.tex`、`init/format.tex`、`init/code.tex`、`init/cmds.tex` 的功能。
- `wdslides-meta.tex`：标题、作者、导师、单位、日期、logo、参考文献等元数据。
- `main.tex`：slides 入口文件，只负责选择语言、加载元数据和组织章节。
- `sections/`：正文页。
- `assets/`：logo 等模板资源；默认仓库不强制携带二进制 logo，缺省时会显示文字标识。

## 已保留的接口

- 章节页：`\makesection`
- 标题色块：`\titlecolorbox{...}`
- 高亮：`\highlight{...}`、`\ulhighlight{...}`、`\stronghighlight{...}`、`\ulstronghighlight{...}`
- 数学简写：`\sn`、`\cn`、`\dn`、`\romanNum{...}`、`\pder{...}{...}`
- 引用环境：`myquote`
- 代码样式：`style=python`、`style=latex`

## 可选增强清单

这些功能尚未加入，等你确认后再做：

1. 自动生成章节过渡页：每次 `\section` 后自动插入 `\makesection`。
2. 多套主题色方案：例如 `blue`、`green`、`brown`、`xauat` 一键切换。
3. 演讲类型预设：开题、中期、答辩、组会，对封面字段和封底文案给不同默认值。
4. 手稿/讲义模式：一键输出带备注、无动画、适合打印的 handout。
5. 构建脚本：增加 `build.ps1` 或 `latexmkrc`，统一清理和编译流程。
6. 示例库：保留一套中文/英文完整 demo，用来展示图表、公式、代码、参考文献和双语封面。
7. CI 编译检查：GitHub Actions 自动编译 `main.tex`，防止模板改坏。
