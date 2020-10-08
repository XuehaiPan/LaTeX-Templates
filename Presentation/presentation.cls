%%% Identification

\NeedsTeXFormat{LaTeX2e} % We need to have LaTeX2e for this to compile
\ProvidesClass{presentation} % presentation is the name we need to provide to
                             % the documentclass command on the .tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

\newcommand{\DocumentClass}{beamer}

\newif\ifChinese

% We hardcode some language options
\DeclareOption{Chinese} {
  \Chinesetrue
  \renewcommand{\DocumentClass}{ctexbeamer}
  % Replace the \documentclass to 'ctexbeamer' to use Chinese Characters
  % Replace the \documentclass declaration above
  % with the following two lines to typeset your
  % lecture notes as a handout:
  % \documentclass{article}
  % \usepackage{beamerarticle}

  \DeclareOption{UTF8}{\PassOptionsToClass{UTF8}{\DocumentClass}}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\DocumentClass}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files


% We need to load
\LoadClass{\DocumentClass}


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

% Outer theme
\useoutertheme{infolines}
% \setbeamertemplate{headline}{}
\setbeamertemplate{footline}{}

% Add frame numbers to navigation symbols
\addtobeamertemplate{navigation symbols} {} {
  \bfseries \hspace{0.2em}
  \raisebox{0.5em}[0em][0em]{\insertframenumber/\inserttotalframenumber}
}

\usecolortheme{beaver}
\definecolor{darkred}{rgb}{0.7, 0, 0} % Make the red color darker and appear more like the PKU red {0.6, 0, 0}

% If you have a file called "university-logo-filename.xxx", where xxx
% is a graphic format that can be processed by latex or pdflatex,
% resp., then you can add a logo as follows:

% \pgfdeclareimage[height=0.8cm]{PKU-logo}{figures/PKU-logo.eps}
% \logo{\pgfuseimage{PKU-logo}}
\addtobeamertemplate{frametitle}{}{
  \begin{textblock*}{0.6cm}(0.875\textwidth, 0.6cm)
    \includegraphics[height=0.6cm]{figures/PKU-logo.eps}
  \end{textblock*}
}

\graphicspath{{figures/}{./}} % Specifies where to look for included images (trailing slash required)

% Template-specific packages
\usepackage[backend=biber, sorting=anyvt]{biblatex} % Required for Biber

\usepackage{xeCJK} % Required for CJK
\ifChinese
\else
  \usepackage[english]{babel} % English language hyphenation
\fi
\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage{times} % Use the Times font
\usefonttheme{professionalfonts}
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
\usepackage[absolute, overlay]{textpos}
\usepackage{float}
\usepackage[justification=centering]{caption}
\usepackage{subcaption}
\usepackage{tikz}
\usetikzlibrary{positioning, shapes.geometric}

\usepackage{booktabs} % Required for better horizontal rules in tables
\usepackage{tabularx}
\usepackage{multirow}
\usepackage{diagbox}

\usepackage{algorithm} % Required for insertion of code
\usepackage{algpseudocode}
\usepackage{minted}
\usepackage{listings}
\usepackage{xcolor}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\ifChinese
  \renewcommand{\listingscaption}{源代码}
  \renewcommand{\lstlistingname}{源代码}
\fi
\usemintedstyle{pastie}
\setminted{
  linenos=true,
  numbers=left,
  autogobble=true,
  python3=true,
  showspaces=false,
  tabsize=4,
  fontsize=\footnotesize
}
\lstset{
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

\usepackage{amsmath, amssymb, amsfonts} % Required for math
\usepackage{mathtools}
\usepackage{mathrsfs}
\usepackage{physics}
\usepackage{relsize}
\usepackage{extarrows}

% Better numbering
\setbeamertemplate{caption}[numbered]
% \numberwithin{equation}{subsection}
% \numberwithin{figure}{subsection}
% \numberwithin{table}{subsection}
% \renewcommand\thesubsection{\ifnumgreater{\value{section}}{0}{\arabic{section}.\arabic{subsection}}{\arabic{subsection}}}
% \renewcommand\theequation{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{equation}}
% \renewcommand\thefigure{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{figure}}
% \renewcommand\thetable{\ifnumgreater{\value{subsection}}{0}{\thesubsection.}{\ifnumgreater{\value{section}}{0}{\thesection.}}{}\arabic{table}}

% Better justification
\usepackage{ragged2e}
\usepackage{etoolbox}
\apptocmd{\frame}{}{\justifying}{}
\makeatletter
\renewcommand{\itemize}[1][] {
  \beamer@ifempty{#1}{}{\def\beamer@defaultospec{#1}}
  \ifnum \@itemdepth >2\relax\@toodeep\else
    \advance\@itemdepth\@ne
    \beamer@computepref\@itemdepth
    \usebeamerfont{itemize/enumerate \beameritemnestingprefix body}
    \usebeamercolor[fg]{itemize/enumerate \beameritemnestingprefix body}
    \usebeamertemplate{itemize/enumerate \beameritemnestingprefix body begin}
    \list
      {\usebeamertemplate{itemize \beameritemnestingprefix item}}
      {
        \def\makelabel##1{{
          \hss\llap {{
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
\usepackage{setspace}

\setlength\parindent{0pt}
\tolerance=1000
\emergencystretch=\maxdimen
\hyphenpenalty=1000
\hbadness=10000

%%% We finish the class with this command
\endinput
