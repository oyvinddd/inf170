

var X1 binary;
var X2 binary; 
var X3 binary;
var X4 binary;
var X5 binary;

var Y1 binary;
var Y2 binary; 
var Y3 binary;
var Y4 binary;
var Y5 binary;


minimize Objective: 5*Y1 + 4*Y2 + 7*Y3 + 9*Y4 + 6*Y5;

subject to Max_Stations: X1 + X2 + X3 + X4 + X5 <= 1;

#subject to x1: X1 + X2 + X3 >= 1;
subject to x2: X2 + X1 + X3 + X4 + X5 + Y2 >= 1;
subject to x3: X3 + X1 + X2 + X4 + X5 + Y3 >= 1;
subject to x4: X4 + X2 + X3 + X5 + Y4 >= 1;
subject to x5: X5 + X2 + X3 + X4 + Y5 >= 1;