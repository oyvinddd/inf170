# GoNuts Model 2 (MILP from lecture slides)

set FACT;
set PROD;

param cap {FACT} >= 0;
param fixed {FACT} >= 0;
param demand {PROD} >= 0;
param cost {PROD,FACT} >= 0;

var X {PROD,FACT} >= 0;
var Y {FACT} integer >= 0; # 1 if plant j is opened, 0 otherwise

minimize Total_Cost: 
	sum {i in PROD,j in FACT} X[i,j] * cost[i,j] + sum {j in FACT} Y[j] * fixed[j];

subject to Capacity {j in FACT}: sum {i in PROD} X[i,j] <= cap[j];

subject to Demand {i in PROD}: sum {j in FACT} X[i,j] >= demand[i];

# If a plant produces product, it is actually opened!
subject to IfThen {j in FACT}: sum {i in PROD} X[i,j] <= Y[j] * cap[j]; 

# Objective: 31850$ (using CPLEX solver)