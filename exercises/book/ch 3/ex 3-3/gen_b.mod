# Exercise 3-3 - Generalization of the transportation model

set ORIG_1;
set ORIG_2;   # origins
set DEST;   # destinations
param supply {ORIG_1} >= 0;   # amounts available at origins
param demand {DEST} >= 0;   # amounts required at destinations

param supply_pct >= 0;
param demand_pct >= 0;

check: sum {i in ORIG_1} supply[i] = sum {j in DEST} demand[j];

param cost_1 {ORIG_1,ORIG_2} >= 0;
param cost_2 {ORIG_2,DEST} >= 0;

var Trans_1 {ORIG_1,ORIG_2} >= 0;
var Trans_2 {ORIG_2,DEST} >= 0;

minimize Total_Cost:
	sum {i in ORIG_1,j in ORIG_2} cost_1[i,j] * Trans_1[i,j] 
	+ sum {k in ORIG_2, l in DEST} cost_2[k,l] * Trans_2[k,l];

subject to Supply {i in ORIG_2}:
	sum {j in DEST} Trans_2[i,j] = supply[i];
   
subject to Demand {j in DEST}:
	sum {i in ORIG_2} Trans_2[i,j] = demand[j];

# No more than 50% of the supply for one mill may be sent to one factory
subject to Supply_Cap {i in ORIG_2,j in DEST}:
	Trans_2[i,j] <= supply[i] * 0.5;

# No more than 85% of a factory's demand may be satisfied by one mill
subject to Demand_Cap {i in ORIG_2,j in DEST}:
	Trans_2[i,j] <= demand[j] * 0.85;