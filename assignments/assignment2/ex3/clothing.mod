# Assignment 2-3 - Clothing company

set PROD;
set DEPT;

param demand {PROD} >= 0;
param profit {PROD} >= 0;
param penalty {PROD} >= 0;

param capacity {DEPT} >= 0;

param time {DEPT,PROD} >= 0;

var X {PROD} >= 0;
var Y {PROD} >= 0;

maximize Total_Profit: 
	sum {i in PROD} (X[i] * profit[i] - Y[i] * penalty[i]);

subject to Capacity {j in DEPT}: 
	sum {i in PROD} X[i] * time[j,i] <= capacity[j];

subject to Demand {i in PROD}: X[i] + Y[i] = demand[i];