%%% Identification

\NeedsTeXFormat{LaTeX2e} % We need to have LaTeX2e for this to compile
\ProvidesClass{presentation} % presentation is the name we need to provide to
                             % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

\newcommand{\@DocumentClass}{beamer}

\newif\if@Chinese\@Chinesefalse

% We hardcode some language options
\DeclareOption{Chinese} {
  \@Chinesetrue
  \renewcommand{\@DocumentClass}{ctexbeamer}
  % Replace the \@DocumentClass to 'ctexbeamer' to use Chinese Characters
  % Replace the \@DocumentClass declaration above
  % with the following two lines to typeset your
  % lecture notes as a handout:
  % \@DocumentClass{article}
  % \RequirePackage{beamerarticle}

  \DeclareOption{UTF8}{\PassOptionsToClass{UTF8}{\@DocumentClass}}
}

\PassOptionsToPackage{table,hyperref}{xcolor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@DocumentClass}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files

% We need to load
\LoadClass{\@DocumentClass}

% There are many different themes available for Beamer.
\mode<presentation>
{
  % There are many different themes available for Beamer. A comprehensive
  % list with examples is given here:
  % http://deic.uab.es/~iblanes/beamer_gallery/index_by_theme.html
  % You can uncomment the themes below if you would like to use a different
  % one:
  % \usetheme{AnnArbor}
  % \usetheme{Antibes}
  % \usetheme{Bergen}
  % \usetheme{Berkeley}
  % \usetheme{Berlin}
  % \usetheme{Boadilla}
  % \usetheme{boxes}
  \usetheme{CambridgeUS}
  % \usetheme{Copenhagen}
  % \usetheme{Darmstadt}
  % \usetheme{default}
  % \usetheme{Frankfurt}
  % \usetheme{Goettingen}
  % \usetheme{Hannover}
  % \usetheme{Ilmenau}
  % \usetheme{JuanLesPins}
  % \usetheme{Luebeck}
  % \usetheme{Madrid}
  % \usetheme{Malmoe}
  % \usetheme{Marburg}
  % \usetheme{Montpellier}
  % \usetheme{PaloAlto}
  % \usetheme{Pittsburgh}
  % \usetheme{Rochester}
  % \usetheme{Singapore}
  % \usetheme{Szeged}
  % \usetheme{Warsaw}

  \setbeamercovered{dynamic}
  % or whatever (possibly just delete it)
}

% Outer and inner theme
\useoutertheme{infolines}
\useinnertheme{rounded}
% \setbeamertemplate{headline}{}
\setbeamertemplate{footline}{}

% Set footnote font size and symbols
\setbeamerfont{footnote}{size=\tiny}
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

% Add frame numbers to navigation symbols
\addtobeamertemplate{navigation symbols}{}{
  \bfseries \hspace{0.2em}
  \raisebox{0.5em}[0em][0em]{\insertframenumber\,/\,\inserttotalframenumber}
}

\usecolortheme{beaver}
\definecolor{darkred}{rgb}{0.7,0.0,0.0} % Make the red color darker and appear more like the PKU red (C0M100Y100K45)

% If you have a file called "university-logo-filename.xxx", where xxx
% is a graphic format that can be processed by latex or pdflatex,
% resp., then you can add a logo as follows:
% \pgfdeclareimage[height=\paperheight]{logo}{figures/logo.eps}
% \logo{\pgfuseimage{logo}}
\addtobeamertemplate{frametitle}{}{
  \let\@headlineheight\relax
  \let\@frametitleheight\relax
  \newlength{\@headlineheight}
  \newlength{\@frametitleheight}
  \usebeamerfont{headline}
  \setlength{\@headlineheight}{4.3ex}
  \settoheight{\@frametitleheight}{\strutbox{\usebeamerfont{frametitle}\insertframetitle}}
  \usebeamerfont{frametitle}
  \addtolength{\@frametitleheight}{\baselineskip+0.6cm-3ex}
  \if@Chinese
    \addtolength{\@frametitleheight}{0.1ex}
  \fi
  \ifx\insertframesubtitle\@empty
  \else
    \let\@framesubtitleheight\relax
    \newlength{\@framesubtitleheight}
    \settoheight{\@framesubtitleheight}{\strutbox{\usebeamerfont{framesubtitle}\insertframesubtitle}}
    \addtolength{\@frametitleheight}{\@framesubtitleheight}
    \usebeamerfont{framesubtitle}
    \addtolength{\@frametitleheight}{0.5\baselineskip}
  \fi
  \begin{textblock*}{0.5\paperwidth}[1.0,0.5](\paperwidth-0.2cm,\@headlineheight+0.5\@frametitleheight)
    \raggedleft
    \includegraphics[height=0.4cm+0.25\@frametitleheight]{figures/logo-frametitle.eps}
  \end{textblock*}
}

