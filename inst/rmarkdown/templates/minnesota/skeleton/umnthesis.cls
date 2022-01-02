%% ADOPTED FROM: umnStatThesis class (https://www.stat.umn.edu/computing/formatting.html)

\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{umnthesis}[2021/12/20 v1.0 University of Minnesota Doctoral Thesis]
\LoadClass[11pt, oneside]{book}

%% ------------------------------------------------------------------- %%
%% Useful LaTeX packages for mathematics
%% ------------------------------------------------------------------- %%

\RequirePackage{amsmath}
\RequirePackage{amssymb}

%% ------------------------------------------------------------------- %%
%% Set margins
%% ------------------------------------------------------------------- %%

\RequirePackage[total={6in,9in},top=1in,inner=1.5in,includeheadfoot,headheight=15pt]{geometry}

%% ------------------------------------------------------------------- %%
%% Set spacing
%% ------------------------------------------------------------------- %%

\RequirePackage{setspace}
\doublespacing
% \setstretch{1.5}

%% ------------------------------------------------------------------- %%
%% Make the chapter headings look right,  given double spacing
%% ------------------------------------------------------------------- %%

%\let\origmakechapterhead\@makechapterhead
\def\origmakechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
%        \huge\bfseries \@chapapp\space \thechapter
        \LARGE\bfseries \@chapapp\space \thechapter
%        \LARGE\textsc{\@chapapp\space \thechapter}
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}

