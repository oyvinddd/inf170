# Exercise 15-2

# b) - Maximum flow

set NODES; # set of nodes

param ent symbolic in NODES;
param ext symbolic in NODES, <> ent;

set EDGES within (NODES diff {ext}) cross (NODES diff {ent});

param cap {EDGES} >= 0; # length of edges

var Flow {(i,j) in EDGES} >= 0, <= cap[i,j];

maximize Entering: sum {(ent,j) in EDGES} Flow[ent,j];

subject to Balance {k in NODES diff {ent,ext}}:
	sum {(i,k) in EDGES} Flow[i,k] = sum {(k,j) in EDGES} Flow[k,j];
	
# Difference from the SP model:
#	- Objective function (maximize flow from start node)
#	- Upper bound on each edge (capacity of the "pipe")
#	- Removal of start constraint

# Objective function for this configuration, and hence the maximum flow, is 18
