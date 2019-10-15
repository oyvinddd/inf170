
set V;
set I;
set A;

param home_port {V};
param starting_time {V};
param K {V}; # capacity

param origin {I};
param dest {I};
param size {I};

# Cost of going from i to j using vessel v
param C {(i,j) in A, V} > 0;

param l_win {I};
param u_win {I};
param l_del {I};
param u_del {I};

# Binary decision variable (1 = if cargo is NOT transported with v, 0 otherwise)
var Y {} binary; # (13)

# Binary variable (1 = if vessel v uses arc from i to j)
var X {I,J,V} binary; # (14)


minimize Z: sum {v in V,(i,j) in A} C[i,j,v] * X[i,j,v]; # (1)

# All cargos should be transported either by us or by spot
subject to Transporter: sum {v in V,(i,j) in A} X[i,j,v] + Y[i] = 1; # (2)

# Make sure the vessel exits the starting node
subject to Start {v in V}: sum {()}


