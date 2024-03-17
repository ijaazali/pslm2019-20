/*************************************************************
Author : Ijaz Ali
Educatio : Ph.D Candidate in Economics
University : Institute of Business Administration (IBA) 
University Address : University Road, Karachi - 75270 Pakistan 
Purpose: install necessary packages

**************************************************************/

// Loop through each package in the list
foreach package in estout fre {
    // Check if the package is already installed
    capture which `package'
    // If the package is not found, install it from SSC
    if _rc == 111 ssc install `package'
}
