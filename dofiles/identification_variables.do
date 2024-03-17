/*************************************************************
Author : Ijaz Ali
Educatio : Ph.D Candidate in Economics
University : Institute of Business Administration (IBA) 
University Address : University Road, Karachi - 75270 Pakistan 
Purpose: 

**************************************************************/

/*
   This block of code performs the following tasks:
      a. Loads the dataset and checks if 'hhcode' variable exists.
      b. If 'hhcode' variable exists, it:
         - Converts 'hhcode' to numeric format and generates new variables.
         - Drops unnecessary variables.
         - Orders the dataset by specified variables.
         - Labels variables.
         - Orders 'idc' variable.
      c. If 'hhcode' variable does not exist, it prints a message indicating the file name.
*/

// Get a list of all Stata data files in the 'raw' directory

    
    // Load the dataset and check if 'hhcode' variable exists
	capture confirm variable hhcode
    // If 'hhcode' variable exists
    if !_rc {
        
        // Convert 'hhcode' to numeric format and generate new variables
        tostring hhcode, generate(enumeration_block_code) format(%10.0f)
        capture drop hhcode 		
		capture drop psu 
		capture drop province 
		capture drop region 
		capture drop district 
        gen processing_code = substr(enumeration_block_code, 1, 7)
        gen province = substr(enumeration_block_code, 1, 1)
        gen stratum = substr(enumeration_block_code, 2, 2)
        gen region = substr(enumeration_block_code, 4, 1)
        gen prim_samp_unit = substr(enumeration_block_code, 5, 3)
        gen hhno = substr(enumeration_block_code, 8, 2)
        gen district = substr(enumeration_block_code, 1, 3)
        // Order the dataset by specified variables
        order enumeration_block_code processing_code ///
              province stratum district region prim_samp_unit hhno
        rename enumeration_block_code hhcode
		destring hhcode processing_code province stratum district region prim_samp_unit hhno,replace
		format hhcode  %10.0f
		format processing_code  %8.0f
        // Label variables
        label variable hhcode "enumeration block code - EBC (9 digits)"
        label variable processing_code "processing code (7 digits)"
        label variable province "province (position-I EBC)"
        label variable stratum "administrative district (position II-III EBC)"
        label variable region "urban/rural areas (position IV EBC)"
        label variable prim_samp_unit ///
              "enumeration blocks/villages within stratum/sub-stratum - PSU (position V-VII EBC)"
        label variable hhno ///
              "households within PSU of a stratum/sub-stratum (position VIII-IX EBC)"
        label variable district "district"
        label variable idc "serial number of the household (HH) member"
        // Order 'idc' variable
        capture order idc, after(hhno)
        
    }

