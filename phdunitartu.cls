\NeedsTeXFormat{LaTeX2e}[2018/04/01]
\ProvidesClass{phdunitartu}[2026/11/25 v1.6 Maintained formatting interfaces]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[a4paper,11pt]{report}

% Adapted from the UniTartu PhD template by Reimo Palm and contributors.
% See README.md for provenance.

%%% Packages
\RequirePackage{graphicx}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{url}
\RequirePackage[explicit,nostruts,newparttoc]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{enumitem}
\RequirePackage{gettitlestring}

%%% Utilities

%% Validate the existing thesis-type API once, then use a boolean.
\newif\ifphdunitartu@collection
\newcommand{\ThesisType}[1]{%
  \ifthenelse{\equal{#1}{MONOGRAPH}}{\phdunitartu@collectionfalse}{%
    \ifthenelse{\equal{#1}{COLLECTION}}{\phdunitartu@collectiontrue}{%
      \ClassError{phdunitartu}{Unknown thesis type `#1'}%
        {Use \string\ThesisType{MONOGRAPH} or \string\ThesisType{COLLECTION}.}%
    }%
  }%
}
\ThesisType{MONOGRAPH}
\DeclareRobustCommand{\IfThesisTypeIsCollection}[2]{%
  \ifphdunitartu@collection #1\else #2\fi
}

%% Metadata: preferred setters share the thesis prefix. Legacy names are aliases.
\newcommand{\thesisseriesname}[1]{\def\phdunitartu@dissertationseriesname{#1}}
\newcommand{\thesisseriesnumber}[1]{\def\phdunitartu@dissertationseriesnumber{#1}}
\newcommand{\thesisissn}[1]{\def\phdunitartu@ISSN{#1}}
\newcommand{\thesisisbnprint}[1]{\def\phdunitartu@ISBNA{#1}}
\newcommand{\thesisisbnpdf}[1]{\def\phdunitartu@ISBNB{#1}}
\newcommand{\thesisinstitute}[1]{\def\phdunitartu@inst{#1}}
\newcommand{\thesisfaculty}[1]{\def\phdunitartu@faculty{#1}}
\newcommand{\thesisuniversity}[1]{\def\phdunitartu@affiliation{#1}}
\newcommand{\thesisfield}[1]{\def\phdunitartu@thesisfield{#1}}
\newcommand{\thesisaccepted}[1]{\def\phdunitartu@commencementdate{#1}}
\newcommand{\thesisdefencedate}[1]{\def\phdunitartu@defensedate{#1}}
\newcommand{\thesisdefencetime}[1]{\def\phdunitartu@defensetime{#1}}
\newcommand{\thesisdefencevenue}[1]{\def\phdunitartu@defenseloc{#1}}
\newcommand{\thesisyear}[1]{\def\phdunitartu@year{#1}}
\newcommand{\thesisdegree}[1]{\def\phdunitartu@degree{#1}}
\newcommand{\thesisfunding}[1]{\def\phdunitartu@funding{#1}}
\let\dissertationseriesname\thesisseriesname
\let\dissertationseriesnumber\thesisseriesnumber
\let\ISSN\thesisissn
\let\ISBNPRINT\thesisisbnprint
\let\ISBNPDF\thesisisbnpdf
\let\institute\thesisinstitute
\let\faculty\thesisfaculty
\let\affiliation\thesisuniversity
\let\commencementdate\thesisaccepted
\let\defensedate\thesisdefencedate
\let\defensetime\thesisdefencetime
\let\defenseloc\thesisdefencevenue
\let\fundingstatement\thesisfunding

% Empty fallbacks only. Editable sample values/placeholders live in metadata.tex.
\thesisseriesname{}\thesisseriesnumber{}
\thesisissn{}\thesisisbnprint{}\thesisisbnpdf{}
\thesisinstitute{}\thesisfaculty{}\thesisuniversity{}
\thesisfield{}\thesisaccepted{}
\thesisdefencedate{}\thesisdefencetime{}\thesisdefencevenue{}
\thesisyear{}\thesisdegree{}\thesisfunding{}

% Public access to metadata when customising title-page sentences.
\def\phdunitartu@value@author{\@author}
\def\phdunitartu@value@title{\@title}
\def\phdunitartu@value@year{\phdunitartu@year}
\def\phdunitartu@value@degree{\phdunitartu@degree}
\def\phdunitartu@value@field{\phdunitartu@thesisfield}
\def\phdunitartu@value@institute{\phdunitartu@inst}
\def\phdunitartu@value@faculty{\phdunitartu@faculty}
\def\phdunitartu@value@university{\phdunitartu@affiliation}
\def\phdunitartu@value@accepted{\phdunitartu@commencementdate}
\def\phdunitartu@value@defencedate{\phdunitartu@defensedate}
\def\phdunitartu@value@defencetime{\phdunitartu@defensetime}
\def\phdunitartu@value@defencevenue{\phdunitartu@defenseloc}
\def\phdunitartu@value@seriesname{\phdunitartu@dissertationseriesname}
\def\phdunitartu@value@seriesnumber{\phdunitartu@dissertationseriesnumber}
\def\phdunitartu@value@issn{\phdunitartu@ISSN}
\def\phdunitartu@value@isbnprint{\phdunitartu@ISBNA}
\def\phdunitartu@value@isbnpdf{\phdunitartu@ISBNB}
\newcommand{\thesisvalue}[1]{%
  \ifcsname phdunitartu@value@#1\endcsname
    \csname phdunitartu@value@#1\endcsname
  \else
    \ClassError{phdunitartu}{Unknown metadata value `#1'}%
      {See the metadata value names in README.md.}%
  \fi
}

% Title-page language. Override any of these keys from metadata.tex.
\newcommand{\phdunitartu@titletext}[1]{\csname phdunitartu@text@#1\endcsname}
\newcommand{\thesistitlepagetext}[2]{%
  \ifcsdef{phdunitartu@text@#1}{\csdef{phdunitartu@text@#1}{#2}}{%
    \ClassError{phdunitartu}{Unknown title-page text key `#1'}%
      {See the supported title-page text keys in README.md.}%
  }%
}
\csdef{phdunitartu@text@place}{Tartu}
\csdef{phdunitartu@text@country}{Estonia}
\csdef{phdunitartu@text@publisher}{University of Tartu Press}
\csdef{phdunitartu@text@publisherlink}{\url{https://tyk.ee/}}
\csdef{phdunitartu@text@supervisor}{Supervisor}
\csdef{phdunitartu@text@supervisors}{Supervisors}
\csdef{phdunitartu@text@opponent}{Opponent}
\csdef{phdunitartu@text@opponents}{Opponents}
\csdef{phdunitartu@text@print}{print}
\csdef{phdunitartu@text@pdf}{PDF}
\csdef{phdunitartu@text@acceptance}{%
  This doctoral thesis was accepted for defending the degree of
  \thesisvalue{degree}%
  \ifdefempty{\phdunitartu@thesisfield}{}{ in \thesisvalue{field}}%
  \space on \thesisvalue{accepted} by the Council of
  the \thesisvalue{institute}, \thesisvalue{university}.%
}
\csdef{phdunitartu@text@defence}{%
  The public defense will take place on \thesisvalue{defencedate}
  at \thesisvalue{defencetime} in \thesisvalue{defencevenue}.%
}
\csdef{phdunitartu@text@copyright}{%
  Copyright \textcopyright\ \thesisvalue{year} by \thesisvalue{author}%
}

% Each preferred person command appends a complete row; no tabular syntax needed.
\newcount\phdunitartu@supervisorcount
\newcount\phdunitartu@opponentcount
\newif\ifphdunitartu@legacysupervisors
\newif\ifphdunitartu@legacyopponents
\def\phdunitartu@supDetail{}
\def\phdunitartu@oppDetail{}
\def\phdunitartu@legacySupTitle{}
\def\phdunitartu@legacyOppTitle{}
\newcommand{\thesissupervisor}[3]{%
  \ifphdunitartu@legacysupervisors
    \ClassError{phdunitartu}{Cannot mix thesissupervisor and addSup}%
      {Use one thesissupervisor command per person.}%
  \else
    \global\advance\phdunitartu@supervisorcount by 1
    \g@addto@macro\phdunitartu@supDetail{{#1} & #2\ifstrempty{#3}{}{, #3}\\}%
  \fi
}
\newcommand{\thesisopponent}[3]{%
  \ifphdunitartu@legacyopponents
    \ClassError{phdunitartu}{Cannot mix thesisopponent and addOpp}%
      {Use one thesisopponent command per person.}%
  \else
    \global\advance\phdunitartu@opponentcount by 1
    \g@addto@macro\phdunitartu@oppDetail{{#1} & #2\ifstrempty{#3}{}{, #3}\\}%
  \fi
}
\def\phdunitartu@supTitle{%
  \ifphdunitartu@legacysupervisors\phdunitartu@legacySupTitle\else
    \ifnum\phdunitartu@supervisorcount>1
      \phdunitartu@titletext{supervisors}\else\phdunitartu@titletext{supervisor}\fi
  \fi
}
\def\phdunitartu@oppTitle{%
  \ifphdunitartu@legacyopponents\phdunitartu@legacyOppTitle\else
    \ifnum\phdunitartu@opponentcount>1
      \phdunitartu@titletext{opponents}\else\phdunitartu@titletext{opponent}\fi
  \fi
}
% Retain the upstream raw-row API, but reject silent replacement/mixed APIs.
\newcommand{\addSup}[2]{%
  \ifnum\phdunitartu@supervisorcount>0
    \ClassError{phdunitartu}{Supervisors are already set}%
      {Use repeated thesissupervisor commands instead of addSup.}%
  \else\ifphdunitartu@legacysupervisors
    \ClassError{phdunitartu}{Repeated addSup would replace supervisors}%
      {Use repeated thesissupervisor commands, or one addSup containing all rows.}%
  \else
    \phdunitartu@legacysupervisorstrue
    \def\phdunitartu@legacySupTitle{#1}\def\phdunitartu@supDetail{#2}%
  \fi\fi
}
\newcommand{\addOpp}[2]{%
  \ifnum\phdunitartu@opponentcount>0
    \ClassError{phdunitartu}{Opponents are already set}%
      {Use repeated thesisopponent commands instead of addOpp.}%
  \else\ifphdunitartu@legacyopponents
    \ClassError{phdunitartu}{Repeated addOpp would replace opponents}%
      {Use repeated thesisopponent commands, or one addOpp containing all rows.}%
  \else
    \phdunitartu@legacyopponentstrue
    \def\phdunitartu@legacyOppTitle{#1}\def\phdunitartu@oppDetail{#2}%
  \fi\fi
}
\newcommand{\phdunitartu@identifiers}{%
  \let\phdunitartu@idseparator\@empty
  \ifdefempty{\phdunitartu@ISSN}{}{%
    ISSN\space\phdunitartu@ISSN\def\phdunitartu@idseparator{\\}}%
  \ifdefempty{\phdunitartu@ISBNA}{}{%
    \phdunitartu@idseparator ISBN\space\phdunitartu@ISBNA\space
    (\phdunitartu@titletext{print})\def\phdunitartu@idseparator{\\}}%
  \ifdefempty{\phdunitartu@ISBNB}{}{%
    \phdunitartu@idseparator ISBN\space\phdunitartu@ISBNB\space
    (\phdunitartu@titletext{pdf})}%
}

%%% Title: the shared layout, with wording supplied by configurable text keys.
\renewcommand*{\maketitle}{%
  \begin{titlepage}
    \def\seriesname{\phdunitartu@dissertationseriesname}
    \def\seriesnumber{\phdunitartu@dissertationseriesnumber}
    \pagestyle{empty}\begingroup\centering\sffamily
    \vbox{\small\MakeUppercase{\seriesname}}
    \vbox{\bfseries\small\seriesnumber}
    \vfill\newpage\null\newpage
    \vbox{\small\MakeUppercase{\seriesname}}
    \vbox{\bfseries\small\seriesnumber}
    \vskip52mm
    \vbox{\bfseries\LARGE\MakeUppercase{\@author}}
    \vskip12mm
    \vbox{\LARGE{\@title}}
    \vfill
    \vbox{\MakeUppercase{\phdunitartu@titletext{place} \phdunitartu@year}}
    \endgroup\newpage
    \begingroup\setlength\parindent{0pt}\setlength\parskip\baselineskip
    \phdunitartu@inst, \phdunitartu@faculty, \phdunitartu@affiliation,
    \phdunitartu@titletext{country}.

    \phdunitartu@titletext{acceptance}

    \emph{\phdunitartu@supTitle}

    \begin{tabular}{@{}p{22mm}p{\dimexpr\textwidth-22mm-2\tabcolsep\relax}@{}}
      \phdunitartu@supDetail
    \end{tabular}

    \emph{\phdunitartu@oppTitle}

    \begin{tabular}{@{}p{22mm}p{\dimexpr\textwidth-22mm-2\tabcolsep\relax}@{}}
      \phdunitartu@oppDetail
    \end{tabular}

    \phdunitartu@titletext{defence}

    \phdunitartu@funding

    \vfill
    \phdunitartu@titletext{copyright}

    \phdunitartu@identifiers

    \phdunitartu@titletext{publisher}\\
    \phdunitartu@titletext{publisherlink}
    \endgroup
    \xdef\phdunitartu@nextpage{\number\numexpr\value{page}+1\relax}
  \end{titlepage}
  \setcounter{page}{\phdunitartu@nextpage}
  \pagestyle{plain}
}

%%% Article records: declared once, rendered as a list and as article pages.
\def\phdunitartu@articles{}
% Arguments: ID, authors, year, title, publication details, contribution, PDF, licence.
\newcommand{\thesisarticle}[8]{%
  \ifblank{#1}{%
    \ClassError{phdunitartu}{An article ID cannot be empty}{Use I, II, III, etc.}%
  }{%
    \ifcsdef{phdunitartu@articleid@#1}{%
      \ClassError{phdunitartu}{Duplicate article ID `#1'}{Give each article a unique ID.}%
    }{%
      \csgdef{phdunitartu@articleid@#1}{}%
      \g@addto@macro\phdunitartu@articles{%
        \phdunitartu@article{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}%
    }%
  }%
}
\newcommand{\phdunitartu@articlecitation}[4]{#1. #2. #3. #4}
\newcommand{\phdunitartu@articlelistentry}[8]{%
  \item[#1.] \phdunitartu@articlecitation{#2}{#3}{#4}{#5}%
  \ifstrempty{#6}{}{\par\textbf{Author contribution:} #6}%
}
\newcommand{\printthesispublicationlist}{%
  \ifdefempty{\phdunitartu@articles}{%
    [Add article records in publications/articles.tex.]%
  }{%
    \begin{enumerate}
      \let\phdunitartu@article\phdunitartu@articlelistentry
      \phdunitartu@articles
    \end{enumerate}%
  }%
}
\newcommand{\phdunitartu@missingarticle}[2]{%
  \chapter*{Article #1: demonstration page}
  [Replace this page by adding your article as \path{#2}.
  No article has been included in this example.]%
}
\newcommand{\phdunitartu@articlepages}[8]{%
  \clearpage\thispagestyle{empty}\phantomsection
  \addcontentsline{toc}{section}{#1. #4}%
  \begin{center}\LARGE\bfseries #1\end{center}
  \vfill
  \noindent\phdunitartu@articlecitation{#2}{#3}{#4}{#5}\par
  \ifstrempty{#8}{}{\noindent #8\par}%
  \vfill\clearpage
  \ifstrempty{#7}{\phdunitartu@missingarticle{#1}{[PDF path]}}{%
    \IfFileExists{#7}{%
      \includepdf[pages=-,pagecommand={\thispagestyle{plain}}]{#7}%
    }{\phdunitartu@missingarticle{#1}{#7}}%
  }%
}
\newcommand{\printthesisarticles}{%
  \begingroup
    \let\phdunitartu@article\phdunitartu@articlepages
    \phdunitartu@articles
  \endgroup
}

%%% Headings
% Use titlesec's public interface instead of copying report/kernel internals.
% Chapters retain the report class's page break before each chapter.
% A page-style part bypasses nameref's standard part hook. Supply its documented
% label-name metadata without replacing any sectioning implementation.
\newcommand{\phdunitartu@parttitle}[1]{%
  \GetTitleString{#1}%
  \global\let\@currentlabelname\GetTitleStringResult
  #1%
}
\titleformat{\part}[display]
  {\centering\normalfont\sffamily\bfseries\Huge}
  {\huge\partname\ \thepart}{20pt}{\phdunitartu@parttitle{#1}}
\titlespacing*{\part}{0pt}{0pt plus 1fil}{0pt plus 1fil}

\newif\ifphdunitartu@appendix
% Retain report's chapter command so hyperref/nameref can use their normal hooks.
\titleformat{\chapter}[block]
  {\centering\normalfont\sffamily\bfseries\Large}
  {\ifphdunitartu@appendix\appendixname\ \fi\thechapter.}{0.5em}
  {\MakeUppercase{#1}}
\titlespacing*{\chapter}{0pt}{-12pt}{10pt}

\titleformat{\section}[block]
  {\centering\normalfont\sffamily\large\bfseries}
  {\thesection.}{0.5em}{#1}
\titlespacing*{\section}{0pt}
  {3.5ex plus 1ex minus .2ex}{1.8ex plus .2ex}

\titleformat{\subsection}[block]
  {\centering\normalfont\sffamily\normalsize\bfseries}
  {\thesubsection.}{0.5em}{#1}
\titlespacing*{\subsection}{\parindent}
  {2.3ex plus .5ex minus .2ex}{1.2ex plus .2ex}

\titleformat{\subsubsection}[runin]
  {\normalfont\normalsize\itshape}
  {\thesubsubsection}{0.5em}{#1.}
\titlespacing{\subsubsection}{\parindent}{\parskip}{0.4em}
\titleformat{\paragraph}[runin]
  {\normalfont\normalsize\itshape}
  {\theparagraph}{0.5em}{#1.}
\titlespacing{\paragraph}{\parindent}{\parskip}{0.4em}
\titleformat{\subparagraph}[runin]
  {\normalfont\normalsize\itshape}
  {\thesubparagraph}{0.5em}{#1.}
\titlespacing{\subparagraph}{\parindent}{\parskip}{0.4em}

\renewcommand{\thesubsubsection}{\alph{subsubsection})}
\renewcommand{\theparagraph}{\arabic{paragraph})}
\renewcommand{\thesubparagraph}{\arabic{paragraph}\alph{subparagraph})}

%%% Appendices
% Keep report's appendix implementation: \thechapter and \ref contain only A, B, ...
% The word "Appendix" belongs in the heading and contents formatting.
\apptocmd{\appendix}{%
  \phdunitartu@appendixtrue
  \counterwithin{equation}{chapter}%
  \setcounter{equation}{0}%
  \titlecontents{chapter}[0pt]{\addvspace{0.8em}\bfseries}
    {\appendixname\ \thecontentslabel.\space}{}
    {\hfill\contentspage}%
}{}{\ClassError{phdunitartu}{Could not configure appendix numbering}%
  {The appendix command must be available from the report class.}}

%%% Lists
% Preserve compact spacing through enumitem rather than replacing \@listi, etc.
\setlist[1]{topsep=2pt plus .5pt minus .5pt,
  partopsep=.5pt plus .5pt minus .5pt,
  parsep=1pt plus .5pt, itemsep=1pt plus .5pt minus .5pt}
\setlist[2]{topsep=2pt plus .5pt minus .5pt,
  partopsep=.5pt plus .5pt minus .5pt,
  parsep=1pt plus .5pt, itemsep=1pt plus .5pt}
\setlist[3]{topsep=1pt plus .5pt minus .5pt,
  partopsep=.5pt plus .5pt, parsep=0pt, itemsep=1pt plus .5pt minus .5pt}

%%% Formulas

% Continuous numbering in the main text; appendix restores per-chapter resets.
\counterwithout{equation}{chapter}
\counterwithout{footnote}{chapter}

%%% Floats

\setlength\abovecaptionskip{4\p@}
\setlength\belowcaptionskip{6\p@}
\renewcommand\topfraction{.9}
\renewcommand\dbltopfraction{.9}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.95}
\setlength\floatsep       {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\textfloatsep   {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\intextsep      {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\dblfloatsep    {4.5\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\dbltextfloatsep{4.5\p@ \@plus 1\p@ \@minus 2\p@}

% Caption formatting is owned by the caption package in phdstyle.sty.
% Use the kernel counter API instead of copying reset-list internals.
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

%%% Table of contents
% Public titletoc configuration; no copied \l@chapter or \numberline definitions.
\setcounter{tocdepth}{2}
\contentsmargin{1.85em}
\titlecontents{part}[0pt]{\addvspace{1em}\large\bfseries}
  {\thecontentslabel.\space}{}{\hfill\contentspage}
\titlecontents{chapter}[0pt]{\addvspace{0.8em}\bfseries}
  {\thecontentslabel.\space}{}{\hfill\contentspage}
\titlecontents{section}[3em]{}
  {\contentslabel[\thecontentslabel.]{2.4em}}
  {\hspace*{-2.4em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{subsection}[5.8em]{}
  {\contentslabel[\thecontentslabel.]{3em}}
  {\hspace*{-3em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{subsubsection}[5.8em]{}
  {\contentslabel[\thecontentslabel.]{1.8em}}
  {\hspace*{-1.8em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{paragraph}[7.3em]{}
  {\contentslabel[\thecontentslabel.]{1.9em}}
  {\hspace*{-1.9em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{subparagraph}[9.9em]{}
  {\contentslabel[\thecontentslabel.]{2.8em}}
  {\hspace*{-2.8em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{figure}[2.9em]{}
  {\contentslabel[\thecontentslabel.]{1.9em}}
  {\hspace*{-1.9em}}{\titlerule*[.6em]{.}\contentspage}
\titlecontents{table}[2.9em]{}
  {\contentslabel[\thecontentslabel.]{1.9em}}
  {\hspace*{-1.9em}}{\titlerule*[.6em]{.}\contentspage}

%%% Main text

\setlength{\parindent}{5mm}
\raggedbottom

% The class always loads its companion style; main.tex needs only documentclass.
\RequirePackage{phdstyle}

\endinput