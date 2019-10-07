
set V;
set I;
set A;

param home_port {V};
param starting_time {V};
param K {V}; # capacity

param origin {I};
param dest {I};
param size {I};
param cost {I};
param l_win {I};
param u_win {I};
param l_del {I};
param u_del {I};


var X {V};


minimize Z: sum {v in V,(i,j) in A} 


