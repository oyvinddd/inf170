# Svetska
param N integer > 2; # Number of nodes

set Nodes ordered := {1..N};
set Arcs := {i in Nodes, j in Nodes: i <> j};

param xcoord {Nodes} >= 0;
param ycoord {Nodes} >= 0;
param length {(i,j) in Arcs} := sqrt((xcoord[i] - xcoord[j])^2 + (ycoord[i] - ycoord[j])^2);

var x {(i,j) in Arcs} binary;
var y {(i,j) in Arcs} >= 0;

param f := 0.01;

minimize Tourlength: sum {(i,j) in Arcs} length[i,j] * x[i,j];

subject to Demandy {i in Nodes: i >= 2}: sum {(i,j) in Arcs} y[j,i] >= 1;

subject to Flowy {i in Nodes: i >= 2}:
sum {(i,j) in Arcs} y[i,j] - sum {(i,j) in Arcs} y[j,i] = f;

subject to Totalx: sum {(i,j) in Arcs} x[i,j] <= N;
subject to Arcgain {(i,j) in Arcs}: y[i,j] <= (1 + N*f)*x[i,j];

# These rows tighten the model:
subject to Demandx {i in Nodes: i >= 2}: sum {(i,j) in Arcs} x[j,i] = 1;
subject to Flowx {i in Nodes: i >= 2}:
sum {(i,j) in Arcs} x[i,j] = sum {(i,j) in Arcs} x[j,i];
subject to Startx: sum {i in Nodes: i >= 2} x[1,i] = 1;
subject to Starty: sum {i in Nodes: i >= 2} y[1,i] = 1;