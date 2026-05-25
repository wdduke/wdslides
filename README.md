# wdslides

`wdslides` 是从现有中期汇报 slides 抽取出的 Beamer 模板。核心版式、颜色、代码块、引用环境、封面、目录页、章节页、封底页和常用数学/高亮命令集中在 `wdslides.cls`；每次做新 slides 时主要改 `wdslides-meta.tex` 和 `sections/*.tex`。

## 快速使用

中文版本：

```tex
\documentclass[chinese,blue]{wdslides}
```

英文版本：

```tex
\documentclass[english,xauat]{wdslides}
```

可用主题色选项：`blue`、`green`、`brown`、`xauat`。默认自动在每个 `\section` 后生成章节过渡页；如需关闭，使用 `noautosection`。

推荐编译：

```bat
build.bat
```

也可以手动编译：

```powershell
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

## 文件结构

- `wdslides.cls`：模板类文件，集中原来 `init/color.tex`、`init/pkg.tex`、`init/format.tex`、`init/code.tex`、`init/cmds.tex` 的功能。
- `wdslides-meta.tex`：标题、作者、导师、学院、日期、logo、参考文献等元数据；学院默认留空，封面不显示单位信息。
- `main.tex`：slides 入口文件，只负责选择语言、加载元数据和组织章节。
- `sections/`：正文页。
- `examples/`：中文和英文完整 demo，展示图表、公式、代码和参考文献。
- `assets/`：logo 等模板资源；默认仓库不强制携带二进制 logo，缺省时会显示文字标识。
- `build.bat`：清理并完整编译 `main.tex`。
- `clean.bat`：删除 LaTeX 编译中间文件，保留源文件和生成的 PDF。

## 元数据接口

导师命令使用“姓名 + 职称”两个输入，避免手动插入空格或波浪线：

```tex
\wdsupervisor[zh]{李安桂}{教授}
\wdsupervisor[en]{Angui Li}{Professor}
```

中文两字姓名会在封面信息区自动排成 `王　铎` 的视觉效果，与三字姓名和标签宽度保持协调。

## 示例与检查

中文 demo：

```powershell
xelatex examples/demo-zh.tex
biber demo-zh
xelatex examples/demo-zh.tex
xelatex examples/demo-zh.tex
```

英文 demo：

```powershell
xelatex examples/demo-en.tex
biber demo-en
xelatex examples/demo-en.tex
xelatex examples/demo-en.tex
```

仓库已加入 GitHub Actions，会在 push 和 pull request 时编译 `main.tex`、`examples/demo-zh.tex`、`examples/demo-en.tex`。

## 已保留的接口

- 章节页：`\makesection`
- 标题色块：`\titlecolorbox{...}`
- 高亮：`\highlight{...}`、`\ulhighlight{...}`、`\stronghighlight{...}`、`\ulstronghighlight{...}`
- 数学简写：`\sn`、`\cn`、`\dn`、`\romanNum{...}`、`\pder{...}{...}`
- 引用环境：`myquote`
- 代码样式：`style=python`、`style=latex`

## 后续可选增强清单

以下功能尚未加入，等你确认后再做：

1. 演讲类型预设：开题、中期、答辩、组会，对封面字段和封底文案给不同默认值。
2. 手稿/讲义模式：一键输出带备注、无动画、适合打印的 handout。
3. 封面布局预设：例如简洁版、校徽居中版、双语标题版。
4. 章节目录进度条：在页脚或页眉显示当前章节位置。
