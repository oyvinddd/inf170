# # Question 5 of in-class test, autumn 2018

var X >= 0;
var Y >= 0, <= 2;

maximize Profit: 3000 * X + 2000 * Y;

subject to A: X + 2 * Y <= 8;
subject to B: 2 * X + Y <= 10;
subject to Xc: Y <=  X + 1;

# Optimum: X = 4, Y = 2