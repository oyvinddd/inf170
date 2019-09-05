
# minimize cost of food combinations to meet the minimum nutritional requirements
# at least 700% of the daily requirement for each nutritient

set FOOD;
set NUTR;

param cost {FOOD} > 0; # lower bound on the cost of food
param f_min {FOOD} >= 0; # lower bound on the minimum inntake of food
param f_max {j in FOOD} >= f_min[j]; # link the maximum for the corresponding minimum

param n_min {NUTR} >= 0;
param n_max {i in NUTR} >= n_min[i];

param amount {NUTR,FOOD} >= 0;

var Buy {j in FOOD} >= f_min[j], <= f_max[j];

# objective function
minimize Total_Cost:
	sum {j in FOOD} cost[j] * Buy[j];

# diet constraint (<= 700%)
subject to Diet {i in NUTR}:
	n_min[i] <= sum {j in FOOD}  amount[i,j] * Buy[j] <= n_max[i];