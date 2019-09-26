# A more general solution to the model in exercise 1.1 from the book

set MEDIA;

param cost {MEDIA};
param reach {MEDIA};

param require {MEDIA} >= 0;
param budget >= 0;

var Buy {j in MEDIA} >= require[j];

maximize Audience: sum {m in MEDIA} reach[m] * Buy[m];
subject to Budget: sum {m in MEDIA} cost[m] * Buy[m] <= budget;