% Template-specific packages
\RequirePackage[backend=biber,sorting=anyvt]{biblatex} % Required for Biber
\addbibresource{references.bib}

\RequirePackage{iftex} % Required for checking which engine is being used
\if@Chinese
  \ifXeTeX
    \RequirePackage{xeCJK} % Required for CJK
  \fi
  \DeclarePrintbibliographyDefaults{title=参考文献}
\else
  \RequirePackage[english]{babel} % English language hyphenation
\fi
\RequirePackage[utf8]{inputenc} % Required for inputting international characters
\RequirePackage[T1]{fontenc} % Output font encoding for international characters
\RequirePackage{times} % Use the Times font
\usefonttheme{professionalfonts}
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

\RequirePackage{booktabs} % Required for better horizontal rules in tables
\RequirePackage{boldline} % Required for better horizontal and vertical rules in tables
\RequirePackage{tabularx} % Better tabular* environment
\RequirePackage{tabulary} % Better tabular* environment
\RequirePackage{multirow} % Required for merging tabular cells
\RequirePackage{diagbox} % Required for drawing diagonal lines in tabular cells
\RequirePackage{makecell} % Required for creating multilined tabular cells
\RequirePackage[table,hyperref]{xcolor} % Required for coloring rows, columns, and cells within tables
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{J}{>{\justifying\arraybackslash}X}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{B}[1]{>{\centering\arraybackslash}b{#1}}

\RequirePackage{graphicx} % Required for including images
\RequirePackage{animate} % Required for including animated graphics
\RequirePackage{wrapfig} % Allows in-line images
\graphicspath{{figures/}{./}} % Specifies where to look for included images (trailing slash required)

\RequirePackage[absolute,overlay]{textpos} % Required for creating text blocks
\RequirePackage{float} % Better floating style for figures & tables
\RequirePackage[justification=centering]{caption} % To modify the captions
\RequirePackage{subcaption} % Allows subcaptions
\RequirePackage{tikz} % Required for creating graphics
\usetikzlibrary{positioning,shapes.geometric}

\RequirePackage{algorithm} % Required for insertion of code
\RequirePackage{algpseudocode}
\RequirePackage[final]{listings}
\RequirePackage[final=true,outputdir=out]{minted}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\if@Chinese
  \renewcommand{\listingscaption}{源代码}
  \renewcommand{\lstlistingname}{源代码}
\fi
\lstset{
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
  linenos=true,
  numbers=left,
  autogobble=true,
  python3=true,
  showspaces=false,
  tabsize=4,
  fontsize={\footnotesize}
}
\setmintedinline{fontsize={\smaller}}

\RequirePackage{amsmath,amssymb,amsfonts} % Required for math
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{physics}
\RequirePackage{relsize}
\RequirePackage{extarrows}

% Better numbering
\setbeamertemplate{caption}[numbered]
% \numberwithin{equation}{subsection}
% \numberwithin{figure}{subsection}
% \numberwithin{table}{subsection}
% \renewcommand{\thesubsection}{\ifnumgreater{\value{section}}{0}{\arabic{section}.\arabic{subsection}}{\arabic{subsection}}}
% \renewcommand{\theequation}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{equation}}
% \renewcommand{\thefigure}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{figure}}
% \renewcommand{\thetable}{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{table}}

% Better justification
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\apptocmd{\frame}{}{\justifying}{}
\makeatletter
\renewcommand{\itemize}[1][] {
  \beamer@ifempty{#1}{}{\def\beamer@defaultospec{#1}}
  \ifnum \@itemdepth>2 \relax
    \@toodeep
  \else
    \advance\@itemdepth\@ne
    \beamer@computepref\@itemdepth
    \usebeamerfont{itemize/enumerate \beameritemnestingprefix body}
    \usebeamercolor[fg]{itemize/enumerate \beameritemnestingprefix body}
    \usebeamertemplate{itemize/enumerate \beameritemnestingprefix body begin}
    \list
      {\usebeamertemplate{itemize \beameritemnestingprefix item}}
      {
        \def\makelabel##1{{
          \hss\llap{{
            \usebeamerfont*{itemize \beameritemnestingprefix item}
            \usebeamercolor[fg]{itemize \beameritemnestingprefix item}##1
          }}
        }}
      }
  \fi
  \beamer@cramped
  \justifying
  \beamer@firstlineitemizeunskip
}
\makeatother

% Miscellaneous
\RequirePackage{setspace} % To modify spacing
\setlength{\parindent}{0pt} % Remove indentation for paragraphs

\tolerance=1000 % Hyphenation settings
\emergencystretch=\maxdimen
\hyphenpenalty=1000
\hbadness=10000

%%% We finish the class with this command
\endinput
