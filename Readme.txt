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


01. **Section A &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** SURVEY INFORMATION
02. **Section B - 1 &nbsp; :&nbsp;** HOUSEHOLD ROSTER (LIST OF HOUSEHOLD MEMBERS) 
03. **Section B - 2 &nbsp; :&nbsp;** MIGRATION AND FUNCTIONAL LIMITATION (DISABILITY (ALL HOUSEHOLD MEMBERS)
04. **Section C - 1 &nbsp; :&nbsp;** EDUCATION (ALL MALE & FEMALES AND CHILDREN 3 YEARS & OLDER)
05. **Section C - 2 &nbsp; :&nbsp;** INFORMATION COMMUNICATION TECHNOLOGY (ALL MEMBERS) 
06. **Section D &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** HEALTH (ALL HOUSEHOLD MEMBERS) 
07. **Section E &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** EMPLOYMENT AND INCOME (ALL MALES AND FEMALES 10 YEAR OF AGE AND OLDER) 
08. **Section F - 1 &nbsp; :&nbsp;** HOUSEHOLD CHARACTERISTICS (HOUSING)
09. **Section F - 2 &nbsp; :&nbsp;** HOUSEHOLD CHARACTERISTICS (WATER SANITATION AND HYGIENE) 
10. **Section F - 3 &nbsp; :&nbsp;** HOUSEHOLD CHARACTERISTICS (SOLID WASTE MANAGEMENT)
11. **Section G &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** ASSETS IN POSSESSION
12. **Section H &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** SELECTED DURABLE ITEMS OWNED BY THE HOUSEHOLD 
13. **Section I &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp;** Vaccination And Diarrhoea (Children Under 5 Years Of Age)
14. **Section J &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp;** PRE AND POST-NATAL CARE (ALL EVER MARRIED WOMEN AGED 15 - 49) 
15. **Section K &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** FOOD INSECURITY EXPERIENCE SCALE (FIES) 
16. **Section L &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** BENEFITS FROM SERVICES AND FACILITIES



We've divided files based on the Unit of Analysis to combine them. The first set contains files where the unit of analysis can be household members.  Look at the data flow chart for file relationships and the merging flow diagram for further details. 
### Data Flow Chart (Unit of Analysis - Household Members)

01. **Section B - 1 &nbsp; :&nbsp;** HOUSEHOLD ROSTER (LIST OF HOUSEHOLD MEMBERS) 
02. **Section B - 2 &nbsp; :&nbsp;** MIGRATION AND FUNCTIONAL LIMITATION (DISABILITY (ALL HOUSEHOLD MEMBERS)
03. **Section C - 1 &nbsp; :&nbsp;** EDUCATION (ALL MALE & FEMALES AND CHILDREN 3 YEARS & OLDER)
04. **Section C - 2 &nbsp; :&nbsp;** INFORMATION COMMUNICATION TECHNOLOGY (ALL MEMBERS) 
05. **Section D &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** HEALTH (ALL HOUSEHOLD MEMBERS) 
06. **Section E &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;** EMPLOYMENT AND INCOME (ALL MALES AND FEMALES 10 YEAR OF AGE AND OLDER) 
07. **Section I &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp;** Vaccination And Diarrhoea (Children Under 5 Years Of Age)
08. **Section J &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp;** PRE AND POST-NATAL CARE (ALL EVER MARRIED WOMEN AGED 15 - 49) 