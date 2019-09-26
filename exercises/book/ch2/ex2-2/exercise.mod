# Exercise 2-2

# a) and b)

set EXERC; # all exercises
set R within EXERC; # b) - restricted-time exercises

param calories {EXERC};
param tolerance {EXERC};
param min_req {EXERC};

param min_cals >= 0;
param max_r >= 0; # b)

var Do {e in EXERC} >= min_req[e], <= tolerance[e];

minimize Time: sum {e in EXERC} Do[e] * tolerance[e];

subject to Calories: sum {e in EXERC} Do[e] * calories[e] >= min_cals;
subject to Limit: sum {r in R} Do[r] <= max_r; # b)

# For a)
# Optimum: 17.75 hours of exercise each week
# (for integer precision, objective is 20 hours)

# For b)
# Optimum: 23.75 hours of exercise each week
