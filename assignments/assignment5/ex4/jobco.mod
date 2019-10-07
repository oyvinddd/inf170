# Assignment 5-4 - Jobco Widgets (ILP)

set I;

var X {I} integer >= 0, <= 600;
var Y {I} binary;

param setup {I} >= 0;
param production {I} >= 0;
param cap {I} >= 0;


maximize Total_Cost: 
sum {i in I} X[i] * production[i] - sum {i in I} Y[i] * setup[i];

subject to Demand: sum {i in I} X[i] = 2000;
subject to Setup {i in I}: X[i] <= Y[i] * 1000;
