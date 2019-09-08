# Exercise 2-5 - A chain of fast-food restaurants

# a)

set DAYS;

param min_emp {DAYS};

var Emp {d in DAYS} >= min_emp[d];