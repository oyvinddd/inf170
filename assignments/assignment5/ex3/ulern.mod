# Assignment 5-3 - Ulern Uni. (ILP)

set STUD;
set COUR;

param pref {STUD,COUR} >= 0;
param cap {COUR} >= 0;
param max_c;

var Y {STUD,COUR} binary; # if student

maximize Score: sum {i in STUD,j in COUR} Y[i,j] * pref[i,j];

# A student can only sign up to two courses
subject to Max_Courses {i in STUD}: sum {j in COUR} Y[i,j] = max_c;

# Each course has an individual capacity
subject to Capacity {j in COUR}: sum {i in STUD} Y[i,j] <= cap[j];

# Objective is 1775
