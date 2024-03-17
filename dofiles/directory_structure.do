
/*************************************************************
Author : Ijaz Ali
Educatio : Ph.D Candidate in Economics
University : Institute of Business Administration (IBA) 
University Address : University Road, Karachi - 75270 Pakistan 
Purpose: Folder Organization
**************************************************************/


/*
* The below loop organizes the folder structure by creating directories
	and subdirectories as needed. 
* Adjustments can be made according to your specific project requirements.
*/

foreach subdir1 in data outputs documentation dofiles {
    // Display the current subdirectory
    display "`subdir1'"

    // Check if the current subdirectory is "data"
    if "`subdir1'" == "data" {
        // Create the "data" directory, and 
		//its subdirectories if they don't exist
        cap mkdir "${rootpath}/`subdir1'"
        foreach subdirl2 in raw intermediate final {
            cap mkdir "${rootpath}/`subdir1'/`subdirl2'"
        }
    }
    / Check if the current subdirectory is "outputs"
    else if "`subdir1'" == "outputs" {
        // Create the "outputs" directory, and 
		//its subdirectories if they don't exist
        cap mkdir "${rootpath}/`subdir1'"
        foreach subdirl2 in graphs maps tables {
            cap mkdir "${rootpath}/`subdir1'/`subdirl2'"
        }
    }
    // Check if the current subdirectory is "documentation"
    else if "`subdir1'" == "documentation" {
        // Create the "documentation" directory if it doesn't exist
        cap mkdir "${rootpath}/`subdir1'"
    }
    // Check if the current subdirectory is "dofiles"
    else if "`subdir1'" == "dofiles" {
        // Create the "dofiles" directory if it doesn't exist
        cap mkdir "${rootpath}/`subdir1'"
    }
}




