# Exercise 1.1 a) - Advertising campaign

# budget: 1000000 (constraint)
# at least 10minutes of tv time (constraint)
# variables:
# - 20000 * tv advert (1 minute) reach: 1800000
# - 10000 * mag advert (1 page) reach 	1000000



# Variables
var At >= 10;
var Am >= 0;

# Number of audience
maximize Audience: 1800000 * At + 1000000 * Am;
# Budget is 1 million usd
subject to Budget: 20000 * At + 10000 * Am <= 1000000;
# Only Tv ads had a lower limit (10 mins). Higher limits are redundant.
subject to Tv_Limit: At <= 50;
subject to Mag_Limit: Am <= 100;

# Optimal solution: 9.8*10^7 audience reached
# 10 mins of tv and 50 mag ads