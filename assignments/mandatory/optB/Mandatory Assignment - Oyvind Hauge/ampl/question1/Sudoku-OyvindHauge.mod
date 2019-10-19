# Mandatory Assignment - Question 1

param m >= 1, integer, default 3;
param n := m*m;

set N := 1..n;
set BOARD within {N cross N cross N};

# Binary variable (1 = value k is present at position (i,j), otherwise 0)
var X {(i,j,k) in {N cross N cross N}} binary ;

# Nothing to maximize/minimize
minimize Z: -1;

# A given digit should only show up in a row once
subject to Rows {i in N,k in N}: sum {j in N} X[i,j,k] = 1;

# A given digit should only show up in a column once
subject to Cols {j in N,k in N}: sum {i in N} X[i,j,k] = 1;

# Only one of each digit in each 3x3 matrix
subject to Squares {k in N,p in 1..3 , q in 1..3}: 
sum {j in (3 * p - 2) ..(3 * p) } sum {i in (3 * q - 2) ..(3 * q) } X[i,j,k] = 1;

# Only one value is allowed in each cell
subject to One_Value {i in N,j in N}: sum {k in N} X[i,j,k] = 1;

# Take into account the already existing values on the board
subject to Existing {(i,j,k) in BOARD}: X[i,j,k] = 1;