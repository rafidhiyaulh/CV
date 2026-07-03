% ----------------------------------------------------------------
%  nextcv.cls  --  ATS-friendly Modular LaTeX CV Template
%  Author: Prasenjit Das (https://www.linkedin.com/in/prasenjit9619/)
%  Helped by: Github Copilot
%  Version: 1.0
%  Date: 2025-08-13
% ----------------------------------------------------------------

\ProvidesClass{nextcv}[2025/08/13 v1.0 ATS-friendly Modular LaTeX CV Template by Prasenjit Das]

% --- Metadata macro (ATS-ready defaults) ---
\newcommand{\cvmeta}[4]{
  \hypersetup{
    pdfauthor={#1},
    pdftitle={#2},
    pdfsubject={#3},
    pdfkeywords={#4},
    % ATS/searchability extras:
    pdflang=en,
    pdftrapped=false,
    pdfcreator={nextcv.cls v1.0 by Prasenjit Das (LaTeX with hyperref)}
  }
}


% --- Base class ---
\LoadClass[a4paper,11pt]{article}

% --- Packages ---
\usepackage{latexsym}
\usepackage[empty]{fullpage}
\usepackage{titlesec}
\usepackage{marvosym}
\usepackage[usenames,dvipsnames]{color}
\usepackage{verbatim}
\usepackage{enumitem}
\usepackage[hidelinks]{hyperref}

\usepackage{fancyhdr}
\usepackage[english]{babel}
\usepackage{tabularx}
\usepackage{fontawesome5}
\usepackage{multicol}
\usepackage{graphicx}
\usepackage[document]{ragged2e}
\usepackage{xcolor}
\usepackage{iftex}
\usepackage{kvoptions}
\usepackage{etoolbox}
\usepackage{fix-cm}


% --- Font theme system ---
\SetupKeyvalOptions{family=NextCV, prefix=NextCV@}
\DeclareStringOption[roboto]{font}
\ProcessKeyvalOptions*

\newcommand{\SelectNextCVFont}[1]{
  \ifPDFTeX
    \RequirePackage[T1]{fontenc}
    \RequirePackage{lmodern}
  \else
    \RequirePackage{fontspec}
    \setmainfont{Latin Modern Roman}
  \fi

  \ifdefstring{#1}{garamond}{
    \ifPDFTeX
      \IfFileExists{ebgaramond.sty}{\RequirePackage{ebgaramond}}{}
    \else
      \IfFontExistsTF{EB Garamond}{\setmainfont{EB Garamond}}{
        \IfFontExistsTF{Garamond}{\setmainfont{Garamond}}{}
      }
    \fi
  }{}

  \ifdefstring{#1}{roboto}{
    \ifPDFTeX
      \IfFileExists{roboto.sty}{
        \RequirePackage[sfdefault]{roboto}
        \renewcommand{\familydefault}{\sfdefault}
      }{}
    \else
      \IfFontExistsTF{Roboto}{
        \setsansfont{Roboto}
        \renewcommand{\familydefault}{\sfdefault}
      }{}
    \fi
  }{}

  \ifdefstring{#1}{robotoslab}{
    \ifPDFTeX
      \IfFileExists{roboto-slab.sty}{\RequirePackage{roboto-slab}}{}
    \else
      \IfFontExistsTF{Roboto Slab}{\setmainfont{Roboto Slab}}{}
    \fi
  }{}

  \ifdefstring{#1}{sourcesans}{
    \ifPDFTeX
      \IfFileExists{sourcesanspro.sty}{
        \RequirePackage[sfdefault]{sourcesanspro}
        \renewcommand{\familydefault}{\sfdefault}
      }{}
    \else
      \IfFontExistsTF{Source Sans 3}{
        \setsansfont{Source Sans 3}
        \renewcommand{\familydefault}{\sfdefault}
      }{
        \IfFontExistsTF{Source Sans Pro}{
          \setsansfont{Source Sans Pro}
          \renewcommand{\familydefault}{\sfdefault}
        }{}
      }
    \fi
  }{}

  \ifdefstring{#1}{lato}{
    \ifPDFTeX
      \IfFileExists{lato.sty}{
        \RequirePackage[defaultsans]{lato}
        \renewcommand{\familydefault}{\sfdefault}
      }{}
    \else
      \IfFontExistsTF{Lato}{
        \setsansfont{Lato}
        \renewcommand{\familydefault}{\sfdefault}
      }{}
    \fi
  }{}

  \ifdefstring{#1}{calibri}{
    \ifPDFTeX
      \IfFileExists{calibri.sty}{
        \RequirePackage[sfdefault]{calibri}
        \renewcommand{\familydefault}{\sfdefault}
      }{
        \IfFileExists{carlito.sty}{
          \RequirePackage[sfdefault]{carlito}
          \renewcommand{\familydefault}{\sfdefault}
        }{}
      }
    \else
      \IfFontExistsTF{Calibri}{
        \setsansfont{Calibri}
        \renewcommand{\familydefault}{\sfdefault}
      }{
        \IfFontExistsTF{Carlito}{
          \setsansfont{Carlito}
          \renewcommand{\familydefault}{\sfdefault}
        }{}
      }
    \fi
  }{}

  \ifdefstring{#1}{cambria}{
    \ifPDFTeX
      \IfFileExists{newtxtext.sty}{\RequirePackage{newtxtext,newtxmath}}{}
    \else
      \IfFontExistsTF{Cambria}{\setmainfont{Cambria}}{
        \IfFontExistsTF{Liberation Serif}{\setmainfont{Liberation Serif}}{}
      }
    \fi
  }{}

  \ifdefstring{#1}{timesnewroman}{
    \ifPDFTeX
      \RequirePackage{newtxtext,newtxmath}
    \else
      \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{
        \IfFontExistsTF{TeX Gyre Termes}{\setmainfont{TeX Gyre Termes}}{}
      }
    \fi
  }{}

  \ifdefstring{#1}{helvetica}{
    \ifPDFTeX
      \RequirePackage[scaled]{helvet}
      \renewcommand{\familydefault}{\sfdefault}
    \else
      \IfFontExistsTF{Helvetica}{
        \setsansfont{Helvetica}
        \renewcommand{\familydefault}{\sfdefault}
      }{
        \IfFontExistsTF{Arial}{
          \setsansfont{Arial}
          \renewcommand{\familydefault}{\sfdefault}
        }{}
      }
    \fi
  }{}

  \ifdefstring{#1}{caladea}{
    \ifPDFTeX
      \IfFileExists{caladea.sty}{\RequirePackage{caladea}}{}
    \else
      \IfFontExistsTF{Caladea}{\setmainfont{Caladea}}{}
    \fi
  }{}
}
\SelectNextCVFont{\NextCV@font}

% --- Page layout ---
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\oddsidemargin}{-0.6in}
\addtolength{\evensidemargin}{-0.5in}
\addtolength{\textwidth}{1.19in}
\addtolength{\topmargin}{-.7in}
\addtolength{\textheight}{1.4in}
\setlength{\footskip}{5pt}
\urlstyle{same}
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

% Allow small emergency stretch to avoid minor overfull boxes across the document
% (helps fix tiny overfull \hbox warnings without changing content)
\emergencystretch=1em


% --- Section formatting ---
\newcommand{\bsc}[1]{\textbf{\scshape{#1}}}

\titleformat{\section}
  {\raggedright\large\color{ACCENT_COLOR}} % heading style
  {}                                        % label
  {0em}                                     % sep between label and title
  {\bsc}                                    % before-code for the title
  [\color{ACCENT_COLOR}\titlerule]          % after-code (rule below)

% Add one baseline (~one line) before and after all \section
\titlespacing*{\section}
  {0pt}            % left indent
  {0.5\baselineskip} % space *before*
  {0.5\baselineskip} % space *after*


% --- PDF accessibility ---
% Some engines (pdfTeX) define \pdfgentounicode; guard its use to avoid
% "Undefined control sequence" errors on engines that don't provide it.
\ifdefined\pdfgentounicode
  \pdfgentounicode=1
\fi

% --- Custom commands ---
\newcommand{\customItem}[1]{\item\small{{#1 \vspace{-2pt}}}}

\newcommand{\customSubHeading}[2]{\vspace{-2pt}\item
  \begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
    \textbf{#1} & \small #2 \\
  \end{tabular*}\vspace{-7pt}
}

\newcommand{\customRoleHeading}[2]{\vspace{-15pt}\item
  \begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
    \textit{\small#1} & \textit{\small #2} \\
  \end{tabular*}\vspace{-5pt}
}

\newcommand{\customProject}[2]{\item
  \begin{tabular*}{0.995\textwidth}{l@{\extracolsep{\fill}}r}
    \small#1 & \small #2\\
  \end{tabular*}\vspace{-7pt}
}

\renewcommand\labelitemi{$\vcenter{\hbox{\tiny$\bullet$}}$}
\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

\newcommand{\customSubHeadingContentStart}{\begin{itemize}[leftmargin=0.0in, label={}]}
\newcommand{\customSubHeadingContentEnd}{\end{itemize}}
\newcommand{\customItemListStart}{\begin{itemize}}
\newcommand{\customItemListEnd}{\end{itemize}\vspace{-5pt}}


% --- Inline list environment with leading bullet ---
% Requires enumitem package
\newlist{inlineitems}{itemize*}{1}
\setlist[inlineitems,1]{
    label={\textbullet\hspace{0.4em}}, % bullet and gap  
    leftmargin=*, 
    itemsep=0pt,
    parsep=0pt,
    topsep=0pt,
    afterlabel=,
}


% --- Color Palette, change at your prefference ---
\definecolor{ACCENT_COLOR}{HTML}{343434}       % Deep navy-charcoal
\definecolor{BODY_TEXT_COLOR}{HTML}{28282B}    % Soft black
\definecolor{LINK_COLOR}{HTML}{005A99}         % Balanced blue

% Apply global body color
\color{BODY_TEXT_COLOR}

% Hyperlink styling
\hypersetup{
  pdflang=en,
  pdftrapped=false,
  pdfcreator={nextcv.cls v1.0 by Prasenjit Das (LaTeX with hyperref)},
  colorlinks  = true,
  linkcolor   = LINK_COLOR,
  urlcolor    = LINK_COLOR,
  filecolor   = LINK_COLOR,
  citecolor   = LINK_COLOR
}


% ----------------------------------------------------------------
%   SILENT PDF BOOKMARKS FOR KEY SECTIONS
% ----------------------------------------------------------------
\newcommand{\cvsectionbookmark}[2]{
  \phantomsection
  \pdfbookmark[#1]{#2}{#2}
}

% Example fixed-section wrappers:
\newcommand{\experienceSection}{
  \cvsectionbookmark{0}{Experience}
  \section*{Experience}
}
\newcommand{\skillsSection}{
  \cvsectionbookmark{0}{Technical Skills}
  \section*{Technical Skills}
}
\newcommand{\educationSection}{
  \cvsectionbookmark{0}{Education}
  \section*{Education}
}

\newcommand{\headerSection}{
  \cvsectionbookmark{0}{Header}
}

\newcommand{\profileSection}{
  \cvsectionbookmark{0}{Profile Statement}
  \section*{Profile Statement}
}

\newcommand{\achievementsSection}{
  \cvsectionbookmark{0}{Awards and Achievements}
  \section*{Awards and Achievements}
}

\newcommand{\researchprojects}{
  \cvsectionbookmark{0}{Research Projects}
  \section*{Research Projects}
}

\newcommand{\projectsSection}{
  \cvsectionbookmark{0}{Projects}
  \section*{Projects}
}

\newcommand{\interestsSection}{
  \cvsectionbookmark{0}{Interests}
  \section*{Interests}
}

\newcommand{\training}{
  \cvsectionbookmark{0}{Training and Workshops}
  \section*{Training and Workshops}
}

\newcommand{\volunteering}{
  \cvsectionbookmark{0}{Volunteering}
  \section*{Volunteering}
}

\newcommand{\onlinecourses}{
  \cvsectionbookmark{0}{Online Courses and Certification}
  \section*{Online Courses and Certification}
}