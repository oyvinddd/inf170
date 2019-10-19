
set PROD;

param demand {PROD} >= 0;
param iraq_mix {PROD} >= 0;
param dubai_mix {PROD} >= 0;

var X integer; # barrels from iraq
var Y integer; # barrels from dubai

# Minimize the total capacity needed by the refinery
minimize Capacity: sum {p in PROD} X * iraq_mix[p] + Y * dubai_mix[p];

# (1) minimum demand
subject to Demand {p in PROD}: X * iraq_mix[p] + Y * dubai_mix[p] >= demand[p];

# (2) at least 40% from Iraq
subject to Min_Iraq: X >= (X + Y) * 0.4; 