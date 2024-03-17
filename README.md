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
### Data Flow Chart & Linkage Table (Unit of Analysis - Household Members)
The table serves as a Data Flow Chart and Linkage Table for the dataset, focusing on household members as the unit of analysis. It includes identification variables such as `hhcode`, which identifies a household, and `idc`, which identifies a member within that household. These variables are essential for linking and integrating data across different sections.
| SNo. | Title                                                                    | Section | Identification Variables|
|------|--------------------------------------------------------------------------|---------|---------|
| 1    | Household Roster (List Of Household Members)                             | B - 1   |hhcode + idc|
| 2    | Migration And Functional Limitation (Disability (All Household Members)) | B - 2   |hhcode + idc|
| 3    | Education (All Male & Females And Children 3 Years & Older)              | C - 1   |hhcode + idc|
| 4    | Information Communication Technology (All Members)                       | C - 2   |hhcode + idc|
| 5    | Health (All Household Members)                                           | D       |hhcode + idc|
| 6    | Employment And Income (All Males And Females 10 Year Of Age And Older)   | E       |hhcode + idc|
| 7    | Vaccination And Diarrhoea (Children Under 5 Years Of Age)                | I       |hhcode + idc|
| 8    | Pre And Post-Natal Care (All Ever Married Women Aged 15 - 49)            | J       |hhcode + idc|

Unit of Analysis (Base or Primary file): This column specifies the primary dataset being utilized.
Matched with (Secondary file): This column indicates the secondary dataset to be combined with the primary dataset.
Relationship: Describes the relationship between the primary and secondary datasets.
Resulting data: Specifies the resulting dataset after merging the primary and secondary datasets.

Now, let's consider an example. Suppose we've opened the "Household Roster" dataset in Stata. If we want to combine it with the "Migration & Disability (B-2)" dataset, we'll establish a one-to-one relationship. We'll ensure to include the identification variables, hhcode and idc, to accurately link the datasets. The resulting data will encompass information from both the "Household Roster" and "Migration & Disability (B-2)" datasets, represented as B1 & B2.

| Unit of Analysis (Base or Primary file) | Matched with (Secondary file)          | Relationship | Resulting data |
|-----------------------------------------|----------------------------------------|--------------|----------------|
|                                         | Migration & Disability (B-2)           | 1:1          | B1 & B2        |
| Household Roster (B-1)                  | Education Demographics (C-1)           | 1:1          | B1 & C1        |
|                                         | Information & Technology (C-2)         | 1:1          | B1 & C2        |


The diagram below illustrates the comprehensive flow for creating individual-level master datasets. The cylinders filled with a blue color represent the files mentioned earlier, each serving as primary datasets. On the other hand, the cylinders in a lighter red color depict the resulting datasets obtained after merging the primary datasets.
<img src="https://github.com/ijaazali/pslm2019-20/raw/main/img/data_flow_chart_ind.png" alt="Data Flow Chart" width="900" height="1200">

### Data Flow Chart & Linkage Table (Unit of Analysis - Households)

| SNo. | Title                                                                    | Section |Identification Variables|
|------|--------------------------------------------------------------------------|---------|--------|
| 1    | Household Characteristics (Housing)                                      | F - 1   |hhcode|
| 2    | Household Characteristics (Water Sanitation and Hygiene)                 | F - 2   |hhcode|
| 3    | Household Characteristics (Solid Waste Management)                       | F - 3   |hhcode|
| 4    | Assets in Possession                                                     | G       |hhcode + itc|
| 5    | Selected Durable Items Owned by the Household                            | H       |hhcode + itc|
| 6    | Food Insecurity Experience Scale (FIES)                                   | K       |hhcode|
| 7    | Benefits from Services and Facilities                                     | L       | hhcode + facilities|
