# Exercise 3-2 - A small manufactoring operation

# a)

set ORIG; # machines
set DEST; # parts

param supply {ORIG} >= 0; # capacity
param supply_t {ORIG} >= 0; # c)
param demand {DEST} >= 0; # required
param cost {ORIG,DEST} >= 0; # cost
param time {ORIG,DEST} >= 0; # c)

# The amount of each part to make
var Trans {ORIG,DEST} >= 0;

# Check that total supply is at least the amount of the demand
check: sum {i in ORIG} supply[i] >= sum {j in DEST} demand[j];

# Objective is to minimize the total cost to make all the required parts
minimize Total_Cost:
	sum {i in ORIG,j in DEST} Trans[i,j] * cost[i,j];
	
# Make sure that the capacity of the machine is not exceeded
subject to Supply {i in ORIG}:
	sum {j in DEST} Trans[i,j] <= supply[i];

# Make sure that the the required amount of each part is made
subject to Demand {j in DEST}:
	sum {i in ORIG} Trans[i,j] >= demand[j];
	
# Optimum cost: 260$

# b) The total cost is reduced by 20$

# c)
# Since producing one part now takes a certain amount of hours,
# we need to multiply the production time with the number of products
# to make in the constraint

#subject to Supply {i in ORIG}:
#	sum {j in DEST} Trans[i,j] * time[i,j] <= supply_t[i];
	
# New optimum: 208.18$
	
# d)

#minimize Total_Hours:
#	sum {i in ORIG,j in DEST} Trans[i,j] * time[i,j];

# New optimum: 200.81$