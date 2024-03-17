/*
Author : Ijaz Ali
Educatio : Ph.D Candidate in Economics
University : Institute of Business Administration (IBA) 
University Address : University Road, Karachi - 75270 Pakistan
Purpose : Combine data files associated with 
		  PSLM District Level Survey 2019-20 Microdata
..............................................................................*/


********************************************************************************
*		1. Stata Settings Configuration
********************************************************************************
clear all
capture  log close  _all
set varabbrev  off , permanently			
set more off, permanently
set maxvar 120000


********************************************************************************
*		2. Setting root paths for the project
********************************************************************************
// 2.1 root path 
// Define the root path for the project, a global macro specifying the directory 
// containing all project files, to be adjusted according to your file structure.

global rootpath "C:/Users/Ijaz/Desktop/PSLM"

//2.2 Define paths for different data directories
global data "${rootpath}/data"                     // Main data directory
global data_raw "${data}/raw"                      // Raw data directory
global data_intermediate "${data}/intermediate"    // Intermediate data directory
global data_final "${data}/final"                  // Final data directory

//2.3 Define paths for dofiles
global dofiles "${rootpath}/dofiles"

********************************************************************************
*		3. Folder Organization
********************************************************************************	
	
// This dofile organizes folder structure by creating directories and 
// subdirectories as necessary, with adjustments customizable to project needs.
// You may skip this
	*do "${rootpath}/dofiles/directory_structure.do"
	
	
	
********************************************************************************
*		4. Install packages
********************************************************************************

do "${dofiles}/install_packages.do"	 //install packages
	
	
********************************************************************************
*		5. Download the PSLM 2019-20 microdata ZIP file from the
* 			specified URL to the raw data directory, and unzip the files 
********************************************************************************
	
do "${dofiles}/extracting_raw_data_from_url.do"

********************************************************************************
*		6. Combine files with Unit of Analysis - Household Members
********************************************************************************	





********************************************************************************
*		7. Reshape files with Unit of Analysis - Household Members 
*      (ID: hhcode + itc) and (ID: hhcode + facilities )
********************************************************************************
//7A 1: (ID: hhcode + itc)

do "${dofiles}/secg_reshape.do" //Section G Assets In Possession
do "${dofiles}/sech_reshape.do" //Section H Selected Durable Items Owned By The Household

//7B 2: (ID: hhcode + facilities)
do "${dofiles}/secl_reshape.do" //Section L Benefits From Services And Facilities


********************************************************************************
*		8. Combine files with Unit of Analysis - Household Members (ID: hhcode)
********************************************************************************	






use temp1,clear
foreach file in temp2 secg_reshaped sech_reshaped secl_reshaped{
merge m:1 hhcode using "`file'.dta",nogen
}
save "PSLM2019_20.dta",replace



