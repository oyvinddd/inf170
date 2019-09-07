# Exercise 1-5

# a)

# Set of items
set ITEMS;

# Parameters on items (w/ lower bounds)
param value {ITEMS} >= 0;
param weight {ITEMS} >= 0;
param volume {ITEMS} >= 0;
param avail {ITEMS} >= 0;
param min_stock {ITEMS} >= 0; # c)
param max_stock {ITEMS} >= 0; # c)

# Global parameters
param max_weight >= 0;
param max_volume >= 0;

# Decision variable (w/ lower and upper bounds)
var PickUp {i in ITEMS} integer >= 0, <= avail[i];

# Objective
maximize Profit: sum {i in ITEMS} PickUp[i] * value[i];

# Constraints
#subject to Stock {i in ITEMS}: min_stock[i] <= PickUp[i] <= max_stock[i]; # c)
subject to Total_Weight: sum {i in ITEMS} PickUp[i] * weight[i] <= max_weight;
subject to Total_Volume: sum {i in ITEMS} PickUp[i] * volume[i] <= max_volume;

# b)

# (see data source in entrepreneurs.dat)

# Max. profit for the given input data is 4800$
# Amounts to pick up of each item:
#	- tv: 0, camera: 20, vcr: 2, radio: 0, cd_player: 30, camcorder: 15

# c)

# I would add another constraint on the upper and lower amounts of the PickUp of each i.
# See constraint 'Stock' above.

# d)

# ampl: display Total_Weight, Total_Volume;
# Total_Weight = 3.33333 <-- means that increasing max weight will have a positive effect on profit
# Total_Volume = 0 <-- means that increasing max volume won't have any effect

# From these values we can see that increasing the total weight, will increase our profit,
# While increasing the volume would have no effect given the current input data.
# Conclusion given the current input data would then be to increase the weight capacity 
# (hire stronger people?).

# e)

# Optimum strategy is now to only pick up cameras (2.5) for a profit of 212.5$ in a day.
# Best all-integer solution: pick up 2 cameras and 1 CD player for a profit of 210$ in a day.