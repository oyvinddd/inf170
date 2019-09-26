# Exercise 3-1 - Transportation model

set ORIG;
set DEST;

param orders {DEST} >= 0;
param capacity {ORIG} > 0;
param distance {ORIG,DEST} > 0;
param cost > 0;

# If this check fails, the 
check: sum {i in ORIG} capacity[i] >= sum {j in DEST} orders[j];

var Ship {ORIG,DEST} >= 0;

minimize Shipping:
	sum {i in ORIG, j in DEST} cost * (distance[i,j]/1000) * Ship[i,j];

subject to Capacity {i in ORIG}:
	sum {j in DEST} Ship[i,j] <= capacity[i]; 

subject to Orders {i in DEST}:
	sum {j in ORIG} Ship[j,i] = orders[i];
