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
var K {P,V} binary; 
var Y {P} binary; # 1 = if port was used, else 0
var Z {V} binary; # 1 = the vessel was used, else 0

minimize Total_Cost:
sum {i in P,j in V} C[i,j] * X[i,j] + 
sum {i in P} Cp[i] * Y[i] + 
sum {i in V} Cv[i] * Z[i];

# daily demand of the refinery
subject to Demand: sum {i in P,j in V} X[i,j] = D;

# daily supply at each port
subject to Supply {i in P}: sum {j in V} X[i,j] <= Sp[i];

# vessel capacity
subject to Capacity {j in V}: sum {i in P} X[i,j] <= Uv[j];

# a vessel can visit at most two ports
subject to Max_Ports {j in V}: sum {i in P} K[i,j] <= 2;

subject to Fixed_Cost_P {i in P}: sum {j in V} X[i,j] <= Y[i] * Sp[i];

subject to Fixed_Cost_V {j in V}: sum {i in P} X[i,j] <= Z[j] * Uv[j];
