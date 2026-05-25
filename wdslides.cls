\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wdslides}[2026/05/25 WD Beamer slide template]

\newif\ifwdslides@english
\wdslides@englishfalse

\PassOptionsToClass{aspectratio=169}{ctexbeamer}
\PassOptionsToClass{10pt}{ctexbeamer}
\DeclareOption{chinese}{\wdslides@englishfalse}
\DeclareOption{zh}{\wdslides@englishfalse}
\DeclareOption{english}{\wdslides@englishtrue}
\DeclareOption{en}{\wdslides@englishtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbeamer}}
\ProcessOptions\relax
\LoadClass{ctexbeamer}

\RequirePackage{xparse}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}
\RequirePackage{stackengine}
\RequirePackage{pifont}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{tcolorbox}
\RequirePackage[backend=bibtex,style=numeric]{biblatex}
\RequirePackage{bm}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{ulem}
\RequirePackage{caption}
\RequirePackage{verbatim}
\RequirePackage{etoolbox}

\definecolor{themegreen}{RGB}{48,95,33}
\definecolor{themered}{RGB}{95,33,48}
\definecolor{xauatbrown}{RGB}{137,105,65}
\definecolor{xauatgray}{RGB}{225,213,197}
\definecolor{xauatyellow}{RGB}{248,230,194}
\definecolor{1Blue}{HTML}{5B6870}
\definecolor{2Blue}{HTML}{7CA6C0}
\definecolor{3Blue}{HTML}{A3D6D7}
\definecolor{4Blue}{RGB}{0,0,139}
\definecolor{Gold}{RGB}{255,165,0}

\colorlet{darkgray}{black!70}
\colorlet{stronghighlightcolor}{themered!150!black}
\colorlet{themecolor}{4Blue}

\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}[page number]
\setbeamertemplate{section in toc}[sections numbered]
\setbeamertemplate{caption}[numbered]

\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}{$\circ$}
\setbeamertemplate{itemize subsubitem}[circle]
\setbeamertemplate{enumerate subitem}{\alph{enumii}.}
\setbeamertemplate{enumerate subsubitem}{\roman{enumiii}.}

\setbeamercolor{frametitle}{bg=,fg=themecolor}
\setbeamercolor{block title}{bg=themecolor!8,fg=themecolor}
\setbeamercolor{description item}{fg=themecolor}
\setbeamercolor{section in toc}{fg=themecolor,bg=}
\setbeamercolor{subsection in toc}{fg=black!80}
\setbeamercolor{caption name}{fg=themecolor}
\setbeamercolor{bibliography entry author}{fg=black}
\setbeamercolor{bibliography entry title}{fg=black}
\setbeamercolor{bibliography entry journal}{fg=black}
\setbeamercolor{bibliography entry note}{fg=black}
\setbeamercolor{bibliography item}{fg=themecolor}
\setbeamercolor{itemize item}{fg=themecolor}
\setbeamercolor{itemize subitem}{fg=themecolor}
\setbeamercolor{itemize subsubitem}{fg=themecolor}
\setbeamercolor{enumerate item}{fg=themecolor}
\setbeamercolor{enumerate subitem}{fg=themecolor}
\setbeamercolor{enumerate subsubitem}{fg=themecolor}

\setbeamerfont{frametitle}{size=\large,family=\kaishu}
\setbeamerfont{framesubtitle}{size=\normalsize,family=\kaishu}
\setbeamerfont{block title}{size=\large,family=\kaishu}
\setbeamerfont{section in toc}{size=\large,family=\kaishu}
\setbeamerfont{subsection in toc}{size=\normalsize}
\setbeamerfont{caption name}{family=\kaishu,size=\normalsize}
\setbeamerfont{caption}{family=\kaishu,size=\normalsize}
\setbeamerfont{footnote}{family=\kaishu,size=\tiny}
\setbeamerfont{description item}{size=\normalsize,family=\kaishu}

\setbeamertemplate{footline}{%
  \begin{beamercolorbox}[wd=\paperwidth,ht=2.25ex,dp=1ex,leftskip=0.5cm,rightskip=0.5cm]{title in head/foot}%
    \hfill{\textcolor{black!70}{\insertframenumber/\inserttotalframenumber}}\hspace*{1mm}\vspace*{2mm}
  \end{beamercolorbox}%
}

