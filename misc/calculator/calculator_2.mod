# This is a more general model for the LP in calculator.mod
# A separate calculator.dat file is used for the data in this case



set PROD;

param profit {PROD}; # profit per product

#subject to Cost: sum {p in PROD} profit[p] * 2;

maximize Profit: sum {p in PROD}


