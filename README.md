# Pakistan Social & Living Standards Survey 2019-20 (District Level)
This repository provides a detailed guide on merging all files related to [Pakistan Social & Living Standards Survey 2019-20 (District Level)](https://www.pbs.gov.pk/publication/pakistan-social-and-living-standards-measurement-survey-pslm-2019-20-provincial) using [Stata](https://www.stata.com/). It ensures a reproducible workflow, encompassing everything from obtaining the raw data to preparing the final master dataset—all within Stata.

## Software package
I have used **Stata 18** for this project, and below  is information about the version of Stata.
```
.  about

Stata/MP 18.0 for Windows (64-bit x86-64)
Revision 14 Feb 2024
Copyright 1985-2023 StataCorp LLC
Stata license: Unlimited-user 2-core network
```
## Data Files
The following outlines sections within the survey, each addressing specific domains such as demographic characteristics, education, health, employment, household assets, household amenities, population welfare, and water supply & sanitation. 

| SNo. | Title                                                                    | Section |
|------|--------------------------------------------------------------------------|---------|
| 1    | Survey Information                                                       | A       |
| 2    | Household Roster (List Of Household Members)                             | B - 1   |
| 3    | Migration And Functional Limitation (Disability (All Household Members)) | B - 2   |
| 4    | Education (All Male & Females And Children 3 Years & Older)              | C - 1   |
| 5    | Information Communication Technology (All Members)                       | C - 2   |
| 6    | Health (All Household Members)                                           | D       |
| 7    | Employment And Income (All Males And Females 10 Year Of Age And Older)   | E       |
| 8    | Household Characteristics (Housing)                                      | F - 1   |
| 9    | Household Characteristics (Water Sanitation And Hygiene)                 | F - 2   |
| 10   | Household Characteristics (Solid Waste Management)                        | F - 3   |
| 11   | Assets In Possession                                                      | G       |
| 12   | Selected Durable Items Owned By The Household                             | H       |
| 13   | Vaccination And Diarrhoea (Children Under 5 Years Of Age)                 | I       |
| 14   | Pre And Post-Natal Care (All Ever Married Women Aged 15 - 49)             | J       |
| 15   | Food Insecurity Experience Scale (Fies)                                   | K       |
| 16   | Benefits From Services And Facilities                                     | L       |




We've divided files based on the Unit of Analysis to combine them. The first set contains files where the unit of analysis can be household members.  Look at the data flow chart for file relationships and the merging flow diagram for further details. 
### Data Flow Chart (Unit of Analysis - Household Members)

| SNo. | Title                                                                    | Section |
|------|--------------------------------------------------------------------------|---------|
| 1    | Household Roster (List Of Household Members)                             | B - 1   |
| 2    | Migration And Functional Limitation (Disability (All Household Members)) | B - 2   |
| 3    | Education (All Male & Females And Children 3 Years & Older)              | C - 1   |
| 4    | Information Communication Technology (All Members)                       | C - 2   |
| 5    | Health (All Household Members)                                           | D       |
| 6    | Employment And Income (All Males And Females 10 Year Of Age And Older)   | E       |
| 7    | Vaccination And Diarrhoea (Children Under 5 Years Of Age)                | I       |
| 8    | Pre And Post-Natal Care (All Ever Married Women Aged 15 - 49)            | J       |




