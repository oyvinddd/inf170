# Assignment 2, exercise 2
set PROD;

param usage {PROD};
param profit {PROD};
param p_min {PROD} >= 0;
param p_max {PROD};

param avail >= 0;

var Make {PROD} >= 0;

maximize Profit: sum {p in PROD} Make[p] * profit[p];

subject to Availability: sum {p in PROD} Make[p] * usage[p] <= avail;
subject to Min_Produce {p in PROD}: Make[p] >= p_min[p] * sum {q in PROD} Make[q];
subject to Max_Produce {p in PROD}: Make[p] <= p_max[p];