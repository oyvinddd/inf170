# Exercise 2-1

set FOOD;
set NUTR;

param amt {NUTR,FOOD} >= 0;
param cost {FOOD} >= 0;
param min_n {NUTR} >= 0;

var Buy {FOOD} >= 0;

minimize Total_Cost: sum {f in FOOD} Buy[f] * cost[f];

subject to Min_Nutr {n in NUTR}: sum {f in FOOD} Buy[f] * amt[n,f] >= min_n[n];