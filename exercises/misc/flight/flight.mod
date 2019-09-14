# Question 4 of in-class test, autumn 2018

 set COMP;
 set CARG;
 
 param weight_cap {COMP} >= 0;
 param space_cap {COMP} >= 0;
 
 param weight {CARG} >= 0;
 param volume {CARG} >= 0;
 param profit {CARG} >= 0;
 
 var Amt{CARG,COMP} >= 0;
 
 maximize Profit: sum {i in CARG} profit[i] * sum {j in COMP} Amt[i,j]; 
 
 # TODO: add constraints