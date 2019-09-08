# Exercise 1-6

# a)

set I; # set of intermediates
set J; # set of final products
set K; # set of attributes


param a {I} >= 0; # barrels of intermediates i available
param r {I,K} >= 0; # units of attr k contributed in each barrel of intermediate i
param u {J,K} >= 0; # max allowed units of attr k per barrel of intermediate i
param d {I,J};

param c {J} >= 0; # revenue per barrel of product j

# barrels of intermediates i used to make product j (w/ lower and upper bounds)
var X {i in I,j in J} >= 0, <= d[i,j] * a[i];

# barrels of product j made (w/ lower and upper bounds)
var Y {j in J} >= 0;

maximize Profit: sum {j in J} c[j] * Y[j]; # sum of revenues from the various products

# The amount of each intermediate used to make products must equal the amount available:
subject to Available {i in I}: sum {j in J} X[i,j] = a[i];

# The amount of a product made must equal the sum of amounts of the components blended into it:
subject to Amount {j in J}: sum {i in I} X[i,j] = Y[j];

# For each product, the total attributes contributed by all intermediates must not exceed the total allowed:
subject to Allowed {j in J,k in K}: sum {i in I} r[i,k] * X[i,j] <= u[j,k] * Y[j];
