# Exercise 2-6 - Paper mill

# a) and b)

set PATS;
set WIDTHS;

param orders {WIDTHS} > 0;
param nbr {WIDTHS,PATS} integer >= 0;
param max_rolls >= 0;

check {j in PATS}: sum {i in WIDTHS} i * nbr[i,j] <= max_rolls;

var Use {PATS} >= 0;

minimize Number_Of_Rolls: sum {j in PATS} Use[j];

subject to Orders {i in WIDTHS}:
	sum {j in PATS} nbr[i,j] * Use[j] >= orders[i]; # a)

#subject to Pattern_Lower {i in WIDTHS}:
#	sum {j in PATS} Use[j] * nbr[i,j] >= orders[i] * 0.9; # b)
	
#subject to Pattern_Upper {i in WIDTHS}:
#	sum {j in PATS} Use[j] * nbr[i,j] <= orders[i] * 1.4; # b)
	
	
# c) TODO:

# d) TODO: