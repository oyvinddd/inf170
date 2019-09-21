

set TEL;

param cost {TEL} >= 0;
param charge {TEL} >= 0;
param minutes >= 0;

var X {TEL} >= 0;
var Y {TEL} binary; # binary variable (if company should be used or not) 

minimize Monthly_Cost:
	sum {t in TEL} X[t] * cost[t] + sum {t in TEL} Y[t] * charge[t];

subject to Minutes: sum {t in TEL} X[t] = minutes;

subject to Usage {t in TEL}: Y[t] <= X[t];
#subject to Usage {t in TEL}: X[t] -Y[t] * charge[t] <= 0;