\let\origmakeschapterhead\@makeschapterhead
\renewcommand{\@makechapterhead}[1]{\begin{singlespace}\origmakechapterhead{#1}\end{singlespace}}
\renewcommand{\@makeschapterhead}[1]{\begin{singlespace}\origmakeschapterhead{#1}\end{singlespace}}


%% ------------------------------------------------------------------- %%
%% Titling commands
%% ------------------------------------------------------------------- %%

\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\month#1{\gdef\@month{#1}}
\def\@month{\@latex@warning@no@line{No \noexpand\month given}}
\def\year#1{\gdef\@year{#1}}
\def\@year{\@latex@warning@no@line{No \noexpand\year given}}
\global\let\@coadvisor\@empty
\def\coadvisor#1{\gdef\@coadvisor{#1}}


%% ------------------------------------------------------------------- %%
%% For building the frontmatter pages
%% ------------------------------------------------------------------- %%

\newcommand{\clearasneeded}{\if@openright\cleardoublepage\else\clearpage\fi}
\newenvironment{prepage}
{\clearasneeded\thispagestyle{empty}\begin{singlespace}\begin{center}}
{\end{center}\end{singlespace}\clearasneeded}
%\newcommand\thesisEmph[1]{\MakeUppercase{#1}}
\newcommand\thesisEmph[1]{\textsc{\MakeLowercase{#1}}}


%% ------------------------------------------------------------------- %%
%% For building the signature page
%% ------------------------------------------------------------------- %%

\newcommand\twoadvisorsignatures[2]{%
\begin{minipage}{2.8in}\begin{center}%
{\large#1\par}%
\vskip 2pt\hrule\par\vskip 0.5em%
Name of Faculty Co-Advisor\par%
\vskip 5em\hrule\par\vskip 0.5em%
Signature of Faculty Co-Advisor\par%
\vskip 5em\hrule\par\vskip 0.5em%
Date\par%
\end{center}\end{minipage}%
\hskip 0.4in%
\begin{minipage}{2.8in}\begin{center}%
{\large#2\par}%
\vskip 2pt\hrule\par\vskip 0.5em%
Name of Faculty Co-Advisor\par%
\vskip 5em\hrule\par\vskip 0.5em%
Signature of Faculty Co-Advisor\par%
\vskip 5em\hrule\par\vskip 0.5em%
Date\par%
\end{center}\end{minipage}%
}

\newcommand\oneadvisorsignature[1]{%
\begin{minipage}{5in}\begin{center}%
{\large#1\par}%
\vskip 2pt\hrule\par\vskip 0.5em%
Name of Faculty Advisor\par%
\vskip 5em\hrule\par\vskip 0.5em%
Signature of Faculty Advisor\par%
\vskip 5em\hrule\vskip 0.5em%
Date\par%
\end{center}\end{minipage}%
}

\newcommand\makesignaturepage{%
\begin{prepage}%
{\Large\thesisEmph{University of Minnesota}\par}%
\vfill%
{This is to certify that I have examined\\this copy of a doctoral dissertation by\par}%
\vskip 2em%
{\large\@author\par}%
\vskip 2em%
{and have found that it is complete and satisfactory in all respects,\\
and that any and all revisions required by the final \\
examining committee have been made.\par}
\vfill%
\ifx\@coadvisor\@empty\oneadvisorsignature{\@advisor}%
\else\twoadvisorsignatures{\@advisor}{\@coadvisor}\fi%
\vfill%
{\Large\thesisEmph{Graduate School}}%
\end{prepage}%
}


%% ------------------------------------------------------------------- %%
%% For building the title page (PhD dissertation)
%% ------------------------------------------------------------------- %%

\newcommand\maketitlepage{%
\begin{prepage}%
%\vspace*{\fill}
\vspace*{0.3in}
{\Large\begin{spacing}{1.4}\@title\end{spacing}\par}%
\vfill%
{\large\thesisEmph{A Dissertation}\\
\thesisEmph{Submitted to the Faculty of the Graduate School}\\
\thesisEmph{of the University of Minnesota}\\
\thesisEmph{by}\par}%
\vspace{3em}%
{\large\@author\par}%
\vfill%
{\large\thesisEmph{In Partial Fulfillment of the Requirements}\\
\thesisEmph{for the Degree of}\par
\thesisEmph{Doctor of Philosophy}\par}%
\vspace{3em}
\ifx\@coadvisor\@empty{\large\@advisor, Advisor\par}%
\else{\large\@advisor\ and\\\@coadvisor, Advisors\par}\fi%
\vspace{3em}
{\large\@month\ \@year}%
\end{prepage}%
}


%% ------------------------------------------------------------------- %%
%% For building the title page (Plan A thesis)
%% ------------------------------------------------------------------- %%

\newcommand\makethesistitlepage{%
\begin{prepage}%
%\vspace*{\fill}
\vspace*{0.3in}
{\Large\begin{spacing}{1.4}\@title\end{spacing}\par}%
\vfill%
{\large\thesisEmph{A Plan A Thesis}\\
\thesisEmph{Submitted to the Faculty of the Graduate School}\\
\thesisEmph{of the University of Minnesota}\\
\thesisEmph{by}\par}%
\vspace{3em}%
{\large\@author\par}%
\vfill%
{\large\thesisEmph{In Partial Fulfillment of the Requirements}\\
\thesisEmph{for the Degree of}\par
\thesisEmph{Master of Arts}\par}%
\vspace{3em}
\ifx\@coadvisor\@empty{\large\@advisor, Advisor\par}%
\else{\large\@advisor\ and\\\@coadvisor, Advisors\par}\fi%
\vspace{3em}
{\large\@month\ \@year}%
\end{prepage}%
}

%% ------------------------------------------------------------------- %%
%% For building the title page (Plan B paper)
%% ------------------------------------------------------------------- %%

\newcommand\makeplanbtitlepage{%
\begin{prepage}%
%\vspace*{\fill}
\vspace*{0.3in}
{\Large\begin{spacing}{1.4}\@title\end{spacing}\par}%
\vfill%
{\large\thesisEmph{A Plan B Paper}\\
\thesisEmph{Submitted to the Faculty of the Graduate School}\\
\thesisEmph{of the University of Minnesota}\\
\thesisEmph{by}\par}%
\vspace{3em}%
{\large\@author\par}%
\vfill%
{\large\thesisEmph{In Partial Fulfillment of the Requirements}\\
\thesisEmph{for the Degree of}\par
\thesisEmph{Master of Arts}\par}%
\vspace{3em}
\ifx\@coadvisor\@empty{\large\@advisor, Advisor\par}%
\else{\large\@advisor\ and\\\@coadvisor, Advisors\par}\fi%
\vspace{3em}
{\large\@month\ \@year}%
\end{prepage}%
}


%% ------------------------------------------------------------------- %%
%% For building the copyright page
%% ------------------------------------------------------------------- %%

\newcommand\makecopyrightpage{%
\begin{prepage}%
\vspace*{\fill}%
\copyright\ \@author\ \@year%
\end{prepage}%
}


%% ------------------------------------------------------------------- %%
%% For building the acknowledgements, dedication, and abstract pages
%% ------------------------------------------------------------------- %%

\newenvironment{frontpage}[2][0in]
{\clearasneeded\thispagestyle{plain}\vspace*{#1}%
{\centering\large\textsc{#2}\par}%
\vspace{3em}\noindent\ignorespaces}
{\clearasneeded}

\newenvironment{acknowledgements}[1][0in]{\begin{frontpage}[#1]{Acknowledgements}}{\end{frontpage}}
\newenvironment{dedication}[1][0in]{\begin{frontpage}[#1]{Dedication}}{\end{frontpage}}
\newenvironment{abstract}[1][0in]{\begin{frontpage}[#1]{Abstract}}{\end{frontpage}}


%% ------------------------------------------------------------------- %%
%% Make it pretty
%% ------------------------------------------------------------------- %%

% this prevents funny breaks in the middle of pages with little text
\raggedbottom

% add new Chapter mechanism 
\newcommand{\chapterX}[1]{\chapter*{#1
        \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}%
        \addcontentsline{toc}{chapter}{#1}
}


% make headings look nicer
\RequirePackage{fancyhdr}
\fancyhf{}
\if@twoside
\fancyhead[LE]{\textbf{\thepage}}
\fancyhead[RE]{\nouppercase{\sc\leftmark}}
\fi
\fancyhead[RO]{\textbf{\thepage}}
\fancyhead[LO]{\nouppercase{\sc\rightmark}}
\renewcommand{\headrulewidth}{0pt}

% make chapters mark both sides to do the right thing when a chapter has no sections
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth
	{\MakeUppercase\@chapapp\ \thechapter. \ #1}
	{\MakeUppercase\@chapapp\ \thechapter. \ #1} }

% redefine the plain style to have bold page numbers
\fancypagestyle{plain}{% 
\fancyhf{} % clear all header and footer fields 
\fancyfoot[C]{\bfseries \thepage} % except the center 
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}}

% make blank pages really blank if using twoside
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage%
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage

% for easier referencing
\RequirePackage{varioref}
\labelformat{chapter}{\chaptername~#1}
\labelformat{section}{Section~#1}
\labelformat{subsection}{Section~#1}
\labelformat{subsubsection}{Section~#1}
\labelformat{figure}{\figurename~#1}
\labelformat{equation}{(#1)}
\labelformat{table}{\tablename~#1}

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \labelformat{chapter}{\appendixname~##1}
  \labelformat{section}{\appendixname~##1}
  \labelformat{subsection}{\appendixname~##1}
 }

% don't let figures float away from their own section 
\RequirePackage[section,above,below]{placeins}

% allow for SubFigures
\RequirePackage[format=hang, justification=raggedright]{subfig}
\labelformat{subfigure}{\figurename~\thefigure#1}


% %% ------------------------------------------------------------------- %%
% %% Make better internal links
% %% ------------------------------------------------------------------- %%

\RequirePackage[pdfpagelabels]{hyperref}

\renewcommand{\hyperref}[2][???]{\autoref{#1}}
\def\chapterautorefname{Chapter}
\def\sectionautorefname{Section}
\def\subsectionautorefname{Subsection}
\def\equationautorefname{Equation}


%% ------------------------------------------------------------------- %%
%% These additions are made to make the template play nice with pandoc
%% ------------------------------------------------------------------- %%
\RequirePackage{fancyvrb}
\RequirePackage{framed}
\RequirePackage{xcolor}

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\let\iint=\relax
\let\iiint=\relax
\let\iiiint=\relax
\let\idotsint=\relax

\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}\linespread{1}\normalfont\ttfamily}

\definecolor{shadecolor}{RGB}{248,248,248}
\newenvironment{Shaded}{\begin{snugshade}}{\end{snugshade}}

\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}
\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}
\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\CharTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\StringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\ImportTok}[1]{#1}
\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{#1}}}
\newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\CommentVarTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\OtherTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{#1}}
\newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}
\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.81,0.36,0.00}{\textbf{#1}}}
\newcommand{\BuiltInTok}[1]{#1}
\newcommand{\ExtensionTok}[1]{#1}
\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{#1}}}
\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.77,0.63,0.00}{#1}}
\newcommand{\RegionMarkerTok}[1]{#1}
\newcommand{\InformationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\WarningTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\AlertTok}[1]{\textcolor[rgb]{0.94,0.16,0.16}{#1}}
\newcommand{\ErrorTok}[1]{\textcolor[rgb]{0.64,0.00,0.00}{\textbf{#1}}}
\newcommand{\NormalTok}[1]{#1}


% ----- For Including Graphics -----
\RequirePackage{graphicx}
