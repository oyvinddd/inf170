# Exercise 1-4 - A car manufacturer

# a)
# data values:
#	- factory time per car
#	- profit per car 
#	- min. number of each kind of car to be produced
#	- total amount of factory time
# sets:
#	- set CARS := Ca Cb;
# params:
#	- param: time profit c_min :=
#		Ca	10	20	10
#		Cb	22	20	33;

# param available_time := 1000; 

# decision variables:
#	- decision variables are the amounts of each cars to produce
#	- declare: var Make {c in CARS} >= c_min[c];

# b)

# objective:
#	- maximize Profit: sum {c in CARS} Make[c] * profit[c];
# constraints:
#	[see Make above]
#	subject to Total_Time: sum {c in CARS} Make[c] * time[c] <= available_time;

# c) - implementation

set CARS;

param time {CARS};
param profit {CARS};
param orders {CARS};
param effic {CARS};

param avail;
param min_avg;

var Make {c in CARS} integer >= orders[c];

maximize Profit: sum {c in CARS} Make[c] * profit[c];

subject to Time: sum {c in CARS} Make[c] * time[c] <= avail;

# Profit: 28700
# C: 32, L: 15, T: 11

# d)

# For fractions, I would just round the resulting number down, this way I can
# be certain that I'm able to produce all the cars.

# e) and f)

# nonlinear (variables divided with variables):
#subject to Fleet_Avg: sum {c in CARS} Make[c] * effic[c] / sum {cc in CARS} Make[cc] >= min_avg;
# linear:
subject to Fleet_Avg: sum {c in CARS} Make[c] * effic[c] >= min_avg * sum {c in CARS} Make[c];

# Adding additional constraints may make the solution space smaller (but never larger!)

# g)

# To account for different production stages, we need to make the following refinements to the model:
#	- add another set STAGES
#	- modify param time {CARS,STAGES}
#	- wrap the time constraint in {s in STAGES}: sum {c in CARS} Make[c] * time[c,s] <= time[s] 

