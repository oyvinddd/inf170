# Assignment 6-3

# a)

var X1 binary;
var X2 binary;
var X3 binary;
var X4 binary;

param C1 := 3;
param C2 := 4;
param C3 := 61;
param C4 := 4;

minimize Total_Cost: X1*C1 + X2*C2 + X3*C3 + X4*C4;

subject to x1: X1 + X2 + X3 + X4 >= 1;
subject to x2: X2 + X3 + X4 >= 1;
subject to x3: X3 + X4 >= 1;
subject to x4: X4 >= 1;
