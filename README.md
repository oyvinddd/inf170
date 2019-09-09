# AMPL (**A Mathematical Programming Language**) 
## Introduction
**AMPL** is an [algebraic modelling language](https://en.wikipedia.org/wiki/Algebraic_modeling_language "Algebraic modelling language") to describe and solve high-complexity problems for large-scale mathematical computing (i.e., large-scale optimization and [scheduling](https://en.wikipedia.org/wiki/Automated_planning_and_scheduling)-type problems).

This repository contains my answers to the exercises at the end of each chapter in the [AMPL book](https://ampl.com/resources/the-ampl-book/chapter-downloads/).

## Syntax

Some basic syntax used in AMPL.

```ruby
# A set (which can be iterated over)
set PRODUCTS;

# A parameter on the set of products
# (a given profit is defined for each product in the set)
param profit {PRODUCTS};

# A 'global' parameter (i.e. number of working hours available in a week)
# Parameters can be initialized with lower and upper bounds (<=, >=)
pram avail >= 0;

# Decision variable
var Make {PRODUCTS};

# Objective function. We'll want to either maximize or minimize this.
maximize Total_Profit: sum {p in PRODUCTS} Make[p] * profit[p];

# The objective is subject to one ore more constraints
subject to Time: sum {p in PROD} (1/rate[p]) * Make[p] <= avail;
```
