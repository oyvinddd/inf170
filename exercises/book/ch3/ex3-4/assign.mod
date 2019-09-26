# Exercise 3-4, Assigning people to rooms - Assignment model (a variation on the transportation model)

set ORIG; # people are origins
set DEST; # rooms are destinations

param supply {ORIG} >= 0;
param demand {DEST} >= 0;

check: sum {i in ORIG} supply[i] = sum {j in DEST} demand[j];

param cost {ORIG,DEST} >= 0;

var Trans {ORIG,DEST} >= 0;

minimize Total_Cost: sum {i in ORIG,j in DEST} cost[i,j] * Trans[i,j];

subject to Supply {i in ORIG}: sum {j in DEST} Trans[i,j] = supply[i];

subject to Demand {j in DEST}: sum {i in ORIG} Trans[i,j] = demand[j];

# a)

# Initial objective is 28 (without reordering the list of people)
# Solver doesn't seem to find any other optimal solutions by only
# reordering the destinations. Ordering the origins will make the
# solution be different (but with the same value).

# b)

# When setting all numbers >= 6 to 99, the optimal value did not
# change, but 5 became the lowest rank. Setting all number >= 4
# to 99, made the value of the objective function go up to 120
# since now, one person got a room which was ranked 99. This tells
# me that there does not exist a combo of people and rooms in which
# every person gets a room which he/she scores lower or equal to 4.

# c)

# Two acommodate for these changes I did the following:
#	- added a weight of 20 to each of the three rooms that allows two people
#	- set the unavailable rooms to 0 in the demand parameter
#	- set the rooms that allows two people to 2 in the demand parameter
# The new optimal value for this situation is 153 (with a total of 6
# people sharing a room)

# d)

# To model seniority we could add another parameter on the origin with
# weights for each person (lower values are higher seniority). Then,
# we could factor this in to the objective function like so:
#
# minimize Total_Cost: 
#	sum {i in ORIG,j in DEST} cost[i,j] * Trans[i,j] * senior[i];