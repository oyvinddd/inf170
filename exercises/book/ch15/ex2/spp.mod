# Exercise 15-2

# a) - Shortest path

set NODES; # set of nodes

param ent symbolic in NODES;
param ext symbolic in NODES, <> ent;

set EDGES within (NODES diff {ext}) cross (NODES diff {ent});

param length {EDGES} >= 0; # length of edges

var Use {(i,j) in EDGES} >= 0;

minimize Total_Length:
	sum {(i,j) in EDGES} Use[i,j] * length[i,j];

subject to Start:
	sum {(ent,j) in EDGES} Use[ent,j] = 1;

subject to Balance {k in NODES diff {ent,ext}}:
	sum {(i,k) in EDGES} Use[i,k] = sum {(k,j) in EDGES} Use[k,j];

# Shortest path from A to F is 31

