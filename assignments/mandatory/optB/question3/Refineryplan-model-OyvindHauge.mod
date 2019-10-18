# Mandatory Assignment - Question 3

# a)

set P; # set of ports
set V; # set of vessels

param C {P,V} >= 0; # loading cost at port for vessel

param Sp {P} >= 0; # supply at port
param Cp {P} >= 0; # fixed cost for using port

param Uv {V} >= 0; # capacity of vessel
param Cv {V} >= 0; # fixed cost for using vessel

param D >= 0; # daily demand at refinery

var X {P,V} >= 0; # amount of loaded quantity at port for vessel
var K {P,V} binary; # 1 = if port-vessel pair was used, else 0
var Y {P} binary; # 1 = if port was used, else 0
var Z {V} binary; # 1 = the vessel was used, else 0

# total cost is the sum of loading the total cost and fixed costs 
minimize Total_Cost:
sum {i in P,j in V} C[i,j] * X[i,j] + 
sum {i in P} Cp[i] * Y[i] + 
sum {i in V} Cv[i] * Z[i];

# (1) daily demand of the refinery
subject to Demand: sum {i in P,j in V} X[i,j] = D;

# (2) daily supply at each port
subject to Supply {i in P}: sum {j in V} X[i,j] <= Sp[i];

# (3) vessel capacity
subject to Capacity {j in V}: sum {i in P} X[i,j] <= Uv[j];

# (4) a vessel can visit at most two ports
subject to Max_Ports {j in V}: sum {i in P} K[i,j] <= 2;

# (5) keep track of port-vessel combos that was used
subject to Port_Vessel_Combo {i in P,j in V}: X[i,j] - K[i,j] * Uv[j] <= 0;

# (6) apply fixed cost to port if it's being used
subject to Fixed_Cost_Port {i in P,j in V}: X[i,j] - Y[i] * Sp[i] <= 0;

# (7) apply fixed cost to vessel if it's being used
subject to Fixed_Cost_Vessel {i in P,j in V}: X[i,j] - Z[j] * Uv[j] <= 0;