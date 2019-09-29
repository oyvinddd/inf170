# Knapsack problem from lecture slides

set I;

param value {I} >= 0;
param weight {I} >= 0;

param max_weight = 15;

var Chose {I} binary;

maximize Value: sum {i in I} Chose[i] * value[i];

subject to Max_Weight: sum {i in I} Chose[i] * weight[i] <= max_weight; 