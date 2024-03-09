# Pakistan Social & Living Standards Survey 2019-20 (District Level)
This repository provides a detailed guide on merging all files related to [Pakistan Social & Living Standards Survey 2019-20 (District Level)](https://www.pbs.gov.pk/publication/pakistan-social-and-living-standards-measurement-survey-pslm-2019-20-provincial) using [Stata](https://www.stata.com/). It ensures a reproducible workflow, encompassing everything from obtaining the raw data to preparing the final master dataset—all within Stata.

```latex
\documentclass{article}
\usepackage[a4paper, left=1cm, right=1cm, top=1cm, bottom=1cm]{geometry}
\usepackage{tikz}
\usepackage{array}
\usetikzlibrary{shapes.geometric, arrows}
\usepackage{booktabs}
\usepackage{float}
\begin{document}

\begin{figure}[H]
    \centering
   \tikzset{
    dataset/.style={cylinder, draw, shape aspect=.5, minimum height=3cm, minimum width=2cm, text width=2.8cm, align=center},
    action/.style={rectangle, draw, minimum width=1cm, minimum height=0.8cm},
    arrow/.style={thick,->,>=stealth}
}
\begin{tikzpicture}[node distance=1.5cm]
\node (roster) [dataset] at (-10,9) {\textbf{Household  Roster data (B-1)} \\ \footnotesize{ID: hhcode + idc}};
\node (migration) [dataset] at (-10,5) {\textbf{Migration \&  Disability data (B-2)} \\ \footnotesize{ID: hhcode +  idc}};
\node (education) [dataset] at (-5,3) {\textbf{Education  Demographics data (C-1) } \\ \footnotesize{ID: hhcode +  idc}};
\node (technology) [dataset] at (0,2) {\textbf{Information \&  Technology (C-2)} \\ \footnotesize{ID: hhcode + idc}};
\node (health) [dataset] at (4,-4) {\textbf{Health Status (D)}  \\ \footnotesize{ID: hhcode + idc}};
\node (employment) [dataset] at (-2,-6) {\textbf{Employment \&  Income (E)} \\ \footnotesize{ID: hhcode + idc}};
\node (vaccination) [dataset] at (-7,-8) {\textbf{Vaccination \&  Diarrhea (I)} \\ \footnotesize{ID: hhcode + idc}};
\node (maternal) [dataset] at (-10,-14) {\textbf{Maternal Health (J)} \\ \footnotesize{ID: hhcode + idc}};
%\node (survey) [dataset] at (-1,-9) {\textbf{Survey information} \\ \footnotesize{ID: hhcode + idc}};

\node (mer1) [dataset] at (-5,7) {\textbf{B1-2 data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer2) [dataset] at (0,5) {\textbf{B1-2 C1 data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer3) [dataset] at (4,0) {\textbf{B1-2 C1-2 data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer4) [dataset] at (-2,-2) {\textbf{B1-2 C1-2 D data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer5) [dataset] at (-7,-4) {\textbf{B1-2 C1-2 D E data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer6) [dataset] at (-10,-10.5) {\textbf{B1-2 C1-2 D E I data } \\ \footnotesize{ID: hhcode +  idc}};
\node (mer7) [dataset] at (-2,-12.2) {\textbf{Individual Level Master Data } \\ \footnotesize{ID: hhcode +  idc}};
%\node (mer8) [dataset] at (2.5,-13) {\textbf{Individual Level Master Data } \\ \footnotesize{ID: hhcode +  idc}};

\node (act1) [action] at (-10,7) {\textbf{Merge 1:1}};
\node (act2) [action] at (-5,5) {\textbf{Merge 1:1}};
\node (act3) [action] at (4,3.5) {\textbf{Merge 1:1}};
\node (act4) [action] at (4,-2) {\textbf{Merge 1:1}};
\node (act5) [action] at (-2,-4) {\textbf{Merge 1:1}};
\node (act6) [action] at (-10,-6) {\textbf{Merge 1:1}};
\node (act7) [action] at (-10,-12.2) {\textbf{Merge 1:1}};
%\node (act8) [action] at (-1.5,-11.5) {\textbf{Merge 1:1}};

\draw [arrow] (roster) -- (act1);
\draw [arrow] (migration) -- (act1);
\draw [arrow] (mer1) -- (act2);
\draw [arrow] (education) -- (act2);
\draw [arrow] (mer2) -- (act3);
\draw [arrow] (technology) -- (act3);
\draw [arrow] (mer3) -- (act4);
\draw [arrow] (health) -- (act4);
\draw [arrow] (mer4) -- (act5);
\draw [arrow] (employment) -- (act5);
\draw [arrow] (mer5) -- (act6);
\draw [arrow] (vaccination) -- (act6);
\draw [arrow] (mer6) -- (act7);
\draw [arrow] (maternal) -- (act7);
%\draw [arrow] (mer7) -- (act8);
%\draw [arrow] (survey) -- (act8);

\draw [arrow] (act1) -- (mer1);
\draw [arrow] (act2) -- (mer2);
\draw [arrow] (act3) -- (mer3);
\draw [arrow] (act4) -- (mer4);
\draw [arrow] (act5) -- (mer5);
\draw [arrow] (act6) -- (mer6);
\draw [arrow] (act7) -- (mer7);
%\draw [arrow] (act8) -- (mer8);
\end{tikzpicture}
\caption{Data Flow Chart (Unit of Analysis - Household Members)}
\end{figure}

\begin{table}[H]
    \centering
    \caption{Data Relationship for Merging}
\setlength{\extrarowheight}{10pt} % Adjust the value as needed
    \begin{tabular}{|c|l|c|l|}
\toprule
\textbf{Unit of Analysis (Base or Primary file)} & \textbf{Matched with (Secondary file)} & \textbf{Relationship}& \textbf{Resulting data} \\ \midrule
 & Migration \&  Disability (B-2) & 1:1 & B1 \& B2\\ 
Household  Roster (B-1)	& Education  Demographics (C-1) & 1:1 & B1 \& C1\\
& Information \&  Technology (C-2) & 1:1 & B1 \& C2\\
\bottomrule
    \end{tabular}
\end{table}
\end{document}
```
