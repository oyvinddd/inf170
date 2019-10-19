# Mandatory Assignment - Question 3

# b)

set P; # set of ports
set V; # set of vessels

param C {P,V} >= 0; # loading cost at port for vessel

param Q1 := 99999;
param Q2 := 100000;
param Q3 := 179999;
param Q4 := 180000;

param T1 {P} >= 0; # tariff section one
param T2 {P} >= 0; # tariff section two
param T3 {P} >= 0; # tariff section three

param Sp {P} >= 0; # supply at port
param Cp {P} >= 0; # fixed cost for using port

param Uv {V} >= 0; # capacity of vessel
param Cv {V} >= 0; # fixed cost for using vessel

param D >= 0; # daily demand at refinery

var X {P,V} >= 0; # amount of loaded quantity at port for vessel
var K {P,V} binary; # 1 = if port-vessel pair was used, else 0
var Y {P} binary; # 1 = if port was used, else 0
var Z {V} binary; # 1 = the vessel was used, else 0

var Qa {P,V} binary;
var Qb {P,V} binary;
var Qc {P,V} binary;

var X1 {P,V} >= 0,;
var X2 {P,V} >= 0;
var X3 {P,V} >= 0;

# total cost is the sum of loading the total cost and fixed costs 
minimize Total_Cost:
sum {i in P,j in V} (X1[i,j] * T1[i] + X2[i,j] * T2[i] + X3[i,j] * T3[i]) +
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

# (8) upper bound for intermediate variable X1 (lower bound is already defined)
subject to X1_Upper {i in P,j in V}: X1[i,j] - Q1 * Qa[i,j] <= 0;

# (9) lower bound on intermediate variable X2
subject to X2_Lower {i in P,j in V}: X2[i,j] - Q2 * Qb[i,j] >= 0;

# (10) upper bound on intermediate variable X2
subject to X2_Upper {i in P,j in V}: X2[i,j] - Q3 * Qb[i,j] <= 0;

# (11) lower bound on intermediate variable X3
subject to X3_Lower {i in P,j in V}: X3[i,j] - Q4 * Qc[i,j] >= 0;

# (12) upper bound on intermediate variable X3 (vessel capacity is upper bound)
subject to X3_Upper {i in P,j in V}: X3[i,j] <= Uv[j] * Qc[i,j];

# (13) make sure at most one tariff is used
subject to Max_One_Tariff {i in P,j in V}: Qa[i,j] + Qb[i,j] + Qc[i,j] <= 1;

# (14) combine all intermediate variables into the main X variable
subject to Combined {i in P,j in V}: X1[i,j] + X2[i,j] + X3[i,j] = X[i,j];
