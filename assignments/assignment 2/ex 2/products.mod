# Assignment 2-2 - A two-product company

var A >= 0, <= 110;
var B >= 0;

maximize Profit: 40 * A + 90 * B;

subject to Ratio: A >= (A + B) * 0.8;

subject to Availability: 2 * A + 4 * B <= 300;

# The maximum profit (objective) is 6250$
# With 100 x A and 25 x B produced