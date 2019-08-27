# Model 1.2 - Final version of the simple steel mill model

set PROD;

param rate {PROD}; # tons produced per hour
param avail >= 0; # hours available in the week
param profit {PROD}; # profit per ton

param commit {PROD} >= 0; # lower limit on tons sold in week
param market {PROD}; # upper limit on tons sold in week

var Make {p in PROD} >= 0, <= market[p]; # tons produced

# Objective function: total profits from all products
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];

# Constraint: total of hours used by all products may not exceed all hours available
subject to Time: sum {p in PROD} (1/rate[p]) * Make[p] <= avail;
