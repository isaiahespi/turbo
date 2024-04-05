%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Turbo Article LaTeX Class
%
% Version 2.2 (15/10/2019)
%
% The following class options are specific to the Turbo article class:
%
%    twoside:       use two-sided output.
%    twocolumn:     use two-coloumn output; this option should be used together
%                      should be used together with narrower margins and a
%                      reduced fontsize.
%    9pt, 11pt,...: font size for normal text; 9pt is useful for twocolumn
%                      output while other font sizes supported by the extsizes
%                      package will also work (default: 10pt)
%    narrowmargins: use narrow margins; useful for twocolumn articles.
%    normalnumbers: use normal numbers for sectioning (default are roman numbers).
%    lucida:        use Lucida fonts; this requires Lua/XeLaTeX (default: Palatino
%                      for pdfLaTeX or TeX Gyre Pagella for Lua/XeLaTeX).
%    phfthm:        provide theorem and proof environments from the phfthm package.
%
% All other options are passed on the extarticle base class/extsizes package. Note
% that the class produces A4 output
%
% This template is based on work available at http://www.LaTeXTemplates.com.
%
% Author:
% Isaiah Espinoza (gespinoz@umd.edu)
%
% Special Thanks to the real author of this article LaTeX Class: 
% Christian Marquardt (christian@marquardt.sc)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{turbo}[2024/04/05 Turbo LaTeX Class v2.4]

\newif\if@narrowmargins\@narrowmarginsfalse
\DeclareOption{narrowmargins}{\@narrowmarginstrue}

\newif\if@normalnumbers\@normalnumbersfalse
\DeclareOption{normalnumbers}{\@normalnumberstrue}

\newif\if@lucida\@lucidafalse
\DeclareOption{lucida}{\@lucidatrue}

\newif\if@phfthm\@phfthmfalse
\DeclareOption{phfthm}{\@phfthmtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax % Process class options

%\LoadClass[twoside,12pt]{article}
\LoadClass[a4paper]{extarticle} % Load the primary class with set options

%----------------------------------------------------------------------------------------
%	FONTS AND TYPESETTING
%----------------------------------------------------------------------------------------

%% Language and font encodings
\RequirePackage[english]{babel}
\RequirePackage{ifxetex,ifluatex,ifpdf}
\ifxetex\else
  \ifluatex\else
    \RequirePackage[utf8]{inputenc}
\fi\fi
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext}%,newtxmath}%CTK fixes clash with pandoc amsmath
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\linespread{1.05} % Line spacing - Palatino needs more space between lines



% 
% \usepackage{iftex}
% 
% \newif\if@unicode\@unicodefalse
% \ifluatex\@unicodetrue\fi
% \ifxetex\@unicodetrue\fi
% 
% \if@unicode
% 
%   %% For LuaLaTeX or XeLaTeX
% 
%    %% When using unicode-math, this must come first
%    \if@phfthm
%       \usepackage{phfthm}
%    \fi
%    \usepackage{amsmath} % already standard with quarto
%    \usepackage{mathtools}
% 
%    \usepackage{fontspec}
%    \usepackage[math-style=ISO,bold-style=ISO]{unicode-math}
% 
%    \if@lucida
%       \defaultfontfeatures{Scale=.92}
%       \setmainfont{LucidaBrightOT}
%       \setmathfont{LucidaBrightMathOT}
%    \else
%       \setmainfont{TeX Gyre Pagella}
%       \setmathfont{TeX Gyre Pagella Math}
%    \fi
% 
% \else
% 
%   %% For pdfLaTeX:
%    \usepackage[slantedGreek]{mathpazo} % Use the Palatino font
%    \usepackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
% 
%    %% When using unicode-math, this must come first
%    \if@phfthm
%       \usepackage{phfthm}
%    \fi
%    \usepackage{amsmath}
%    \usepackage{mathtools}
% 
% \fi


