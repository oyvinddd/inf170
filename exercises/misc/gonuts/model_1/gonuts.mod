# GoNuts Model 1 (MILP from lecture slides)

set FACT;
set PROD;

param cap {FACT} >= 0;
param demand {PROD} >= 0;
param cost {PROD,FACT} >= 0;

var X {PROD,FACT} >= 0;

minimize Total_Cost: sum {i in PROD,j in FACT} X[i,j] * cost[i,j];

subject to Capacity {j in FACT}: sum {i in PROD} X[i,j] <= cap[j];

subject to Demand {i in PROD}: sum {j in FACT} X[i,j] >= demand[i];

# Objective: 22637.5$