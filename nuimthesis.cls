% NUIM thesis class file for LaTeX2e.
% Made by Baruch Even <baruch@ev-en.org>
% Updated by Andrew Page

\NeedsTeXFormat{LaTeX2e}
\def\nuimthesisversion{1.0}
\def\nuimthesisdate{2008/07/04}
\ProvidesClass{nuimthesis}[\nuimthesisdate, \nuimthesisversion]

%
% First load critical packages (needed for option processing).
%
\RequirePackage{ifthen}
\RequirePackage{graphicx}

% The following commands set the thesis/dissertation title and author,
% as well as the type size for printing the title.

\renewcommand{\title}[1]{\def\@title{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}

\title{NO TITLE!?!}
\author{NO AUTHOR!?!}
\department{NO DEPARTMENT!?!}
\faculty{NO FACULTY!?!}
\supervisor{NO SUPERVISOR!?!}

% The following commands will process the "MA", "MS", "PhD", or "EdD"
% option.  (The default is "PhD".)

% The following commands set the year in which the degree will be
% awarded.

\newcommand{\degreeyear}[1]{\def\@degreeyear{#1}}
\newcommand{\degreemonth}[1]{\def\@degreemonth{#1}}

\degreeyear{\number\year}
\degreemonth{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}

% Class Options

% The following commands will process the "single" or "double" option.
% (The default is "double".)  This controls inter-line spacing.  Note
% that the \@doublespacing value is computed by dividing the inter-line
% spacing for 3 lines/inch (1/3 inch, or 24.09 points) by the spacing
% specified for "normalsize" type (15.6 points).

\def\@singlespacing{1.0}
\def\@doublespacing{1.544}	  % see above for explanation of value
\let\@spacing=\@doublespacing

% \DeclareOption{single}{\typeout{*** Sorry, single spacing disabled ***}}
\DeclareOption{single}{\let\@spacing=\@singlespacing}
\DeclareOption{double}{\let\@spacing=\@doublespacing}

\DeclareOption{draft}{\overfullrule 5pt}  % Causes overfull hboxes to be marked.

%
% Optional title hyphenation added 14-Jun-95 by johnh.
%

% The \ProcessOptions command does the options.

\ProcessOptions

\LoadClass[12pt,twoside,openright]{book}

\lineskip 1pt            % \lineskip is 1pt for all font sizes.
\normallineskip 1pt
\renewcommand\baselinestretch{\@spacing}  % single or double spacing

% Single spacing for figure captions.
\newcommand{\captionfont}{\linespread{1}\footnotesize}

% Make left margin (oneside) to be equal to 4cm 1 inch comes from dvi...
\setlength{\oddsidemargin}{4.cm}
\addtolength{\oddsidemargin}{-1.in}


%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter definition
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.

\def\theequation{\thechapter.\arabic{equation}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			      TITLE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@maketitlepage{
   \begin {titlepage}
      \begin {center}
         \includegraphics{nuim_logo.ps} \par
	 {\LARGE \@title \par}
	 \vskip 3em
	 {\large \@author \par}
	 \vskip 9em
	 {\large Supervisor: \@supervisor\\
	 Department of \@department\\
	 Faculty of \@faculty\\
         National University of Ireland, Maynooth\\
         Maynooth, Co.Kildare, Ireland \par}
         \vskip 3em
         {\large \@degreemonth, \@degreeyear}
      \end {center}
   \end {titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			   DEDICATION PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@dedication
\def\@dedication{}
\newcommand\dedication[1]{\@dedicationtrue\def\@dedication{#1}}

\newcommand\@makededication{
   \if@dedication
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize\normalfont
      \vspace*{0pt}		% force spacing at top of page
      \vfill
      \begin{center}
	 \@dedication
      \end{center}
      \vfill
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			 ACKNOWLEDGMENTS PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@acks
\def\@acknowledgments{}
\newcommand\acknowledgments[1]{\@ackstrue\def\@acknowledgments{#1}}

\newcommand\@makeacknowledgments{
   \if@acks
      \newpage
      {
        \centering
        \textsc{\large Acknowledgments}
        \vskip 12pt
      }
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \noindent \normalsize \normalfont \@acknowledgments
      \vfill
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%		      DECLARATION 				       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@makedeclaration{
   \if@dedication
      \newpage
      {
        \centering
 	\textsc{\large Declaration}
	 \vskip 7em
	 \begin{flushleft} {\large This thesis has not been submitted in whole or in part to this or any other university for any other degree and is, except where otherwise stated, the original work of the author. \par}
	 \end{flushleft}
         \vskip 4em
	{\large Signed: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ \par}
	\vskip 1.6em
	{\large \@author \par}
	\vfill
      }
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			 ABSTRACT PAGE				       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@acks
\def\@abstractpage{}
\newcommand\abstractpage[1]{\@ackstrue\def\@abstractpage{#1}}

\newcommand\@makeabstractpage{
   \if@acks
      \newpage
      {
        \centering
        \textsc{\large Abstract}
        \vskip 12pt
      }
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \noindent \normalsize \normalfont \@abstractpage
      \vfill
   \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%		      PRINT ALL PRELIMINARY PAGES		       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\makeintropages{
  \pagenumbering{Roman}
  \@maketitlepage
  \@makededication
  \@makedeclaration
  \@makeacknowledgments
 
  \tableofcontents
  \listoffigures
  \listoftables
  \listofalgorithms

 \@makeabstractpage



  \newpage \pagenumbering{arabic}
}