%----------------------------------------------------------------------------------------
%	FURTHER PACKAGES
%----------------------------------------------------------------------------------------

% \RequirePackage{quoting}
% \quotingsetup{font=small,indentfirst=false,begintext={``},endtext={''},vskip=0.5\baselineskip,leftmargin=\parindent,rightmargin=0pt}


%\usepackage[british]{babel} % Language hyphenation and typographical rules
\usepackage[en-GB]{datetime2}
%\DTMlangsetup[en-GB]{ord=raise,monthyearsep={,\space}}
\DTMlangsetup[en-GB]{ord=omit}


%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\if@narrowmargins
   \usepackage[a4paper,left=2cm,right=1.5cm,top=2.5cm,bottom=2.5cm]{geometry} % Document margins
\else
   \usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry} % Document margins
\fi

\usepackage[hang,small,labelfont=bf,up,textfont=it,up]{caption} % Custom captions under/above floats in tables or figures
\usepackage{booktabs} % Better looking tables

\usepackage{enumitem} % Customized lists
\setlist[itemize]{noitemsep} % Make itemize lists more compact


%----------------------------------------------------------------------------------------
%	TITLE, ABSTRACT AND PAGE HEADERS/FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage{titling} % Customizing the title section

\setlength{\droptitle}{-4\baselineskip} % Move the title up

\pretitle{\begin{center}\LARGE\bfseries} % Article title formatting
\posttitle{\end{center}\vskip 1em} % Article title closing formatting
\preauthor{\begin{center}
           \large \lineskip 0.5em%
           \begin{tabular}[t]{c}}
\postauthor{\end{tabular}\par\end{center}\vskip 0.75em}
\predate{\begin{center}\large}
\postdate{\par\end{center}\vskip 1em}

\RequirePackage{abstract} % Allows abstract customization
\renewcommand{\abstractnamefont}{\normalfont\bfseries} % Set the "Abstract" text to bold
\renewcommand{\abstracttextfont}{\normalfont\small\itshape} % Set the abstract itself to small italic text
\setlength{\abstitleskip}{0.5em}

\RequirePackage{fancyhdr} % Headers and footers
\pagestyle{fancy} % All pages have headers and footers
\fancyhead{} % Blank out the default header
\fancyfoot{} % Blank out the default footer
\fancyfoot[RO,LE]{\thepage} % Custom footer text

%----------------------------------------------------------------------------------------
%	SECTION HEADINGS
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Allows customization of titles
\if@normalnumbers
   \renewcommand\thesection{\arabic{section}} % Arabic numerals for the sections
   \renewcommand\thesubsection{\arabic{section}.\arabic{subsection}} % Arabic numerals for subsections
\else
   \renewcommand\thesection{\Roman{section}} % Roman numerals for the sections
   \renewcommand\thesubsection{\roman{subsection}} % Roman numerals for subsections
\fi

\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \if@normalnumbers
     \renewcommand\thesection{\Alph{section}} % Arabic numerals for the sections
     \renewcommand\thesubsection{\Alph{section}.\arabic{subsection}} % Arabic numerals for subsections
  \else
     \renewcommand\thesection{\Alph{section}} % Roman numerals for the sections
     \renewcommand\thesubsection{\roman{subsection}} % Roman numerals for subsections
  \fi
  }

\titleformat{\section}[block]{\large\scshape\centering}{\thesection.}{1em}{} % Change the look of the section titles
\titleformat{\subsection}[block]{\large}{\thesubsection.}{1em}{} % Change the look of the section titles



%----------------------------------------------------------------------------------------
%	HYPERREF SETUP
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % note that xcolor must be loaded before tikz package

\usepackage{hyperref} % For hyperlinks in the PDF
\hypersetup{hidelinks,
            colorlinks,
            breaklinks=true,
            linkcolor=Blue,
            filecolor=Blue,
            citecolor=Blue,
            urlcolor=Maroon,
            bookmarksopen=false}




%----------------------------------------------------------------------------------------

\endinput
