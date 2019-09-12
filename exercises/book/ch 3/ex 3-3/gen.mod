# Exercise 3-3 - Generalization of the transportation model

set ORIG;   # origins
set DEST;   # destinations
param supply {ORIG} >= 0;   # amounts available at origins
param demand {DEST} >= 0;   # amounts required at destinations

param supply_pct >= 0;
param demand_pct >= 0;

check: sum {i in ORIG} supply[i] = sum {j in DEST} demand[j];

param cost {ORIG,DEST} >= 0;   # shipment costs per unit

var Trans {ORIG,DEST} >= 0;    # units to be shipped

minimize Total_Cost:
	sum {i in ORIG, j in DEST} cost[i,j] * Trans[i,j];

subject to Supply {i in ORIG}:
	sum {j in DEST} Trans[i,j] = supply[i];
   
subject to Demand {j in DEST}:
	sum {i in ORIG} Trans[i,j] = demand[j];
	
# a)

# No more than 50% of the supply for one mill may be sent to one factory
subject to Supply_Cap {i in ORIG,j in DEST}:
	Trans[i,j] <= supply[i] * 0.5;

# No more than 85% of a factory's demand may be satisfied by one mill
subject to Demand_Cap {i in ORIG,j in DEST}:
	Trans[i,j] <= demand[j] * 0.85;
	
# The two new restrictions raises the total cost by 3010$
# Before FRA got their whole supply from PITT but now it has to
# get some from CLEV as well. By using the 'display Trans' command
# we see the same trend for almost all other factory/mill combo.