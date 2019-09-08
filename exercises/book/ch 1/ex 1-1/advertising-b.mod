# Exercise 1.1 b) - Advertising campaign

# budget: 1000000 (constraint)
# at least 10minutes of tv time (constraint)
# variables:
# - 20000 * tv advert (1 minute) reach: 1800000
# - 10000 * mag advert (1 page) reach 	1000000



# Variables
var At;
var Am;

# Number of audience
maximize Audience: 1800000 * At + 1000000 * Am;
# Budget is 1 million usd
subject to Budget: 20000 * At + 10000 * Am <= 1000000;
subject to Person_Weeks: 3 * Am + 1 * At <= 100;
# Only Tv ads had a lower limit (10 mins). Higher limits are redundant.
subject to Tv_Limit: 10 <= At <= 50;
subject to Mag_Limit: 0 <= Am <= 100;