use "./data4web.dta"

// Benchmark regression
// the augmented gravity model, estimated with ordinary least squares, year fixed effects, and robust standard errors over the full sample.
reg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, robust

xtset pairid year
xtreg ltrade ldist lrgdp lrgdppc comlang border landl island lareap comcol curcol colony comctry custrict regional bothin onein gsp i.year, robust
