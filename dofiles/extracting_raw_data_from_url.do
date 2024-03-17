
/*************************************************************
Author : Ijaz Ali
Educatio : Ph.D Candidate in Economics
University : Institute of Business Administration (IBA) 
University Address : University Road, Karachi - 75270 Pakistan 
Purpose: Download the PSLM 2019-20 microdata from 
			the Pakistan Bureau of Statistics website
**************************************************************/


/*
*Copy the PSLM 2019-20 microdata ZIP file from the specified URL to the raw 
data directory. 
*This command downloads the ZIP file containing the PSLM 
2019-20 microdata from the Pakistan Bureau of Statistics website. 
*It then saves it to the "raw" subdirectory within the root path specified by the 
global macro 'rootpath'. 
*Make sure to adjust the URL and paths according to your specific setup.
*/

copy "https://www.pbs.gov.pk/sites/default/files//pslm/publications/pslm_2019_20_microdata/stata_data_pslm_2019_20.zip" "${rootpath}/data/raw/pslm.zip", replace

/*
   This block of code performs the following tasks:
   1. Sets the current directory to the root directory specified by the global macro 'rootpath'.
   2. Unzips the file 'pslm.zip' located in the 'raw' subdirectory of the data directory.
   3. Lists the files in the 'raw' subdirectory of the data directory.
   4. Copies Stata data files from the 'stata data' subdirectory to the 'raw' subdirectory.
   5. Deletes the original zip file and the 'stata data' subdirectory.
   6. Resets the current directory to the original directory.
*/

{
    // Store the original directory, for resetting back
    local dir "`c(pwd)'"
	// Set the current directory to the raw data subdirectory 
    cd "${rootpath}/data/raw"
    
    // Unzip the pslm.zip file and list files in the raw directory
    cap unzipfile "${rootpath}/data/raw/pslm.zip", replace
    cap ls "${rootpath}/data/raw/"
    
    // Copy Stata data files from the 'stata data' subdirectory to the 'raw' subdirectory
    cap local statafiles : dir "${rootpath}/data/raw/stata data" files "*.dta"
    foreach file of local statafiles {
       cap display "`file'"
       cap copy "${rootpath}/data/raw/stata data/`file'" "${rootpath}/data/raw/`file'" , replace
	   cap erase "${rootpath}/data/raw/stata data/`file'"
    }
    
    // Remove the original zip file and the 'stata data' subdirectory
    cap erase "${rootpath}/data/raw/pslm.zip"
    cap rmdir "${rootpath}/data/raw/stata data"
    
    // Reset the current directory to the original directory
    cd `"`dir'"' 
}