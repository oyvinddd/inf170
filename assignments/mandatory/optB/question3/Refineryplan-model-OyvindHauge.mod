# Mandatory Assignment - Question 3

# a)

set P; # set of ports
set V; # set of vessels

set N := 1..3;

param C {P,V} >= 0; # loading cost at port for vessel
param Q {P,N} >= 0; # tariffs

param Sp {P} >= 0; # supply at port
param Cp {P} >= 0; # fixed cost for using port

param Uv {V} >= 0; # capacity of vessel
param Cv {V} >= 0; # fixed cost for using vessel

param D >= 0; # daily demand at refinery

var X {P,V} >= 0; # amount of loaded quantity at port for vessel
var Y {P,V} binary; # 1 = the port vessel combination was used, else 0

minimize Total_Cost:
sum {i in P,j in V} (C[i,j] * X[i,j] + Cp[i] * Y[i,j] + Cv[j] * Y[i,j]);

# daily demand of the refinery
subject to Demand: sum {i in P,j in V} X[i,j] = D;

# daily supply at each port
subject to Supply {i in P}: sum {j in V} X[i,j] <= Sp[i];

# vessel capacity
subject to Capacity {j in V}: sum {i in P} X[i,j] <= Uv[j];

# a vessel can visit at most two ports
subject to Max_Ports {j in V}: sum {i in P} Y[i,j] <= 2;

# if combination of port i and vessel j is used, make 
# sure we set corresponding binary variable to 1
subject to Fixed_Cost {i in P,j in V}: X[i,j] - Y[i,j] * Uv[j] <= 0;

# b)
