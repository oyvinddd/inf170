# Assignment 5-1 - Three Telephone Companies

set TEL;

param cost {TEL} >= 0;
param charge {TEL} >= 0;

var X {TEL} >= 0;
var Y {TEL} binary;

param avg_mins >= 0;

minimize Total_Cost: 
sum {i in TEL} (X[i] * cost[i] + Y[i] * charge[i]);

subject to Usage: 
sum {i in TEL} X[i] = avg_mins;

subject to Charge {i in TEL}: X[i] <= Y[i] * avg_mins;

# Objective: phone bill cost 62$ (only using BabyBell)