\newcommand{\wdslides@logo}{assets/logo.pdf}
\newcommand{\wdslides@longlogo}{assets/logo_long.pdf}
\newcommand{\wdslides@brandmark}{WD}
\newcommand{\wdslides@longbrand}{WD Slides}

\defbeamertemplate*{frametitle}{}[1][]{%
  \nointerlineskip%
  \vspace*{3mm}
  \hspace*{-1mm}
  \begin{beamercolorbox}[sep=0.3cm,wd=\paperwidth,leftskip=0.5cm,rightskip=0.5cm]{frametitle}
    {\usebeamerfont{frametitle}\insertframetitle}
    {\usebeamerfont{framesubtitle}\color{black!80}\insertframesubtitle
    \hfill
    \IfFileExists{\wdslides@logo}{%
      \raisebox{-1mm}{\includegraphics[width=5mm]{\wdslides@logo}}%
    }{%
      \raisebox{-0.5mm}{\textcolor{themecolor}{\scriptsize\bfseries \wdslides@brandmark}}%
    }%
    }\par
    \vskip-1.5ex
    \begin{tikzpicture}[remember picture,overlay]
      \draw[line width=0.2pt] (0,0) -- (\textwidth+4mm,0);
    \end{tikzpicture}
  \end{beamercolorbox}
  \vspace*{-7mm}
}

\setlength{\parskip}{0.5em}
\numberwithin{equation}{section}
\usefonttheme[onlymath]{serif}
\AtBeginEnvironment{table}{\setlength{\parskip}{0em}}
\captionsetup{skip=4pt}
\normalem

\newmdenv[
  hidealllines=true,
  leftline=true,
  linewidth=1pt,
  linecolor=darkgray,
  fontcolor=darkgray,
  innertopmargin=1pt,
  innerbottommargin=1pt,
  font=\kaishu\normalsize,
]{myquote}

\lstset{basicstyle=\ttfamily\color{stronghighlightcolor}}
\lstdefinestyle{python}{
  language=Python,
  basicstyle=\normalsize\ttfamily,
  keywordstyle=\color{themecolor},
  stringstyle=\color{themered!150!black},
  commentstyle=\color{black!50},
  showstringspaces=false,
  backgroundcolor=\color{white},
  frame=single,
  framerule=0.25pt,
  framesep=3pt,
  rulecolor=\color{themecolor},
  numbers=left,
  numberstyle=\tiny\color{darkgray},
  numbersep=5pt,
  breaklines=true,
  escapeinside={(*@}{@*)}
}
\lstdefinestyle{latex}{
  language=[LaTeX]TeX,
  basicstyle=\normalsize\ttfamily,
  keywordstyle=\color{themecolor},
  stringstyle=\color{themered!150!black},
  commentstyle=\color{black!50},
  showstringspaces=false,
  backgroundcolor=\color{white},
  frame=single,
  framerule=0.25pt,
  framesep=3pt,
  rulecolor=\color{themecolor},
  numbers=left,
  numberstyle=\tiny\color{darkgray},
  numbersep=5pt,
  breaklines=true,
  escapeinside={(*@}{@*)}
}

