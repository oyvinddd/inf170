# Exercise 2-3 - A manufacturer of soft drinks

# a) and b)


set SUPPLI;
set SUGARS;

param combos {SUGARS,SUPPLI};
param cost {SUPPLI} >= 0;
param min_buy {SUPPLI} >= 0; # b)
param req {SUGARS} >= 0;

var Buy {s in SUPPLI} >= min_buy[s];

minimize Supply_Cost: sum {s in SUPPLI} Buy[s] * cost[s];

subject to Tons {s1 in SUGARS}: 
	sum {s2 in SUPPLI} Buy[s2] * combos[s1,s2] * 0.01 = req[s1];
	# Use factor 0.01 here to get the value in tons
	
# a) Optimum: a cost of 2058.5$ for 60 tons of A, 45.5 tons of F and 61.5 tons of G

# b) By adding a minimum amount of tons to buy of each combo, the cost is increased
# by 35.45$