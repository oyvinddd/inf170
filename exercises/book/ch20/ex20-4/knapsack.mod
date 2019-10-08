# Exercise 20-4 - Knapsack Problem

# a)

set OBJECTS;

param weight {OBJECTS} > 0;
param value {OBJECTS} > 0;

param w_limit >= 0;

var X {OBJECTS} binary; # binary decision variable (1 = choose item, else 0)

maximize Total_Value: sum {o in OBJECTS} X[o] * value[o];

subject to Max_Weight: sum {o in OBJECTS} X[o] * weight[o] <= w_limit;

# Optimum is 2050 (choosing items a, d, i and j)
# (solver: cplex)