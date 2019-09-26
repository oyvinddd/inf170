# Assignment 2-1 - Acme Manufacturing Company

set MONTH;

param cost {MONTH} >= 0;
param demand {MONTH} >= 0;

var X {MONTH} >= 0; # units produced
var Y {MONTH} >= 0; # inventory

minimize Total_Cost: sum {i in MONTH} X[i] * cost[i] + sum {i in MONTH} Y[i] * 8;

# two sets of variables: number of units produced each month and inventory units left at the end of ech month

# penalty for a month is defined as 8 * [last month's inventory left]

# Demand:
# beginning inventory + production amount - ending inventory [should be equalt to] demand

subject to Demand: sum {i in MONTH} (X[i] - Y[i]) = sum {i in MONTH} demand[i];
