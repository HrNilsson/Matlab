%% Exercises in [Lay] chapter 9.2

%% 15:
% The augmented matrix:
clc;
A = [5 2 1 0 0 0 200;
    1/5 2/5 0 1 0 0 16;
    1/5 1/5 0 0 1 0 10;
    -20 -26 0 0 0 1 0]

%%
% Row operations:
% Making A(2,2) a pivot since A(4,2) is smallest and thus, it gives the max
% increase in income to including x2 in the solution, and A(2,2) gives the
% smallest ratio bi/ai2
A(3,:) = A(3,:)-0.5*A(2,:)
%%
A(2,:) = A(2,:)*5/2
%%
A(1,:) = A(1,:)-2*A(2,:)
%%
A(4,:) = A(4,:)+26*A(2,:)
%%
% Making A(3,1) a pivot
A(3,:) = A(3,:)*10
%%
A(2,:) = A(2,:)-1/2*A(3,:)
%%
A(1,:) = A(1,:)-4*A(3,:)
%%
A(4,:) = A(4,:) + 7*A(3,:)

%% 
