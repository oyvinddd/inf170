# Exercise 1-1 - Advertising campaign

# c)

# Variables
var At;
var Am;
var Ar;

# Number of audience
maximize Audience: 1800000 * At + 1000000 * Am + 250000 * Ar;
# Budget is 1 million usd
subject to Budget: 20000 * At + 10000 * Am + 2000 * Ar <= 1000000;
subject to Person_Weeks: 3 * Am + 1 * At + 1 * Ar <= 100;
# Only Tv ads had a lower limit (10 mins). Higher limits are redundant.
subject to Tv_Limit: 10 <= At <= 50;
subject to Mag_Limit: 0 <= Am <= 100;

# Introduction of radio causes no mag pages to be used for advertising. 