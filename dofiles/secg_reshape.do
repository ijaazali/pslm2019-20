
use "${data_raw}/secg.dta", clear

forvalues i=1/12 {
	local labels_`i' : label (itc) `i'
	qui levelsof sgaq01 if itc==`i',local(catogories)
	display "`i' `labels_`i'' : `catogories'"
}

forvalues i=1/12 {
	local labels_`i' : label (itc) `i'
	qui levelsof sgaq02 if itc==`i',local(catogories)
	display "`i' `labels_`i'' : `catogories'"
}
replace sgaq02 =. if itc>10
replace sgaq02 =floor( sgaq02) if itc==1

forvalues i=1/12 {
	local labels_`i' : label (itc) `i'
	qui levelsof sgaq04 if itc==`i',local(catogories)
	display "`i' `labels_`i'' : `catogories'"
}

forvalues i=1/12 {
	local labels_`i' : label (itc) `i'
	qui levelsof sgaq05 if itc==`i',local(catogories)
	display "`i' `labels_`i'' : `catogories'"
}

replace sgaq05 =. if itc>10

duplicates report hhcode itc
duplicates drop hhcode itc,force
drop sgaq31 sgaq03_con
ren sgaq0* col_*_itc_
drop province region psu district
reshape wide col_*,i(hhcode) j(itc)

label var col_1_itc_1	///
"does this household possess agriculture land?" 

label var col_1_itc_2	///
"does this household given any land on rent?" 

label var col_1_itc_3	///
"does this household taken any land on rent?" 

label var col_1_itc_4	///
"does this household possess livestock?" 

label var col_1_itc_5	///
"does this household possess sheep or goat?" 

label var col_1_itc_6	///
"does this household possess animals for transportation?" 

label var col_1_itc_7	///
"does this household possess chickens or poultry?" 

label var col_1_itc_8	///
"does the family has non-agriculture land, property or plot?"
 
label var col_1_itc_9	///
"does this household possess residential building?" 

label var col_1_itc_10	///
"does this household possess shop, commercial building?"
 
label var col_1_itc_11	///
"economic situation of the family compared to last year?" 

label var col_1_itc_12	///
"economic situation of the locality/area compared to last year?"



label var col_2_itc_1	///
"gender of owner if agriculture land in possession"

label var col_2_itc_8	///
"gender of owner if non-agriculture land, property or plot in possession"

label var col_2_itc_9	///
"gender of owner if residential building in possession"

label var col_2_itc_10	///
"gender of owner if shop, commercial building in possession"


label var col_3_itc_1	///
"how many acres if agriculture land in possession"

label var col_3_itc_2	///
"how many acres if any land given on rent "

label var col_3_itc_3	///
"how many acres if any land taken on rent"

label var col_3_itc_4	///
"how many number if livestock in possession"

label var col_3_itc_5	///
"how many number if sheep/goat in possession"

label var col_3_itc_6	///
"how many number if animals for transportation in possession"

label var col_3_itc_7	///
"how many number if chickens/poultry in possession"

label var col_3_itc_8	///
"how much sq. yards if non-agriculture land, property or plot in possession"

label var col_3_itc_9 	///
"how much sq. feet if residential building in possession"

label var col_3_itc_10	///
"how much sq. feet if shop, commercial building in possession"



label var col_4_itc_1	///
"current status of agriculture land in possession compared to last year?"

label var col_4_itc_2	///
"current status of land given on rent compared to last year?"

label var col_4_itc_3	///
"current status of land taken on rent compared to last year?"

label var col_4_itc_4	///
"current status of livestock in possession compared to last year?"

label var col_4_itc_5	///
"current status of sheep/goat in possession compared to last year?"

label var col_4_itc_6	///
"current status of animals for transportation in possession compared to last year?"

label var col_4_itc_7	///
"current status of chickens/poultry in possession compared to last year?"

label var col_4_itc_8	///
"current status of non-agriculture land, property or plot in possession compared to last year?"

label var col_4_itc_9	///
"current status of residential building in possession compared to last year?"

label var col_4_itc_10	///
"current status of shop, commercial building in possession compared to last year?"

label var col_4_itc_11	///
"family's economic situation compared to last year?"

label var col_4_itc_12	///
"locality/area economic situation compared to last year?"




label var col_5_itc_1	///
"is most of the land irrigated if agriculture land in possession"

label var col_5_itc_2	///
"is most of the land irrigated if any land given on rent"
 
label var col_5_itc_3	///
"is most of the land irrigated any land taken on rent"

label var col_5_itc_8	///
"type of locality if non-agriculture land, property or plot in possession"

label var col_5_itc_9	///
"type of locality if residential building in possession"

label var col_5_itc_10	///
"type of locality if shop, commercial building in possession"



label var col_6_itc_1	///
"expected price (PKR) if agriculture land in possession"

label var col_6_itc_4	///
"expected price (PKR) if livestock in possession"

label var col_6_itc_5	///
"expected price (PKR) if sheep/goat in possession"

label var col_6_itc_6	///
"expected price (PKR) if animals for transportation in possession"

label var col_6_itc_7	///
"expected price (PKR) if chickens/poultry in possession"

label var col_6_itc_8	///
"expected price (PKR) if non-agriculture land, property or plot in possession"

label var col_6_itc_9	///
"expected price (PKR) if residential building in possession"

