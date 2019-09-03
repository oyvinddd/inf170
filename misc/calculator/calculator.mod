# This LP is formulated from a youtube video
# Link: https://www.youtube.com/watch?v=Bzzqx1F23a8 (8:37)

# vars = books and calcs

# cost of book 5$ (sales 20$)
# cost of calc 4$ (sales 18$)

# restriction on cost: must not exceed 27,000$ pr month

# 5 mins to produce book
# 15 mins to produce calc

# Objective: determine the maximum possible profit of the company in a given month (30 days)


var Xb >= 0; # book
var Xc >= 0; # calculator

maximize Profit: 20 * Xb + 18 * Xc; # objective

subject to Cost: 5 * Xb + 4 * Xc <= 27000; # cost restriction
subject to Time: 5 * Xb + 15 * Xc <= 43200; # time restriction

# The time constraint makes sure that number of mins to produce books
# plus number of mins to produce calcs doesn't exceed max mins available
# (max mins available in a month is 30 * 24 * 60 = 43200)