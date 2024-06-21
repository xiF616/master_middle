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
[0000/00/00 v3.1d Harbin Institute of Technology Thesis Template]

%% 处理文档类选项
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=hit,
  prefix=hit@,
  setkeys=\kvsetkeys
}

\newif\ifhit@opening
\newif\ifhit@midterm
\define@key{hit}{stage}{%
  \hit@openingfalse
  \hit@midtermfalse
  \expandafter\csname hit@#1true\endcsname
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
\setmainfont{Times New Roman}[ % 衬线字体
  AutoFakeBold=1.5,
]

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
  left=30true mm,
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
\hit@def@fontsize{xiaoer}{18bp}
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
\setlength{\parindent}{2\ccwd}
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
      beforeskip={7.5bp},
      afterskip={7.5bp},
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
      % format={\heiti\xiaosi},
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

\hit@def@term{ctitlecover}
\hit@def@term{cstudent}
\hit@def@term{cstudentid}
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
\newcommand{\reportsep}{\hspace{4.1pt}}
\def\hitsetup{\kvsetkeys{hit}}
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{\textwidth}
\setlength{\TPVertModule}{\textheight}
\newcommand{\content}[1]{\underline{\makebox[7.3cm]{\textbf{#1}}}}
\newcommand{\hit@report@titlepage@graduate}{
  \begin{textblock}{1}(0.463,0.21)
    \zihao{-2}{\CJKfamily{kaiti2312}\textbf{哈{\schoolsep}尔{\schoolsep}滨{\schoolsep}工{\schoolsep}业{\schoolsep}大{\schoolsep}学}}
  \end{textblock}
  \begin{textblock}{1}(0.336,0.303)
    \zihao{2}\textbf{硕{\reportsep}士{\reportsep}学{\reportsep}位{\reportsep}论{\reportsep}文{\reportsep}中{\reportsep}期{\reportsep}报{\reportsep}告}
  \end{textblock}
  {
    \vspace*{5.45cm}
    \begin{center}
      \zihao{-2}\textbf{题\hspace{9pt}目：\hit@ctitlecover}
    \end{center}
  }
  % \begin{textblock*}{\linewidth}(0cm,9.5cm)%(-0.07,0.38)
    % \begin{minipage}{\textwidth}
        % \parbox[t][3cm][t]{\textwidth}{
            % \songti\xiaoer\textbf{题\hspace{\ccwd}目：\hit@ctitlecover}
        % }
    % \end{minipage}
  % \end{textblock*}
  \begin{textblock}{1}(0.205,0.512)
    \zihao{3}
    \renewcommand{\arraystretch}{1.9}
    \begin{tabular}{l@{}c}
      \textbf{院{\hfill}（系）}        & \content{数学学院}             \\
      \textbf{学{\hfill}科}          & \content{基础数学}             \\
      \textbf{导{\hfill}师}          & \content{\hit@csupervisor} \\
      \textbf{研{\hfill}究{\hfill}生} & \content{\hit@cstudent}     \\
      \textbf{学{\hfill}号}          & \content{\hit@cstudentid}  \\
      \textbf{中期报告日期}              & \content{\hit@cdate}       \\
    \end{tabular}
    % \renewcommand{\arraystretch}{1}
  \end{textblock}
  \begin{textblock}{1}(0.549,1.056)
    \zihao{3}\textbf{研究生院制}
  \end{textblock}
}

\ExplSyntaxOn
  % renew \CTEX@toc@width@n,
  % add width of a space to numwidth (stored in \@tempdima)
  \cs_set_protected:Npn \CTEX@toc@width@n #1
  {
    \hbox_set:Nn \l__ctex_tmp_box {#1\,}
    \dim_set:Nn \@tempdima
    {
      \dim_max:nn { \@tempdima }
      { \box_wd:N \l__ctex_tmp_box }
    }
  }
  \RequirePackage[subfigure]{tocloft}
  \renewcommand{\cfttoctitlefont}{\hfill\xiaoer\heiti}
  \renewcommand{\cftaftertoctitle}{\hfill\mbox{}}
  \renewcommand{\cftsecfont}{\heiti}
  \renewcommand{\cftsecpagefont}{}
  \renewcommand{\cftsecdotsep}{\cftdotsep}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
  \renewcommand{\cftdotsep}{1}
  \setlength{\cftaftertoctitleskip}{40pt}
  \setlength{\cftbeforesecskip}{1.2ex}
  \setlength{\cftbeforesubsecskip}{1.2ex}
  \setlength{\cftbeforesubsubsecskip}{1.2ex}
  \setlength{\cftsubsecindent}{1em}
  \setlength{\cftsubsubsecindent}{2em}
  \setlength{\cftsecnumwidth}{1.5em}
  \setlength{\cftsubsecnumwidth}{0em}
  \setlength{\cftsubsubsecnumwidth}{0em}
\ExplSyntaxOff

\def\makecover{
  \begin{titlepage}
    \hit@report@titlepage@graduate
    \clearpage
    \ifhit@print \thispagestyle{empty}\mbox{} \clearpage \fi
    \ifhit@toc
      % \begin{spacing}{1.2} \tableofcontents \end{spacing}
      \newpage
      \tableofcontents
      \clearpage
    \fi
  \end{titlepage}
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

\newcommand{\differential}{\mathop{}\!\mathrm{d}}
\newcommand{\relphantom}[1]{\mathrel{\phantom{#1}}\negmedspace {}}
\newcommand{\realset}{\mathbb{R}}

\endinput
%%
%% End of file `examples/hitart/reports/hithesisart.cls'.
