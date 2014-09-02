%% Exercises in [Lay] chapter 9.4

%% 11:
b = [16;10;20]
A = [1 2 1 0 0; 1 1 0 1 0; 3 2 0 0 1]
c = -[4;5;0;0;0]

%% Simplex method:
v = [3;4;5]
simplex(c,A,b,v,1)

%% 21:
clc; clear;
b = [1;1;1]
A = [7 4 1 1 0 0; 4 6 3 0 1 0; 2 3 7 0 0 1]
c = -[1;1;1;0;0;0]

%% Simplex method:
v = [4;5;6]
simplex(c,A,b,v,1)
