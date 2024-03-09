# Pakistan Social & Living Standards Survey 2019-20 (District Level)
This repository provides a detailed guide on merging all files related to [Pakistan Social & Living Standards Survey 2019-20 (District Level)](https://www.pbs.gov.pk/publication/pakistan-social-and-living-standards-measurement-survey-pslm-2019-20-provincial) using [Stata](https://www.stata.com/). It ensures a reproducible workflow, encompassing everything from obtaining the raw data to preparing the final master dataset—all within Stata.
```{tikz}
\node (roster) [dataset] at (-10,9) {\textbf{Household Roster data (B-1)} \\ \footnotesize{ID: hhcode + idc}};
\node (migration) [dataset] at (-10,5) {\textbf{Migration & Disability data (B-2)} \\ \footnotesize{ID: hhcode + idc}};
\node (education) [dataset] at (-5,3) {\textbf{Education Demographics data (C-1) } \\ \footnotesize{ID: hhcode + idc}};
\node (technology) [dataset] at (0,2) {\textbf{Information & Technology (C-2)} \\ \footnotesize{ID: hhcode + idc}};
\node (health) [dataset] at (4,-4) {\textbf{Health Status (D)} \\ \footnotesize{ID: hhcode + idc}};
\node (employment) [dataset] at (-2,-6) {\textbf{Employment & Income (E)} \\ \footnotesize{ID: hhcode + idc}};
\node (vaccination) [dataset] at (-7,-8) {\textbf{Vaccination & Diarrhea (I)} \\ \footnotesize{ID: hhcode + idc}};
\node (maternal) [dataset] at (-10,-14) {\textbf{Maternal Health (J)} \\ \footnotesize{ID: hhcode + idc}};

\node (mer1) [dataset] at (-5,7) {\textbf{B1-2 data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer2) [dataset] at (0,5) {\textbf{B1-2 C1 data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer3) [dataset] at (4,0) {\textbf{B1-2 C1-2 data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer4) [dataset] at (-2,-2) {\textbf{B1-2 C1-2 D data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer5) [dataset] at (-7,-4) {\textbf{B1-2 C1-2 D E data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer6) [dataset] at (-10,-10.5) {\textbf{B1-2 C1-2 D E I data} \\ \footnotesize{ID: hhcode + idc}};
\node (mer7) [dataset] at (-2,-12.2) {\textbf{Individual Level Master Data} \\ \footnotesize{ID: hhcode + idc}};

\node (act1) [action] at (-10,7) {\textbf{Merge 1:1}};
\node (act2) [action] at (-5,5) {\textbf{Merge 1:1}};
\node (act3) [action] at (4,3.5) {\textbf{Merge 1:1}};
\node (act4) [action] at (4,-2) {\textbf{Merge 1:1}};
\node (act5) [action] at (-2,-4) {\textbf{Merge 1:1}};
\node (act6) [action] at (-10,-6) {\textbf{Merge 1:1}};
\node (act7) [action] at (-10,-12.2) {\textbf{Merge 1:1}};

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
\end{tikz}
```
