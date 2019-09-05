# This is a more general model for the LP in calculator.mod
# A separate calculator.dat file is used for the data in this case



set PROD;

param cost {PROD} > 0; # cost to make each product
param sale {PROD} > 0; # outgoing price per product
param time {PROD} > 0; # time to make each product

param max_cost >= 0;
param max_time >= 0;

var Make {p in PROD}; # decision varesetriable (quantity of each product to make)

maximize Total_Profit: sum {p in PROD} sale[p] * Make[p]; # objective: maximize profit

subject to Cost: sum {p in PROD} cost[p] * Make[p] <= max_cost; # cost constraint
subject to Time: sum {p in PROD} time[p] * Make[p] <= max_time; # time constraint


