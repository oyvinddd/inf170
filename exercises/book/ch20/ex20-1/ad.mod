# Exercise 20-1 - Advertising Campaign (ILP)

# a)

set MED;

param audience {MED} >= 0;
param cost {MED} >= 0;
param writers {MED} >= 0;
param artists {MED} >= 0;
param others {MED} >= 0;

param budget >= 0;
param writer_hrs >= 0;
param artist_hrs >= 0;
param other_hrs >= 0;

var X {MED} binary;

maximize Audience: sum {i in MED} X[i] * audience[i];

subject to Budget:
sum {i in MED} X[i] * cost[i] <= budget;

subject to Writer_Hours:
sum {i in MED} X[i] * writers[i] <= writer_hrs;

subject to Artist_Hours:
sum{i in MED} X[i] * artists[i] <= artist_hrs;

subject to Other_Hours:
sum {i in MED} X[i] * others[i] <= other_hrs;

# b) Optimum (using cplex): 600.000 audience reached (using mag + radio + tv)

# Using minos the optimum is 705.000 audience reached (integer limits relaxed)