\newcommand{\wdslides@setlocalized}[3]{%
  \def\wdslides@lang{#2}%
  \ifx\wdslides@lang\@empty
    \@namedef{wdslides@#1@zh}{#3}%
    \@namedef{wdslides@#1@en}{#3}%
  \else
    \@namedef{wdslides@#1@#2}{#3}%
  \fi
}
\newcommand{\wdslides@localized}[1]{%
  \ifwdslides@english
    \@nameuse{wdslides@#1@en}%
  \else
    \@nameuse{wdslides@#1@zh}%
  \fi
}
\newcommand{\wdslides@iflocalizedempty}[3]{%
  \ifwdslides@english
    \expandafter\ifx\csname wdslides@#1@en\endcsname\@empty #2\else #3\fi
  \else
    \expandafter\ifx\csname wdslides@#1@zh\endcsname\@empty #2\else #3\fi
  \fi
}

\newcommand{\wdslides@englishdate}{%
  \number\day\space
  \ifcase\month\or January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\year
}

\wdslides@setlocalized{title}{zh}{演示文稿标题}
\wdslides@setlocalized{title}{en}{Presentation Title}
\wdslides@setlocalized{subtitle}{zh}{}
\wdslides@setlocalized{subtitle}{en}{}
\wdslides@setlocalized{coverextra}{zh}{}
\wdslides@setlocalized{coverextra}{en}{}
\wdslides@setlocalized{author}{zh}{姓名}
\wdslides@setlocalized{author}{en}{Name}
\wdslides@setlocalized{supervisor}{zh}{}
\wdslides@setlocalized{supervisor}{en}{}
\wdslides@setlocalized{institute}{zh}{}
\wdslides@setlocalized{institute}{en}{}
\wdslides@setlocalized{date}{zh}{\today}
\wdslides@setlocalized{date}{en}{\today}
\wdslides@setlocalized{presenterlabel}{zh}{答辩人：}
\wdslides@setlocalized{presenterlabel}{en}{Presenter}
\wdslides@setlocalized{supervisorlabel}{zh}{导师：}
\wdslides@setlocalized{supervisorlabel}{en}{Supervisor}
\wdslides@setlocalized{institutelabel}{zh}{单位：}
\wdslides@setlocalized{institutelabel}{en}{Institute}
\wdslides@setlocalized{tocname}{zh}{目录}
\wdslides@setlocalized{tocname}{en}{Content}
\wdslides@setlocalized{thanks}{zh}{感谢聆听！}
\wdslides@setlocalized{thanks}{en}{Thanks for your attention}
\wdslides@setlocalized{figurelabel}{zh}{图}
\wdslides@setlocalized{figurelabel}{en}{Fig}
\wdslides@setlocalized{tablelabel}{zh}{表}
\wdslides@setlocalized{tablelabel}{en}{Table}

\NewDocumentCommand{\wdtitle}{O{} m}{\wdslides@setlocalized{title}{#1}{#2}}
\NewDocumentCommand{\wdsubtitle}{O{} m}{\wdslides@setlocalized{subtitle}{#1}{#2}}
\NewDocumentCommand{\wdcoverextra}{O{} m}{\wdslides@setlocalized{coverextra}{#1}{#2}}
\NewDocumentCommand{\wdauthor}{O{} m}{\wdslides@setlocalized{author}{#1}{#2}}
\NewDocumentCommand{\wdsupervisor}{O{} m}{\wdslides@setlocalized{supervisor}{#1}{#2}}
\NewDocumentCommand{\wdinstitute}{O{} m}{\wdslides@setlocalized{institute}{#1}{#2}}
\NewDocumentCommand{\wddate}{O{} m}{\wdslides@setlocalized{date}{#1}{#2}}
\NewDocumentCommand{\wdpresenterlabel}{O{} m}{\wdslides@setlocalized{presenterlabel}{#1}{#2}}
\NewDocumentCommand{\wdsupervisorlabel}{O{} m}{\wdslides@setlocalized{supervisorlabel}{#1}{#2}}
\NewDocumentCommand{\wdinstitutelabel}{O{} m}{\wdslides@setlocalized{institutelabel}{#1}{#2}}
\NewDocumentCommand{\wdtocname}{O{} m}{\wdslides@setlocalized{tocname}{#1}{#2}}
\NewDocumentCommand{\wdthanks}{O{} m}{\wdslides@setlocalized{thanks}{#1}{#2}}
\NewDocumentCommand{\wdfigurelabel}{O{} m}{\wdslides@setlocalized{figurelabel}{#1}{#2}}
\NewDocumentCommand{\wdtablelabel}{O{} m}{\wdslides@setlocalized{tablelabel}{#1}{#2}}
\NewDocumentCommand{\wdlogofile}{m}{\renewcommand{\wdslides@logo}{#1}}
\NewDocumentCommand{\wdlonglogofile}{m}{\renewcommand{\wdslides@longlogo}{#1}}
\NewDocumentCommand{\wdbrandmark}{m}{\renewcommand{\wdslides@brandmark}{#1}}
\NewDocumentCommand{\wdlongbrand}{m}{\renewcommand{\wdslides@longbrand}{#1}}
\NewDocumentCommand{\wdbibfile}{m}{\addbibresource{#1}}
\NewDocumentCommand{\wdthemecolor}{m}{\colorlet{themecolor}{#1}}
\NewDocumentCommand{\wdstrongcolor}{m}{\colorlet{stronghighlightcolor}{#1}}

\newcommand{\titlecolorbox}[1]{%
  \begin{tcolorbox}[colback=themecolor!8,colframe=themecolor,arc=1mm,boxrule=0.2pt,width=0.97\textwidth]
    \color{themecolor}\LARGE\centering #1
  \end{tcolorbox}
}
\newcommand{\highlight}[1]{\textcolor{themecolor}{#1}}
\newcommand{\ulhighlight}[1]{\textcolor{themecolor}{\color{themecolor}\uline{#1}}}
\newcommand{\stronghighlight}[1]{\textcolor{stronghighlightcolor}{#1}}
\newcommand{\ulstronghighlight}[1]{\textcolor{stronghighlightcolor}{\color{stronghighlightcolor}\uline{#1}}}
\newcommand{\sn}{\operatorname{sn}}
\newcommand{\cn}{\operatorname{cn}}
\newcommand{\dn}{\operatorname{dn}}
\newcommand{\romanNum}[1]{\uppercase\expandafter{\romannumeral #1}}
\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}}

\newcommand{\makesection}[1][0.4]{%
  \begin{frame}[plain]
    \centering
    \vspace*{7mm}
    \begin{tabular}{l}
      {\color{themecolor}\huge\insertsectionnumber.\ \insertsection}\\
      \begin{tikzpicture}
        \fill[black!30] (0,0) rectangle (#1\textwidth,1pt);
        \fill[themecolor] (0,0) rectangle (#1\textwidth/2,1pt);
      \end{tikzpicture}
    \end{tabular}
  \end{frame}
}

\newcommand{\wdcover}{%
  \begin{frame}[plain]
    \centering
    \vspace{6.5mm}
    \IfFileExists{\wdslides@longlogo}{%
      \includegraphics[height=1.0cm]{\wdslides@longlogo}%
    }{%
      {\color{themecolor}\Large\bfseries \wdslides@longbrand}%
    }
    \vspace{6.5mm}
    \begingroup
      \let\wdslides@subtitle\@empty
      \ifwdslides@english
        \let\wdslides@subtitle\wdslides@subtitle@en
      \else
        \let\wdslides@subtitle\wdslides@subtitle@zh
      \fi
      \titlecolorbox{\wdslides@localized{title}\ifx\wdslides@subtitle\@empty\else\\{\large\wdslides@subtitle}\fi}
    \endgroup
    \wdslides@iflocalizedempty{coverextra}{}{\titlecolorbox{\wdslides@localized{coverextra}}}
    \vspace{3mm}
    \begin{tabular}{>{\color{themecolor}}r@{\hspace{3pt}}l}
      \wdslides@localized{presenterlabel} & \wdslides@localized{author}\\
      \wdslides@iflocalizedempty{supervisor}{}{\wdslides@localized{supervisorlabel} & \wdslides@localized{supervisor}\\}
      \wdslides@iflocalizedempty{institute}{}{\wdslides@localized{institutelabel} & \wdslides@localized{institute}\\}
    \end{tabular}

    \vspace{2mm}
    \wdslides@localized{date}
    \vfill
  \end{frame}
}

\newcommand{\wdtableofcontents}{%
  \begin{frame}
    \frametitle{\wdslides@localized{tocname}}
    \setlength{\parskip}{0.2em}
    \tableofcontents
  \end{frame}
}
\newcommand{\wdfrontmatter}{\wdcover\wdtableofcontents}
\newcommand{\wdbackmatter}{%
  \begin{frame}[plain]
    \vspace{13mm}
    \titlecolorbox{\wdslides@localized{thanks}}
    \vspace{13mm}
  \end{frame}
}

\AtBeginDocument{%
  \ifwdslides@english
    \renewcommand{\today}{\wdslides@englishdate}%
  \fi
  \renewcommand{\figurename}{\wdslides@localized{figurelabel}}%
  \renewcommand{\tablename}{\wdslides@localized{tablelabel}}%
}

\endinput
