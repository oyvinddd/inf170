# Assignment 6-1

# Fire stations:
var X1 binary;
var X2 binary;
var X3 binary;
var X4 binary;
var X5 binary;
var X6 binary;

minimize Fire_Stations: X1 + X2+X3+X4+X5+X6;

subject to x1: X1 + X2 >= 1;
subject to x2: X2 + X1 + X6 >= 1;
subject to x3: X3 + X4 >= 1;
subject to x4: X4 + X3 + X5 >= 1;
subject to x5: X5 + X4 + X6 >= 1;
subject to x6: X6 + X2 + X5 >= 1;

# Optimum: X2 and X4 is 1, all others are 0
