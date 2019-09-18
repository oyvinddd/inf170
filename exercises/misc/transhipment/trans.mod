# This is the transhipment model taken from chapter 15 in the AMPL book

set CITIES;
set LINKS within (CITIES cross CITIES);

param supply {CITIES} >= 0;
param demand {CITIES} >= 0;

param cost {LINKS} >= 0;
param capacity {LINKS} >= 0;

var Ship {(i,j) in LINKS} >= 0, capacity[i,j];

minimize Total_Cost:
	sum {(i,j) in LINKS} cost[i,j] * Ship[i,j];
	
subject to Balance {k in CITIES}:
	supply[k] + sum {(i,k) in LINKS} Ship[i,k] = demand[k] + sum {(k,j) in LINKS} Ship[k,j]