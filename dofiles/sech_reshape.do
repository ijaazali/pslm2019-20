
use "${data_raw}/sech.dta", clear
decode itc,gen(itc_str)
replace itc_str = ustrregexra( itc_str, "oven/","",.)
replace itc_str = ustrregexra( itc_str, "\s|\/","_",.)
drop province region psu district itc code
ren c02 quant_
reshape wide quant_*,i(hhcode) j( itc_str) string

foreach var of var quant* {
local new_name=subinstr(subinstr("`var'","quant_","",.),"_"," ",.)
label var `var' "quantity of `new_name'"
}

levelsof itc, local(itc_num)
local counter : word count `itc_num'
levelsof itc, local(itc_num)
local counter : word count `itc_num'
forvalues ithlabel=1/`counter'{
	local labels_`ithlabel' : label (itc) `ithlabel'
	di "[`ithlabel'] `labels_`ithlabel'' :" strlen("`labels_`ithlabel''")
}

levelsof itc, local(itc_num)
local counter : word count `itc_num'
mat num_mat=.
forvalues ithlabel=1/`counter'{
	local labels_`ithlabel' : label (itc) `ithlabel'
	local curr_num = strlen("`labels_`ithlabel''")
	mat num_mat=num_mat \ `curr_num'
}

save "${data_intermediate}/sech_reshaped.dta", replace