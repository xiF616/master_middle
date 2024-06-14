%% This is file `examples/hitart/reports/hithesisart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artcls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2017-2024 by Chu Yanshuo <yanshuoc@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hithesisart}
[2023/04/16 v3.1c Harbin Institute of Technology Thesis Template]

\PassOptionsToPackage{quiet}{xeCJK}

%% 处理文档类选项
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=hit,
  prefix=hit@,
  setkeys=\kvsetkeys
}

\DeclareBoolOption[true]{raggedbottom}
\DeclareBoolOption[false]{pifootnote}
\DeclareBoolOption[false]{debug}
\DeclareBoolOption[true]{toc}
\DeclareBoolOption[true]{newtxmath}
\DeclareBoolOption[false]{print}

\DeclareStringOption{fontset}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}
\PassOptionsToPackage{no-math}{fontspec}

\ProcessKeyvalOptions*

\RequirePackage{ifthen}
\ifthenelse
{\equal{\hit@fontset}{}}%
{%
  \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
}%
{%
  \ifthenelse
  {\equal{\hit@fontset}{siyuan}}%
  {\relax}%
  {%
    \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
  }%
  \PassOptionsToClass{fontset=\hit@fontset}{ctexart}
}%
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain]{ctexart}

%% 各种宏包
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\ifxetex
\else
  \ClassError{hithesis}{Please use: \MessageBreak xelatex}{}
\fi
\RequirePackage{xparse}

\RequirePackage{amsmath}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{amssymb}

\RequirePackage{xeCJK}
\setCJKfamilyfont{kaiti2312}{KaiTi_GB2312}
% \setCJKfamilyfont{cusong}{宋体}[AutoFakeBold]
\setCJKmainfont{SimSun}[
  % BoldFont=FZCuSong-B09S,
  AutoFakeBold=1.5,
  ItalicFont=KaiTi,
  ]

% \setmainfont{TeXGyreTermesX}[
%   UprightFont = *-Regular ,
%   BoldFont = *-Bold ,
%   % BoldFont = \CJKfamily{cusong},
%   ItalicFont = *-Italic ,
%   BoldItalicFont = *-BoldItalic ,
%   Extension = .otf ,
%   ]
\setmainfont{Times New Roman}[ % 衬线字体
  AutoFakeBold=1.5,
  ]
% \setsansfont{texgyreheros}[ % 无衬线字体
%   UprightFont = *-regular ,
%   BoldFont = *-bold ,
%   ItalicFont = *-italic ,
%   BoldItalicFont = *-bolditalic ,
%   Extension = .otf ,
%   ]
% \setmonofont{texgyrecursor}[ % 等宽字体，一般是打印机字体
%   UprightFont = *-regular ,
%   BoldFont = *-bold ,
%   ItalicFont = *-italic ,
%   BoldItalicFont = *-bolditalic ,
%   Extension = .otf ,
% ]
\ifhit@newtxmath
  \let\oldencodingdefault\encodingdefault
  \let\oldrmdefault\rmdefault
  \let\oldsfdefault\sfdefault
  \let\oldttdefault\ttdefault
  \def\encodingdefault{T1}
  \renewcommand{\rmdefault}{ntxtlf}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\ttdefault}{ntxtt}
  \RequirePackage{newtxmath}
  \let\encodingdefault\oldencodingdefault
  \let\rmdefault\oldrmdefault
  \let\sfdefault\oldsfdefault
  \let\ttdefault\oldttdefault
\fi

\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}       %使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\ifhit@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifhit@pifootnote
  \RequirePackage{pifont}
\fi
\RequirePackage{xeCJKfntef}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\heavyrulewidth=1.5pt
\lightrulewidth=1pt
\cmidrulewidth=0.5pt

\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage{hyperref}
\hypersetup{%
  CJKbookmarks=true,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0
}
\urlstyle{same}

\ifhit@debug
  \RequirePackage[showframe]{geometry}
\else
  \RequirePackage{geometry}
\fi
\geometry{%根据PlutoThesis 原版定义而来
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar,
  centering,
  text={150true mm,236true mm},
  top=25true mm,
  left=25true mm,
  right=25true mm,
  bottom=36true mm,
  head=5true mm,
  headsep=2true mm,
  footskip=0true mm,
  foot=5.2true mm
}

\ifhit@debug
  \RequirePackage{layout}
  \RequirePackage{layouts}
  \RequirePackage{lineno}
\fi

\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{varwidth}
\RequirePackage{changepage}
\RequirePackage{multicol}
\RequirePackage[below]{placeins}%允许上一个section的浮动图形出现在下一个section的开始部分,还提供\FloatBarrier命令,使所有未处理的浮动图形立即被处理
\RequirePackage{flafter}       % 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{multirow}       %使用Multirow宏包，使得表格可以合并多个row格
\RequirePackage{subfigure}%支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption} %支持双语标题

%% 添加字号、行距等设置
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20.50398bp}%
  \abovedisplayskip=8pt
  \abovedisplayshortskip=8pt
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip
}
\def\hit@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont
  }
}

\hit@def@fontsize{dachu}{58bp}
\hit@def@fontsize{chuhao}{42bp}
\hit@def@fontsize{xiaochu}{36bp}
\hit@def@fontsize{yihao}{26bp}
\hit@def@fontsize{xiaoyi}{24bp}
\hit@def@fontsize{erhao}{22bp}
% \newcommand{\sanhao}{\zihao{-2}}
\hit@def@fontsize{xiaoer}{18bp}
% \newcommand{\sanhao}{\zihao{3}}
\hit@def@fontsize{sanhao}{16bp}
\hit@def@fontsize{xiaosan}{15bp}
\hit@def@fontsize{sihao}{14bp}
\hit@def@fontsize{banxiaosi}{13bp}
\hit@def@fontsize{xiaosi}{12bp}
\hit@def@fontsize{dawu}{11bp}
\hit@def@fontsize{wuhao}{10.5bp}
\hit@def@fontsize{xiaowu}{9bp}
\hit@def@fontsize{liuhao}{7.5bp}
\hit@def@fontsize{xiaoliu}{6.5bp}
\hit@def@fontsize{qihao}{5.5bp}
\hit@def@fontsize{bahao}{5bp}

%% 进行字号、行距等设置
\ctexset{%
  section={
    afterindent=true,
    beforeskip={7.5bp},%上下空0.5行
    afterskip={7.5bp},
    format={\heiti\xiaosan[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsection={
    afterindent=true,
    beforeskip={7bp},
    afterskip={7bp},
    format={\heiti\sihao[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsubsection={
    afterindent=true,
    beforeskip={3bp},
    afterskip={3bp},
    format={\heiti\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true
}

%% 中文封面
\def\hit@def@term#1{%
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hit@#1\endcsname{##1}
  }
  \csname #1\endcsname{}
}

\hit@def@term{ctitleone}
\hit@def@term{ctitletwo}
\hit@def@term{csubject}
\hit@def@term{cauthor}
\hit@def@term{cstudentid}
\hit@def@term{caffil}
\hit@def@term{csupervisor}
\hit@def@term{cdate}

\def\hit@parse@keywords#1{
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname hit@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname hit@#1\endcsname\@empty\else
      \expandafter\g@addto@macro\csname hit@#1\endcsname{%
        \ignorespaces\csname hit@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
      \expandafter\csname hit@#1\expandafter\endcsname\expandafter{\reserved@a}
    }
  }
}
\newcommand{\schoolsep}{\hspace{4pt}}
\newcommand{\reportsep}{\hspace{4.2pt}}
\def\hitsetup{\kvsetkeys{hit}}
\newcommand{\hit@report@titlepage@graduate}{
  \ifthenelse
  {\equal{\hit@fontset}{siyuan}}%
  {\xiaosi[1]\vspace*{0.65em}}%
  {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\hit@hi}}}%

  \vspace*{4.2em}
  % \hspace*{\fill} \hspace*{\fill}

  % \hspace*{11.1em}
  \hspace*{4.6cm}
  % \begin{center}
  \zihao{-2}{\CJKfamily{kaiti2312}\textbf{哈{\schoolsep}尔{\schoolsep}滨{\schoolsep}工{\schoolsep}业{\schoolsep}大{\schoolsep}学}}
    % \zihao{-2}\CJKfamily{kaiti2312}\textbf{哈\hfill 尔\hfill 滨\hfill 工\hfill 业\hfill 大\hfill 学}
  % \end{center}
  % \hspace*{11em}

  \vspace{2.1em}
  \hspace*{4.1em}
  % \begin{center}
  \zihao{2}\textbf{硕{\reportsep}士{\reportsep}学{\reportsep}位{\reportsep}论{\reportsep}文{\reportsep}中{\reportsep}期{\reportsep}报{\reportsep}告}
  % \end{center}

  \vspace{2.1mm}
  \parbox[t][3cm][t]{\textwidth}{
    \begin{center}
      % \songti\xiaoer\textbf{题\hspace{\ccwd}目：\hit@ctitlecover}
      \zihao{-2}\textbf{题\hspace{9pt}目：\hit@ctitleone \\ \hit@ctitletwo}
    \end{center}
  }
  \vspace*{-2.6mm}
  % \parbox[b][3cm][t]{\textwidth}{
    \begin{center}\zihao{3}
      \renewcommand{\arraystretch}{1.9}
      \begin{tabular}{l@{}c}
        \textbf{\makebox[6\ccwd][s]{院（系}）} & \underline{\makebox[7cm]{\textbf{数学学院}}}\\
        \textbf{\makebox[6\ccwd][s]{学科}} & \underline{\makebox[7cm]{\textbf{基础数学}}}\\
        \textbf{\makebox[6\ccwd][s]{导师}} & \underline{\makebox[7cm]{\textbf{\hit@csupervisor}}}\\
        \textbf{\makebox[6\ccwd][s]{研究生}} & \underline{\makebox[7cm]{\textbf{\hit@cauthor}}}\\
        \textbf{\makebox[6\ccwd][s]{学号}} & \underline{\makebox[7cm]{\textbf{\hit@cstudentid}}}\\
        \textbf{中期报告日期} & \underline{\makebox[7cm]{\textbf{\hit@cdate}}}\\
      \end{tabular}
      \renewcommand{\arraystretch}{1}
    \end{center}
    % \vspace*{5mm}
  % }
  \vfill
  \begin{center}
    \zihao{3}\textbf{研究生院制}
  \end{center}
  % \hspace*{\fill}
  \vspace*{4.65mm}
}

\RequirePackage{setspace}
\def\makecover{
  \begin{titlepage}
    \hit@report@titlepage@graduate
    \clearpage
    \ifhit@print \thispagestyle{empty}\mbox{} \clearpage \fi
    \ifhit@toc
      \begin{spacing}{1}
        \thispagestyle{empty}
        \tableofcontents
      \end{spacing}
      \clearpage
    \fi
  \end{titlepage}
  \pagenumbering{arabic}
}

%% 引用和参考文献格式
\newcommand\bibstyle@numerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{\hit@inline@sep}}

\citestyle{numerical}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\citestyle{inline}\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewenvironment{thebibliography}[1]{%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\renewcommand{\makelabel}[1]{##1\hfill}
    \settowidth{\labelwidth}{\@biblabel{#1}}
    \setlength{\labelsep}{0.5em}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelsep+\labelwidth}
    \addtolength{\itemsep}{-0.8em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \clubpenalty0
  \@clubpenalty \clubpenalty
  \widowpenalty0%
  \interlinepenalty-50%
  \sfcode`\.\@m
}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist\frenchspacing}

%% 杂项
\AtEndOfClass{\input{hithesisart.cfg}}
\AtEndOfClass{\sloppy}

\endinput
%%
%% End of file `examples/hitart/reports/hithesisart.cls'.
