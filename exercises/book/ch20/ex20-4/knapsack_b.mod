# Exercise 20-4 - Knapsack Problem

# b)

set OBJECTS;
set KNSACKS;

param weight {OBJECTS} > 0;
param value {OBJECTS} > 0;

param w_limit >= 0;
param knapsacks > 0 integer;

var X {OBJECTS,KNSACKS} binary;

# Select items to maximize the value
maximize Total_Value: 
sum {o in OBJECTS,k in KNSACKS} X[o,k] * value[o];

# Don't exceed the knapsack weight
subject to Max_Weight {k in KNSACKS}:
sum {o in OBJECTS} X[o,k] * weight[o] <= w_limit;

# Items can only be used one time
subject to Single_Use {o in OBJECTS}:
sum {k in KNSACKS} X[o,k] <= 1;

# Optimum: 2050 (solution doesn't change from (a))