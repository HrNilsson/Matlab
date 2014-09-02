%% Exercises in [Lay] chapter 9.3

%% 15:
% The augmented matrix:
clc;
A = [1 5 1 0 0 70;
     3 2 0 1 0 54;
    -5 -4 0 0 1 0]
%%
A(2,:) = A(2,:)/3
%%
A(1,:) = A(1,:)-A(2,:)
%%
A(3,:) = A(3,:) +5*A(2,:)
%%
A(1,:) = A(1,:)/13*3
%%
A(2,:) = A(2,:)-2/3*A(1,:)
%%
A(3,:) = A(3,:) + 2/3*A(1,:)

%% Simplex method:
c = A(3,1:4)'
A1 = A(1:2,1:4)
b = A(1:2,6)
v = [3;4]
simplex(c,A1,b,v,1)