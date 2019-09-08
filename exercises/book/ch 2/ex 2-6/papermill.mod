# Exercise 2-6 - Paper mill

# a)

set PATS;
set WIDTHS;

param orders {WIDTHS} > 0;
param nbr {WIDTHS,PATS} integer >= 0;

check {j in PATS}: sum {i in WIDTHS} i * nbr[i,j] <= 110;

var Use {PATS} >= 0;

minimize Number_Of_Rolls: sum {j in PATS} Use[j];

subject to Orders {i in WIDTHS}:
	sum {j in PATS} nbr[i,j] * Use[j] >= orders[i];