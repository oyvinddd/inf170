# Model 1.2 - Final version of the simple steel mill model

set PROD;
set STAGE;

param rate {PROD,STAGE}; # tons produced per hour in each stage
param avail {STAGE} >= 0; # hours available in the week in each stage
param profit {PROD}; # profit per ton

param commit {PROD} >= 0; # lower limit on tons sold in week
param market {PROD}; # upper limit on tons sold in week

var Make {p in PROD} >= 0, <= market[p]; # tons produced

# Objective function: total profits from all products
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];

# Constraint: total of hours used by all products may not exceed all hours available
subject to Time {s in STAGE}:
	sum {p in PROD} (1/rate[p,s]) * Make[p] <= avail[s];
