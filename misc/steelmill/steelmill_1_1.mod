# Model 1.1 - The same model as in 1, but with a better syntax 
# for handling more complex situations

# A set of products
set P;
# Tons per hour of product j
param a {j in P};
# Hours available at the mill
param b;
# Profit per ton of product j
param c {j in P};
# Maximum tons of product j
param u {j in P};

var X {j in P};

maximize Total_Profit: sum {j in P} c[j] * X[j];
subject to Time: sum {j in P} (1/a[j]) * X[j] <= b;
subject to Limit {j in P}: 0 <= X[j] <= u[j];
