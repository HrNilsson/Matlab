%% René Nilsson - 10783 - Compulsory Assignment

%% Exercise 1
% Optimization using the simplex method:

% The augmented matrix:
clc; clear;
A = [1  2  0  1  0  0  0  28;
     2  0  4  0  1  0  0  16;
     0  1  1  0  0  1  0  12;
    -2 -5 -3  0  0  0  1  0]
%%
% We want to bring $x_2$ in, since $A(4,2) < A(4,3) < A(4,1)$, and thus
% increases $A(4,8)$ the most.
% The pivot row should be $A(3,2)$, since $$\frac{A(3,8)}{A(3,2)} = 12 <
% \frac{A(1,8)}{A(1,2)} = 14$$
%%
A(1,:) = A(1,:)-2*A(3,:);
%%
A(4,:) = A(4,:) + 5*A(3,:)
%%
% Next, we bring in $x_1$, since $A(4,1)$ is the only negative value in $A(4,:)$.
% $A(1,1)$ is the new pivot, since $$\frac{A(1,8)}{A(1,1)} = 4 < \frac{A(2,8)}{A(2,1)} = 8$$
%%
A(2,:) = A(2,:) -2*A(1,:);
%%
A(4,:) = A(4,:) + 2*A(1,:)
%%
% Last, we bring in $x_3$, with pivot $A(2,3)$, since $A(1,3)$ is negative and
% $$\frac{A(2,8)}{A(2,1)} = 1 < \frac{A(3,8)}{A(3,1)} = 12$$
%%
A(2,:) = A(2,:)/8;
%%
A(1,:) = A(1,:) + 2*A(2,:);
%%
A(3,:) = A(3,:) - A(2,:);
%%
A(4,:) = A(4,:) + 2*A(2,:)
%%
% Thus the maximum of the problem is 70, which is achieved when $x_1 = 6$, $x_2
% = 1$ and $x_3 = 11$.


%% Exercise 2
% Minimizing the function $f(x) = x_1^2+3*x_2^2-2*x_1*x_2+3*x_2$.
% 1. Write f on the form: $\frac{1}{2}*x^T*Q*x-x^T*b$:

Q = [2 -2;-2 6]
b = [0;-3]

%%
% 2. Sketch the levels set for f and the gradient of f in the point $(1,1)^T$ in a $x_1,x_2$-coordinate system.
[x1, x2] = meshgrid(-10:1:10,-10:1:10);
x = [x1;x2];
f1 = x1.^2+3*x2.^2-2*x1.*x2+3*x2;
[C,h1] = contour(x1,x2,f1,[0 3 10 50 100 200 400]);
set(h1,'ShowText','on','TextStep',get(h1,'LevelStep')*2)
colormap cool
title('Level sets of f (x)')
xlabel('x1')
ylabel('x2')

%%
% Gradient of f in the point $(1,1)^T$:
g1 = Q*[1;1]-b

%%
% 3. Find all point satisfying the FONC. Do these points satisfy the SONC?

%%
% The gradient of f is found to be: $$f'(x)= Q*x-b$$
%%
% Finding the point satisfying the FONC equals solving the following:
% $$Q*x-b = 0$$
%%
% This gives the following point:
x = inv(Q)*b

%%
% The Hessian is found to be $F(x) = Q$. Thus, the SONC is to test whether Q > 0:
format short
eigs(Q)
%%
% Since all eigenvalues of Q is positive, Q > 0 then the SONC is satisfied in all points satisfiying the
% FONC.
%%
% 4. Find the minimum of f over $R^2$

%%
% Since both the FONC and SOSC is satisfied by the previous piont, this is
% the global minimum:
x

%% Exercise 3
% 


