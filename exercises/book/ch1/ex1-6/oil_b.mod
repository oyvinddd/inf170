# Exercise 1-6

# b)

set INTERM; # set of intermediates
set PROD; # set of final products
set ATTR; # set of attributes


param available {INTERM} >= 0; # barrels of intermediates i available
param units_contr {INTERM,ATTR} >= 0; # units of attr k contributed in each barrel of intermediate i
param attr_limits {PROD,ATTR} >= 0; # max allowed units of attr k per barrel of intermediate i
param allowed {INTERM,PROD};

param revenue {PROD} >= 0; # revenue per barrel of product j

# barrels of intermediates i used to make product j (w/ lower and upper bounds)
var Intermediates {i in INTERM,p in PROD} >= 0, <= allowed[i,p] * available[i];

# barrels of product j made (w/ lower and upper bounds)
var Products {p in PROD} >= 0;

maximize Total_Profit: sum {j in PROD} revenue[j] * Products[j]; # sum of revenues from the various products

# The amount of each intermediate used to make products must equal the amount available:
subject to Available {i in INTERM}: sum {j in PROD} Intermediates[i,j] = available[i];

# The amount of a product made must equal the sum of amounts of the components blended into it:
subject to Amount {j in PROD}: sum {i in INTERM} Intermediates[i,j] = Products[j];

# For each product, the total attributes contributed by all intermediates must not exceed the total allowed:
subject to Allowed {j in PROD,k in ATTR}: 
	sum {i in INTERM} units_contr[i,k] * Intermediates[i,j] <= attr_limits[j,k] * Products[j];
