%%% Identification

\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{assigment} % assigment is the name we need to provide to
                          % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the student id
\newcommand{\studentid}[1]{ \newcommand{\studentidlocal}{#1} }
% We define the macro for the name of the lecturer
\newcommand{\lecturer}[1]{ \newcommand{\lecturerlocal}{#1} }
% We define the macro for the name of the course
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
% We define the macro for the name of the institution
\newcommand{\institute}[1]{ \newcommand{\institutelocal}{#1} }

%these are auxiliary definitions used in the title section
\newcommand{\CourseLang}{Course}
\newcommand{\DateLang}{Due date}
\newcommand{\StudentLang}{Student name}
\newcommand{\StudentIdLang}{Student ID}
\newcommand{\LecturerLang}{Lecturer}

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}

\newcommand{\DocumentClass}{article}

\newif\ifChinese

% we hardcode some language options
\DeclareOption{Chinese} {
  \Chinesetrue
  \renewcommand{\DocumentClass}{ctexart}
  \DeclareOption{GBK}{\PassOptionsToClass{GBK}{\DocumentClass}}
  \DeclareOption{UTF8}{\PassOptionsToClass{UTF8}{\DocumentClass}}

  \renewcommand{\CourseLang}{课程}
  \renewcommand{\LecturerLang}{教师}
  \renewcommand{\DateLang}{截止日期}
  \renewcommand{\StudentLang}{姓名}
  \renewcommand{\StudentIdLang}{学号}
}

\PassOptionsToClass{a4paper}{\DocumentClass}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\DocumentClass}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files


% we need to load
\LoadClass{\DocumentClass}

% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section
\titleformat{\section}[block]{\normalsize\bfseries\filcenter}{\thesection.}{.3cm}{}

% modification of subsection and sub sub section
\titleformat{\subsection}[runin]{\bfseries}{\thesubsection.}
{1mm}{}[.\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{\thesubsubsection.}
{1mm}{}[.\quad]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] { \footnotesize\thepage }
\fancyhead[LO] {
  \footnotesize
  \ifdef{\classlocal} {{\itshape \classlocal} -- } {}
  \itshape\makeatletter\@title\makeatother
}
\fancyfoot[RO] {
  \footnotesize
  \itshape\makeatletter\@author\makeatother
  \ifdef{\studentidlocal} { -- {\itshape \studentidlocal}} {}
}

% New title style for the document
\renewcommand{\maketitle} {
  \thispagestyle{plain}
  \begin{center}
    \ifdef{\institutelocal} {{\scshape \institutelocal} \\ [10pt]} {}
    \hrule
    \vspace{10pt}
    {\LARGE \bfseries \@title} \\ [5pt]
    \StudentLang: {\itshape \@author}
    \ifdef{\studentidlocal} { -- \StudentIdLang: {\itshape \studentidlocal}} {}
    \vspace{8pt}
    \hrule
    \vspace{10pt}
    \ifdef{\classlocal} {\CourseLang: {\itshape \classlocal}} {}
    \ifdef{\lecturerlocal} { -- \LecturerLang: {\itshape \lecturerlocal}} {}
    \\
    \DateLang: {\itshape \@date}
    \vspace{15pt}
  \end{center}
}

% Template-specific packages
\usepackage{xeCJK} % Required for CJK

\usepackage[backend=biber, sorting=anyvt]{biblatex} % Required for Biber

\ifChinese
\else
  \usepackage[english]{babel} % English language hyphenation
\fi
\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage{times} % Use the Times font
\newcommand{\Monospace}{\ttfamily}
\IfFontExistsTF{Menlo} {
  \newfontfamily\Menlo{Menlo}
  \renewcommand{\Monospace}{\Menlo}
} {
  \IfFontExistsTF{Monaco} {
    \newfontfamily\Monaco{Monaco}
    \renewcommand{\Monospace}{\Monaco}
  } {
  }
}

\usepackage{graphicx} % Required for including images
\usepackage{float}
\usepackage{subcaption}
\usepackage{tikz}

\usepackage{booktabs} % Required for better horizontal rules in tables
\usepackage{tabularx}
\usepackage{diagbox}

\usepackage{algorithmicx}  % Required for insertion of code
\usepackage{listings}
\usepackage{xcolor}
\ifChinese
  \renewcommand{\lstlistingname}{源代码}
\fi
\lstset{
  frame=tbTB,
  basicstyle=\small\Monospace,
  numbersep=12pt,
  numbers=left,
  numberstyle=\scriptsize\Monospace,
  showspaces=false,
  showstringspaces=false,
  tabsize=4,
  breaklines=true,
  breakatwhitespace=true
}

\usepackage{enumitem} % To modify the enumerate environment

\usepackage{hyperref} % Required for hyperlinks

\usepackage{amsmath, amssymb, amsfonts} % Required for math
\usepackage{mathtools}
\usepackage{mathrsfs}
\usepackage{physics}
\usepackage{relsize}
\usepackage{extarrows}

\allowdisplaybreaks
\setlength\parindent{0pt}
\tolerance=1000
\emergencystretch=\maxdimen
\hyphenpenalty=1000
\hbadness=10000

% definition of the "problem" environment
\RequirePackage{framed}
\newenvironment{problem} {
  \begin{framed}
} {
  \end{framed}
  \bigskip
}

%%% We finish the class with this command
\endinput
