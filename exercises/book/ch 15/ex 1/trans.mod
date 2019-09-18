# Exercise 15-1 - A network transhipment model

set CITIES;
set LINKS within (CITIES cross CITIES);

param supply {CITIES} >= 0;   # amounts available at cities
param demand {CITIES} >= 0;   # amounts required at cities

check: sum {i in CITIES} supply[i] = sum {j in CITIES} demand[j];

param cost {LINKS} >= 0;      # shipment costs/1000 packages
param capacity {LINKS} >= 0;  # max packages that can be shipped

var Ship {(i,j) in LINKS} >= 0, <= capacity[i,j]; # packages to be shipped

minimize Total_Cost:
	sum {(i,j) in LINKS} cost[i,j] * Ship[i,j];

subject to Balance {k in CITIES}:
	supply[k] + sum {(i,k) in LINKS} Ship[i,k] = demand[k] + sum {(k,j) in LINKS} Ship[k,j];
	
# a) The optimum for the updated data is 3710 (see trans.dat for the new data)

# b) TODO: read 15.3 Declaring network models by node and arc