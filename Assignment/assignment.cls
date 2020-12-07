%%% Identification

\NeedsTeXFormat{LaTeX2e} % We need to have LaTeX2e for this to compile
\ProvidesClass{assignment} % assignment is the name we need to provide to
                          % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the student id
\newcommand{\studentid}[1]{\newcommand{\@studentid}{#1}}
% We define the macro for the name of the lecturer
\newcommand{\lecturer}[1]{\newcommand{\@lecturer}{#1}}
% We define the macro for the name of the course
\newcommand{\course}[1]{\newcommand{\@course}{#1}}
% We define the macro for the name of the institution
\newcommand{\institute}[1]{\newcommand{\@institute}{#1}}

% These are auxiliary definitions used in the title section
\newcommand{\@CourseLang}{Course}
\newcommand{\@DateLang}{Due date}
\newcommand{\@StudentLang}{Student name}
\newcommand{\@StudentIdLang}{Student ID}
\newcommand{\@LecturerLang}{Lecturer}
\newcommand{\@ColonLang}{: }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}

\newcommand{\@DocumentClass}{article}

\newif\if@Chinese\@Chinesefalse

% We hardcode some language options
\DeclareOption{Chinese} {
  \@Chinesetrue
  \renewcommand{\@DocumentClass}{ctexart}
  \DeclareOption{GBK}{\PassOptionsToClass{GBK}{\@DocumentClass}}
  \DeclareOption{UTF8}{\PassOptionsToClass{UTF8}{\@DocumentClass}}

  \renewcommand{\@CourseLang}{课程}
  \renewcommand{\@LecturerLang}{教师}
  \renewcommand{\@DateLang}{截止日期}
  \renewcommand{\@StudentLang}{姓名}
  \renewcommand{\@StudentIdLang}{学号}
  \renewcommand{\@ColonLang}{：}
}

\PassOptionsToClass{a4paper}{\@DocumentClass}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@DocumentClass}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files

% We need to load
\LoadClass{\@DocumentClass}

% We will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section
\titleformat{\section}[block]{\normalsize\bfseries\filcenter}{\thesection.}{.3cm}{}

% Modification of subsection and sub sub section
\titleformat{\subsection}[runin]{\bfseries}{\thesubsection.}{1mm}{}[.\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{\thesubsubsection.}{1mm}{}[.\quad]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr} % Required for customising headers and footers
\RequirePackage{lastpage} % Required for refering the last page number
\fancyhf{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % We want rules
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[L] {
  \footnotesize\itshape
  \ifdef{\@course}{\@course\ --\ }{}\@title
}
\fancyhead[R] {
  \footnotesize\itshape
  \@author\ifdef{\@studentid}{\ --\ \@studentid}{}
}
\fancyfoot[C]{\footnotesize{\thepage\ /\ \pageref*{LastPage}}}
\fancypagestyle{titlepage} {
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
  \fancyfoot[C]{\footnotesize{\thepage\ /\ \pageref*{LastPage}}}
}

% New title style for the document
\renewcommand{\maketitle} {
  \thispagestyle{titlepage}
  \begin{center}
    \ifdef{\@institute}{{\scshape \@institute} \\ \vspace{10pt}}{}
    \hrule \vspace{10pt}
    {\LARGE\bfseries \@title} \\ \vspace{5pt}
    \@StudentLang\@ColonLang{\itshape \@author}\ifdef{\@studentid}{\ --\ \@StudentIdLang\@ColonLang{\itshape \@studentid}}{} \\
    \vspace{8pt} \hrule \vspace{10pt}
    \ifdef{\@course} {
      \@CourseLang\@ColonLang{\itshape \@course}\ifdef{\@lecturer}{\ --\ \@LecturerLang\@ColonLang{\itshape \@lecturer}}{} \\
    } {
    }
    \@DateLang\@ColonLang{\itshape \@date}
    \vspace{15pt}
  \end{center}
}

% Template-specific packages
\RequirePackage[backend=biber,sorting=anyvt]{biblatex} % Required for Biber
\addbibresource{references.bib}

\RequirePackage{iftex} % Required for checking which engine is being used
\if@Chinese
  \ifXeTeX
    \RequirePackage{xeCJK} % Required for CJK
  \fi
  \renewcommand{\labelitemi}{\ensuremath{\bullet}}
  \DeclarePrintbibliographyDefaults{title=参考文献}
\else
  \RequirePackage[english]{babel} % English language hyphenation
\fi
\RequirePackage[utf8]{inputenc} % Required for inputting international characters
\RequirePackage[T1]{fontenc} % Output font encoding for international characters
\RequirePackage{times} % Use the Times font
\newcommand{\Monospace}{\ttfamily}
\ifTUTeX % XeTeX or LuaTeX
  \RequirePackage{fontspec} % Required for finding font files
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
\fi

\RequirePackage{multicol} % Required for switching between one and multicolumn format

\RequirePackage{graphicx} % Required for including images
\graphicspath{{figures/}{./}} % Specifies where to look for included images (trailing slash required)

\RequirePackage{wrapfig} % Allows in-line images
\RequirePackage{float} % Better floating style for figures & tables
\RequirePackage[justification=centering]{caption} % To modify the captions
\RequirePackage{subcaption} % Allows subcaptions
\RequirePackage{tikz} % Required for creating graphics
\usetikzlibrary{positioning,shapes.geometric}

\RequirePackage{booktabs} % Required for better horizontal rules in tables
\RequirePackage{boldline} % Required for better horizontal and vertical rules in tables
\RequirePackage{tabularx} % Better tabular* environment
\RequirePackage{tabulary} % Better tabular* environment
\RequirePackage{multirow} % Required for merging tabular cells
\RequirePackage{diagbox} % Required for drawing diagonal lines in tabular cells
\RequirePackage{makecell} % Required for creating multilined tabular cells
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{J}{>{\justifying\arraybackslash}X}

\RequirePackage{algorithm} % Required for insertion of code
\RequirePackage{algpseudocode}
\RequirePackage[final]{listings}
\RequirePackage[final=true]{minted}
\RequirePackage{xcolor}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\if@Chinese
  \renewcommand{\listingscaption}{源代码}
  \renewcommand{\lstlistingname}{源代码}
\fi
\lstset{
  frame=tbTB,
  basicstyle={\small\Monospace},
  numbersep=12pt,
  numbers=left,
  numberstyle={\scriptsize\Monospace},
  showspaces=false,
  showstringspaces=false,
  tabsize=4,
  breaklines=true,
  breakatwhitespace=true
}
\usemintedstyle{colorful}
\setminted{
  bgcolor={black!5},
  frame=lines,
  labelposition=all,
  linenos=true,
  numbers=left,
  autogobble=true,
  python3=true,
  showspaces=false,
  tabsize=4,
  fontsize={\footnotesize}
}
\setmintedinline{fontsize={\smaller}}

\RequirePackage{enumitem} % To modify the enumerate environment

\RequirePackage{hyperref} % Required for hyperlinks

\RequirePackage{amsmath,amssymb,amsfonts} % Required for math
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{physics}
\RequirePackage{relsize}
\RequirePackage{extarrows}

% Better numbering
% \numberwithin{equation}{subsection}
% \numberwithin{figure}{subsection}
% \numberwithin{table}{subsection}
\renewcommand{\thesubsection}{\ifnumgreater{\value{section}}{0}{\arabic{section}.\arabic{subsection}}{\arabic{subsection}}}
\renewcommand{\theequation}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{equation}}
\renewcommand{\thefigure}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{figure}}
\renewcommand{\thetable}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{table}}

% Miscellaneous
\RequirePackage{setspace} % To modify spacing
\setlength{\parindent}{0pt} % Remove indentation for paragraphs

\allowdisplaybreaks % Allows display breaks in environments

\tolerance=1000 % Hyphenation settings
\emergencystretch=\maxdimen
\hyphenpenalty=1000
\hbadness=10000

% Definition of the "code" environment
\newenvironment{code}{\captionsetup{type=listing}}{}

% Definition of the "problem" environment
\RequirePackage{framed}
\newenvironment{problem} {
  \begin{framed}
} {
  \end{framed}
  \bigskip
}

%%% We finish the class with this command
\endinput
