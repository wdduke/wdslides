# wdslides

`wdslides` 是从现有中期汇报 slides 抽取出的 Beamer 模板。核心版式、颜色、代码块、引用环境、封面、目录页、章节页、封底页和常用数学/高亮命令集中在 `src/wdslides-core.cls`；每次做新 slides 时主要改 `wdslides-meta.tex` 和 `sections/*.tex`。

## 快速使用

中文版本：

```tex
\documentclass[chinese,blue,fontsize=large,aspectratio=169]{wdslides}
```

英文版本：

```tex
\documentclass[english,xauat,fontsize=normal,aspectratio=43]{wdslides}
```

常用 class 选项：

| 类型 | 选项 | 说明 |
| --- | --- | --- |
| 语言 | `chinese`、`english` | 切换封面标签、目录名、图表名和日期格式 |
| 主题色 | `blue`、`green`、`brown`、`xauat` | 切换主题色方案 |
| 字号方案 | `fontsize=compact`、`fontsize=normal`、`fontsize=large`、`fontsize=xlarge` | 对应 9pt、10pt、11pt、12pt，建议优先用选项而不是在正文里反复写 `\large` |
| 页面比例 | `aspectratio=169`、`aspectratio=43` | 切换 16:9 和 4:3；也可用别名 `wide`、`standard` |
| 章节页 | `autosection`、`noautosection` | 默认每个 `\section` 后自动生成章节过渡页 |

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

- `wdslides.cls`：模板入口文件，保留 `\documentclass{wdslides}` 的简洁用法。
- `src/wdslides-core.cls`：模板结构实现文件；根目录 `wdslides.cls` 只是入口，保留 `\documentclass{wdslides}` 的简洁用法。
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

副标题是可选信息；不填写 `\wdsubtitle` 时，封面会自动省略副标题行。

## 演讲类型预设草案

演讲类型预设尚未启用。下面是拟定需求表，用来确认研究生阶段常见场景是否覆盖充分，以及默认标签是否符合你的使用习惯。

| 拟定选项 | 场景 | 标题/副标题倾向 | 封面姓名标签 | 导师字段 | 学院字段 | 封底文案倾向 |
| --- | --- | --- | --- | --- | --- | --- |
| `talk=proposal` | 开题报告 | 副标题可默认为“开题报告”，也允许为空 | 汇报人 | 显示导师姓名与职称 | 默认显示 | 敬请各位老师批评指正 |
| `talk=midterm` | 中期检查/进展汇报 | 副标题可默认为“中期进展汇报”，也允许为空 | 汇报人 | 显示导师姓名与职称 | 默认显示 | 敬请各位老师批评指正 |
| `talk=defense` | 学位论文答辩 | 副标题通常为空或由用户填写“硕士学位论文答辩” | 答辩人 | 显示导师姓名与职称 | 默认显示 | 感谢各位老师批评指正 |
| `talk=group` | 组会/课题组汇报 | 副标题通常为空或由用户填写组会主题 | 汇报人 | 可显示，可留空 | 默认隐藏 | 感谢聆听 |

这个功能如果后续实现，应只设置默认标签和默认文案，不强制覆盖 `wdslides-meta.tex` 中用户已经手动填写的标题、副标题、导师、学院和封底内容。

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

1. 演讲类型预设：基于上方草案表确认后再实现。
2. 手稿/讲义模式：一键输出带备注、无动画、适合打印的 handout。
3. 封面布局预设：例如简洁版、校徽居中版、双语标题版。
4. 章节目录进度条：在页脚或页眉显示当前章节位置，默认关闭。
