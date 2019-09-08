# Exercise 2-3 - A manufacturer of soft drinks

# c)


set SUPPLI;
set SUGARS;

param combos {SUGARS,SUPPLI};
param cost {SUPPLI} >= 0;
param req {SUGARS} >= 0;
param min_buy {SUPPLI};

var Buy {s in SUPPLI} >= 0;

minimize Supply_Cost: sum {s in SUPPLI} Buy[s] * cost[s];

# minimum percentage of each sugar should be 30%
subject to Min_sugar {s1 in SUGARS}: 
	sum {s2 in SUPPLI} Buy[s2] * combos[s1,s2] >= 30;

# maximum percentage of each sugar should be 37%
subject to Max_sugar {s1 in SUGARS}: 
	sum {s2 in SUPPLI} Buy[s2] * combos[s1,s2] <= 37;

# the sum of all combos should be 1 ton
subject to Ton: sum {s in SUPPLI} Buy[s] = 1;

# Optimum: 12.25$ is the lowest price possible for a ton
# in the case that each sugar needs to be within 30% and 37%