label var col_6_itc_10	///
"expected price (PKR) if shop, commercial building in possession"







label define yesno 1 "Yes" 2 "No" , replace

label define genderowner 1 "Male" 2 "Female" 3 "Jointly" 4 "Don't Know" , replace

label define eco_situation 1 "Much worse" ///
                           2 "Slightly worse" ///
                           3 "Like before" ///
                           4 "A little better than before" ///
                           5 "Far better than before" ///
                           6 "Don't know", replace


label define status_comparison 1 "Less than before" ///
                               2 "Same as before" ///
                               3 "Better than before" ///
                               4 "Don't know"

label define trend_comparison 1 "Worse than before" ///
                                 2 "Like before" ///
                                 3 "Better than before" ///
                                 4 "Don't know"
							   

label define land_locality  /// 
	1 "Urban"  ///
	2 "Semi urban" ///
	3 "Rural"	,replace						   


forvalues labels=1/10 {
	if `labels'<4 {
		label values col_1_itc_`labels' col_5_itc_`labels' yesno
		fre col_1_itc_`labels'  col_5_itc_`labels' 
	}
	
	else if `labels'>3 {
	label values col_1_itc_`labels' yesno
	fre col_1_itc_`labels'
}
}


forvalues labels=1/10 {
	if (`labels'==1 | `labels'>7)  {
		label values col_2_itc_`labels' genderowner
		fre col_2_itc_`labels' 
	}
}




label values col_1_itc_11 col_1_itc_12 col_4_itc_11 col_4_itc_12 eco_situation
fre col_1_itc_11 col_1_itc_12 col_4_itc_11 col_4_itc_12

label values col_4_itc_1 col_4_itc_2 col_4_itc_3 /// 
	col_4_itc_4 col_4_itc_5 col_4_itc_6 col_4_itc_7  status_comparison
	
label values col_4_itc_8 col_4_itc_9 col_4_itc_10 trend_comparison


label values  col_5_itc_8 col_5_itc_9 col_5_itc_10 land_locality
						   
drop col_2_itc_2 col_6_itc_2 col_2_itc_3 col_6_itc_3 col_2_itc_4 col_5_itc_4 ///
	col_2_itc_5 col_5_itc_5 col_2_itc_6 col_5_itc_6 col_2_itc_7 col_5_itc_7 ///
	col_2_itc_11 col_3_itc_11 col_5_itc_11 col_6_itc_11 ///
	col_2_itc_12 col_3_itc_12 col_5_itc_12 col_6_itc_12


rename col_1_itc_1 hh_agri_land
rename col_2_itc_1 hh_agri_owner_gender
rename col_3_itc_1 hh_agri_land_acres
rename col_4_itc_1 hh_agri_land_status
rename col_5_itc_1 hh_agri_land_irrigated
rename col_6_itc_1 hh_agri_land_price
rename col_1_itc_2 hh_land_rent
rename col_3_itc_2 hh_land_rent_acres
rename col_4_itc_2 hh_land_rent_status
rename col_5_itc_2 hh_land_rent_irrigated
rename col_1_itc_3 hh_land_taken
rename col_3_itc_3 hh_land_taken_acres
rename col_4_itc_3 hh_land_taken_status
rename col_5_itc_3 hh_land_taken_irrigated
rename col_1_itc_4 hh_livestock
rename col_3_itc_4 hh_livestock_number
rename col_4_itc_4 hh_livestock_status
rename col_6_itc_4 hh_livestock_price
rename col_1_itc_5 hh_sheep_goat
rename col_3_itc_5 hh_sheep_goat_number
rename col_4_itc_5 hh_sheep_goat_status
rename col_6_itc_5 hh_sheep_goat_price
rename col_1_itc_6 hh_trans_animals
rename col_3_itc_6 hh_trans_animals_number
rename col_4_itc_6 hh_trans_animals_status
rename col_6_itc_6 hh_trans_animals_price
rename col_1_itc_7 hh_chick_poultry
rename col_3_itc_7 hh_chick_poultry_number
rename col_4_itc_7 hh_chick_poultry_status
rename col_6_itc_7 hh_chick_poultry_price
rename col_1_itc_8 hh_non_agri_property
rename col_2_itc_8 hh_non_agri_owner_gender
rename col_3_itc_8 hh_non_agri_property_area
rename col_4_itc_8 hh_non_agri_property_status
rename col_5_itc_8 hh_non_agri_property_locality
rename col_6_itc_8 hh_non_agri_property_price
rename col_1_itc_9 hh_res_building
rename col_2_itc_9 hh_res_owner_gender
rename col_3_itc_9 hh_res_building_area
rename col_4_itc_9 hh_res_building_status
rename col_5_itc_9 hh_res_building_locality
rename col_6_itc_9 hh_res_building_price
rename col_1_itc_10 hh_shop_commercial
rename col_2_itc_10 hh_shop_owner_gender
rename col_3_itc_10 hh_shop_commercial_area
rename col_4_itc_10 hh_shop_commercial_status
rename col_5_itc_10 hh_shop_commercial_locality
rename col_6_itc_10 hh_shop_commercial_price
rename col_1_itc_11 fam_eco_status
rename col_4_itc_11 fam_eco_status_comparison
rename col_1_itc_12 loc_eco_status
rename col_4_itc_12 loc_eco_status_comparison

save "${data_intermediate}/secg_reshaped.dta", replace