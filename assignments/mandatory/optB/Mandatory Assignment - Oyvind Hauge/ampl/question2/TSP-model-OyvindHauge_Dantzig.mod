# Dantzig
param N integer > 2; # Number of nodes

set Nodes ordered := {1..N};
set Steps := {i in Nodes, j in Nodes, k in Nodes: i <> j};

param xcoord {Nodes} >= 0;
param ycoord {Nodes} >= 0;
param length {i in Nodes, j in Nodes: i <> j} := sqrt((xcoord[i] - xcoord[j])^2 + (ycoord[i] - ycoord[j])^2);

var z {(i,j,k) in Steps} binary;

minimize Tourlength:
sum {(i,j,k) in Steps: i <> j} length[i,j] * z[i,j,k];

subject to Demand {i in Nodes}: sum {(i,j,k) in Steps} z[i,j,k] = 1;

subject to End {i in Nodes}:
sum {j in Nodes: j <> i} z[j,i,N] = sum {k in Nodes: k <> i} z[i,k,1];

subject to Step {t in Nodes, j in Nodes: t <= N - 1}:
sum {i in Nodes: i <> j} z[i,j,t] = sum {k in Nodes: k <> j} z[j,k,t+1];