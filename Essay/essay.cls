%----------------------------------------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{essay}

\newcommand{\@DocumentClass}{article}

\newif\if@Chinese\@Chinesefalse

% we hardcode some language options
\DeclareOption{Chinese} {
  \@Chinesetrue
  \renewcommand{\@DocumentClass}{ctexart}
  \DeclareOption{GBK}{\PassOptionsToClass{GBK}{\@DocumentClass}}
  \DeclareOption{UTF8}{\PassOptionsToClass{UTF8}{\@DocumentClass}}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@DocumentClass}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{\@DocumentClass} % Load the base class

%----------------------------------------------------------------------------------------
% PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\RequirePackage[backend=biber, sorting=anyvt]{biblatex} % Required for Biber
\addbibresource{references.bib}

\if@Chinese
  \RequirePackage{xeCJK} % Required for CJK
  \renewcommand{\labelitemi}{\ensuremath{\bullet}}
  \DeclarePrintbibliographyDefaults{title=参考文献}
\else
  \RequirePackage[english]{babel} % English language hyphenation
\fi

\RequirePackage{graphicx} % Required for including images
\graphicspath{{figures/}{./}} % Specifies where to look for included images (trailing slash required)

\RequirePackage{wrapfig} % Allows in-line images

\RequirePackage{booktabs} % Required for better horizontal rules in tables
\RequirePackage{tabularx} % Better tabular environment
\RequirePackage{multirow} % Required for merging tabular cells
\RequirePackage{diagbox} % Required for drawing diagonal lines in tabular cells
\RequirePackage{makecell} % Required for creating multilined tabular cells

\RequirePackage{enumitem} % Required for list customisation
\setlist{noitemsep} % No spacing between list items

%----------------------------------------------------------------------------------------
% DOCUMENT MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
  paper=a4paper, % Paper size, change to letterpaper for US letter size
  top=2.5cm, % Top margin
  bottom=3cm, % Bottom margin
  left=2.5cm, % Left margin
  right=2.5cm, % Right margin
  headheight=0.75cm, % Header height
  footskip=1.5cm, % Space from the bottom margin to the baseline of the footer
  headsep=0.75cm, % Space from the top margin to the baseline of the header
  % showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
% FONTS
%----------------------------------------------------------------------------------------

\RequirePackage[utf8]{inputenc} % Required for inputting international characters
\RequirePackage[T1]{fontenc} % Use 8-bit encoding
\RequirePackage{times} % Use the Times font

\RequirePackage[protrusion=true]{microtype} % Better typography

\linespread{1.05} % Increase line spacing slightly; Palatino benefits from a slight increase by default

%----------------------------------------------------------------------------------------
% TITLE
%----------------------------------------------------------------------------------------

\makeatletter
\renewcommand{\maketitle} { % Customise the title (do not edit title and author name here)
  \vspace*{30pt} % Vertical whitespace before the title
  \begin{flushright} % Right align
    {\LARGE \@title} % Increase the font size of the title
    \vspace{50pt} % Vertical whitespace between the title and author name
    {\large \@author} \\ % Author name
    \@date % Date
    \vspace{40pt} % Vertical whitespace between the author block and abstract
  \end{flushright}
}
\makeatother

%----------------------------------------------------------------------------------------
% HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Required for customising headers and footers
\pagestyle{fancy} % Enable custom headers and footers

\renewcommand{\headrulewidth}{0pt} % Remove default top horizontal rule
\fancyhf{} % Remove all headers and footers
\fancyfoot[C]{\thepage} % Center footer

%%% We finish the class with this command
\endinput