label define district_lbl 101 "Abbottabad" ///
102 "Bajur" ///
103 "Bannu" ///
104 "Batagram" ///
105 "Bunair" ///
106 "Charsada" ///
107 "Chitral" ///
108 "D. I. Khan" ///
109 "Hangu" ///
110 "Haripur" ///
111 "Karak" ///
112 "Khyber" ///
113 "Kohat" ///
114 "Kohistan" ///
115 "Kurram" ///
116 "Lakki Marwat" ///
117 "Lower Dir" ///
118 "Malakand" ///
119 "Mansehra" ///
120 "Mardan" ///
121 "Mohmand" ///
122 "North Waziristan" ///
123 "Nowshera" ///
124 "Orakzai" ///
125 "Peshawar" ///
126 "Shangla" ///
127 "South Waziristan" ///
128 "Swabi" ///
129 "Swat" ///
130 "Tank" ///
131 "Tor Garh" ///
132 "Upper Dir" ///
201 "Attock" ///
202 "Bahawalnagar" ///
203 "Bahawalpur" ///
204 "Bhakhar" ///
205 "Chakwal" ///
206 "Chiniot" ///
207 "D. G. Khan" ///
208 "Faisalabad" ///
209 "Gujranwala" ///
210 "Gujrat" ///
211 "Hafizabad" ///
212 "Islamabad" ///
213 "Jehlum" ///
214 "Jhang" ///
215 "Kasur" ///
216 "Khanewal" ///
217 "Khushab" ///
218 "Lahore" ///
219 "Layyah" ///
220 "Lodhran" ///
221 "Mandi Bahauddin" ///
222 "Mianwali" ///
223 "Multan" ///
224 "Muzaffar Garh" ///
225 "Nankana Sahib" ///
226 "Narowal" ///
227 "Okara" ///
228 "Pakpattan" ///
229 "Rahim Yar Khan" ///
230 "Rajanpur" ///
231 "Rawalpindi" ///
232 "Sahiwal" ///
233 "Sargodha" ///
234 "Sheikhupura" ///
235 "Sialkot" ///
236 "T.T. Singh" ///
237 "Vehari" ///
301 "Badin" ///
302 "Dadu" ///
303 "Ghotki" ///
304 "Hyderabad" ///
305 "Jacobabad" ///
306 "Jamshoro" ///
307 "Karachi Central" ///
308 "Karachi East" ///
309 "Karachi Malir" ///
310 "Karachi South" ///
311 "Karachi West" ///
312 "Kashmore" ///
313 "Khairpur" ///
314 "Korangi" ///
315 "Larkana" ///
316 "Matiari" ///
317 "Mir Pur Khas" ///
318 "Nowshero Feroze" ///
319 "Sanghar" ///
320 "Shahdadkot" ///
321 "Shaheed Banazir Abad" ///
322 "Shikarpur" ///
323 "Sujawal" ///
324 "Sukkur" ///
325 "Tando Allah Yar" ///
326 "Tando Muhammad Khan" ///
327 "Tharparkar" ///
328 "Thatta" ///
329 "Umer Kot" ///
401 "Awaran" ///
402 "Barkhan" ///
403 "Chagai" ///
404 "Dera Bugti" ///
405 "Duki" ///
406 "Gwadar" ///
407 "Harnai" ///
408 "Jaffarabad" ///
409 "Jhal Magsi" ///
410 "Kachhi/ Bolan" ///
411 "Kalat" ///
412 "Kech/Turbat" ///
413 "Kharan" ///
414 "Khuzdar" ///
415 "Kohlu" ///
416 "Lasbela" ///
417 "Loralai" ///
418 "Mastung" ///
419 "Musa Khel" ///
420 "Nasirabad/ Tamboo" ///
421 "Nushki" ///
422 "Panjgoor" ///
423 "Pishin" ///
424 "Qilla Abdullah" ///
425 "Qilla Saifullah" ///
426 "Quetta" ///
427 "Shaheed Sikandar Abad" ///
428 "Sherani" ///
429 "Sibbi" ///
430 "Sohbatpur" ///
431 "Washuk" ///
432 "Zhob" ///
433 "Ziarat" ///
501 "Bagh" ///
502 "Bhimber" ///
503 "Hattian Bala" ///
504 "Haveli" ///
505 "Kotli" ///
506 "Mirpur" ///
507 "Muzaffarabad" ///
508 "Neelum" ///
509 "Rawalakot/ponch" ///
510 "Sudhnoti" ///
601 "Astore" ///
602 "Biltistan" ///
603 "Diamir" ///
604 "Ghanchi" ///
605 "Ghizer" ///
606 "Gilgit" ///
607 "Hunza" ///
608 "Kharmang" ///
609 "Nagar" ///
610 "Shigar", replace
label values district district_lbl

label define province_lbl 1 "Khyber Pakhtunkhawa" ///
                       2 "Punjab" ///
                       3 "Sindh" ///
                       4 "Balochistan" ///
                       5 "AJ & Kashmir" ///
                       6 "Gilgit-Baltistian", replace
label values province province_lbl

label define region_lbl 1 "Rural" ///
                    2 "Urban", replace
label values region region_lbl