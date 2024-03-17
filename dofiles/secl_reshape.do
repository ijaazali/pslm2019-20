
use "${data_raw}/secl.dta", clear

levelsof itc, local(itc_num)
local counter : word count `itc_num'
*local counter_list : subinstr local itc_num " " "," ,all
*di "max: =" as result max(`counter_list') "  min :" as result min(`counter_list') " length : `counter'"
levelsof facilities, local(facilty_num)
local counter : word count `facilty_num'
forvalues ithlabel=1/`counter'{
	local labels_`ithlabel' : label (facilities) `ithlabel'
	di "[`ithlabel'] `labels_`ithlabel'' :" strlen("`labels_`ithlabel''")
}


drop if facilities==0
decode facilities,gen(facilities_str)
replace facilities_str=ustrregexra(facilities_str, " etc", "",.)
replace facilities_str=ustrregexra(facilities_str, "/", "_",.)
replace facilities_str=ustrregexra(facilities_str, "\s", "_",.)

drop psu province region district facilities
ren slq* s*
reshape wide s*,i(hhcode) j(facilities_str) string

foreach var of var s1*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s1","",.), "_"," ",.)
	label var `var'	"how many times did you use `new_nam' service usually"
}
	
foreach var of var s2*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s2","",.), "_"," ",.)
	label var `var'	"reason for not using `new_nam' service at all/once in a while"
}
	
foreach var of var s3*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s3","",.), "_"," ",.)
	label var `var'	"are you satisfied with quality of `new_nam' service"
}
	

foreach var of var s4*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s4","",.), "_"," ",.)
	label var `var'	"type of change in the `new_nam' service during the last 12 months"
}
		

foreach var of var s5*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s5","",.), "_"," ",.)
	label var `var'	"distance to `new_nam' service in km "
}


foreach var of var s6*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s6","",.), "_"," ",.)
	label var `var'	"mode of transport `new_nam' service"
}


foreach var of var s7*{
	local new_nam= ustrregexra(ustrregexra("`var'", "s7","",.), "_"," ",.)
	label var `var'	"time to reach `new_nam' service"
}			

save "${data_intermediate}/secl_reshaped.dta", replace