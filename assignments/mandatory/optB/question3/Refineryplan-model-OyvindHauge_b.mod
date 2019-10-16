# Mandatory Assignment - Question 3

# b)

set P; # set of ports
set V; # set of vessels

param C {P,V} >= 0; # loading cost at port for vessel
param T1 {P} >= 0;
param T2 {P} >= 0;
param T3 {P} >= 0;

param Sp {P} >= 0; # supply at port
param Cp {P} >= 0; # fixed cost for using port

param Uv {V} >= 0; # capacity of vessel
param Cv {V} >= 0; # fixed cost for using vessel

param D >= 0; # daily demand at refinery

var X {P,V} >= 0; # amount of loaded quantity at port for vessel
var Y {P,V} binary; # 1 = the port vessel combination was used, else 0
var Qa {V} binary;
var Qb {V} binary;
var Qc {V} binary;

minimize Total_Cost:
sum {i in P,j in V} ((T1[i] * Qa[j] + T2[i] * Qb[j] + T3[i] * Qc[j]) * X[i,j] + Cp[i] * Y[i,j] + Cv[j] * Y[i,j]);

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

# b) constraints

param Q1 = 99999;
param Q2 = 179999;
param Q3 = 180000;


subject to Tariff1 {i in P,j in V}: X[i,j] <= Qa[j] * Q1 + Q2 * (1 - Qb[j]);
subject to Tariff2 {i in P,j in V}: X[i,j] <= Qb[j] * Q2 + Q1;
subject to Tariff3 {i in P,j in V}: X[i,j] <= Qc[j] * Q3 + Q2;
#subject to Tariff3 {i in P,j in V}: X[i,j] <= Qc[j] * Q3 + Q2 * (1 - Qb[j]) + Q1 * (1 - Qa[j]);
#subject to Tariff2 {i in P,j in V}: X[i,j] <= Qb[j] * Q2 + (1 - Qa[j]) * Q1;

subject to S1 {i in V}: Qb[i] <= 1 - Qa[i]; # if Qb, then do not want Qa
subject to S2 {i in V}: Qc[i] <= 1 - Qb[i]; 

subject to AAA {j in V}: Qa[j] + Qb[j] + Qc[j] = 1; 