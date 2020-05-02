// ** Benchmark regression **
// the augmented gravity model, estimated with ordinary least squares, year fixed effects, and robust standard errors over the full sample.

// Benchmark
use "./data4web.dta"
reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, vce(cluster pairid)
clear

// Robustness Check

// No Industrial Countries
use "./data4web.dta"
keep if cty1>=200 & cty2>=200
reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, vce(cluster pairid)
clear

// Post 1970
use "./data4web.dta"
keep if year>1970
reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, vce(cluster pairid)
clear

// With Country Effects
use "./data4web.dta"
reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year i.pairid, vce(cluster pairid)
clear
// use "./data4web.dta"
// xtset pairid year
// xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, vce(cluster pairid)

// ** Sensitivity Analysis **

// Cross-Sectional Analysis
forvalues i= 1950(5)1995{
	display "year:", `i', 
	display "*****************************"
	use "./data4web.dta"
	keep if year == `i'
	reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, vce(cluster pairid)
	clear
}

// Random-effects(GLS) Estimator and Fixed-effects (within) Estimator
use "./data4web.dta"
xtset pairid year
xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp, re vce(cluster pairid)
xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp, fe vce(cluster pairid)
clear

// Random-effects(GLS) Estimator with Years and Fixed-effects (within) Estimator with Years
use "./data4web.dta"
xtset pairid year
xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, re vce(cluster pairid)
xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, fe vce(cluster pairid)
clear

