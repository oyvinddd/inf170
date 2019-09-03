# Model 1 - an extremely simplified steel mill company
var Xb;
var Xc;

# Objective function
maximize Profit: 25 * Xb + 30 * Xc;

# Constraints
subject to Time: (1/200) * Xb + (1/140) * Xc <= 40;
subject to B_limit: 0 <= Xb <= 6000;
subject to C_limit: 0 <= Xc <= 4200;
