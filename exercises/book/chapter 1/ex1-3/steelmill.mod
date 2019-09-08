# Exercise 1-3

set PROD; # products
param rate {PROD} > 0; # produced tons per hour
param avail >= 0; # hours available in week
param profit {PROD}; # profit per ton
param commit {PROD} >= 0; # lower limit on tons sold in week
param market {PROD} >= 0; # upper limit on tons sold in week
var Make {p in PROD} >= commit[p], <= market[p]; # tons produced
maximize Total_Profit: sum {p in PROD} profit[p] * Make[p];
# Objective: total profits from all products
subject to Time: sum {p in PROD} (1/rate[p]) * Make[p] <= avail;
# Constraint: total of hours used by all
# products may not exceed hours available


# a)

# The Time = 4640 value tells us that if we were to relax the constraint by some
# small amount, we would be able to produce another 4640$ in profit each hour
# (decreasing the time would decrease the profit correspondingly).

# Make.rc (reduced cost) tells us that increasing the lower bound on coils will
# reduce the profit for coil production by about 3.14$ (each one-ton decrease in
# the lower bound would see a increase in the profit of about 3.14$).

# We also inspect that for bands, it's the opposite; if we increase the market
# (upper bound), we should see the 1.8 RC for bands go towards zero (i.e. the profit
# will be increased by about 1.8$ ber ton produced).

# For plates, there's no constraints to relax since it's already at 0 (optimum).

