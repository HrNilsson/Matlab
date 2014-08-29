%% Exercises in [Lay] chapter 9.1

%% 9:
% Given:

% Payoff matrix:
A = [1 2 -2; 0 1 4; 3 -1 1];

% Input probability vectors:
xa = [1/3;1/2;1/6];
ya = [1/4;1/2;1/4];
xb = [1/4;1/2;1/4];
yb = [1/2;1/4;1/4];

% Expected payoff E(x,y):
Ea = xa'*A*ya
Eb = xb'*A*yb

% The values of using strategies:
ei = eye(3);
vxa = min(xa'*A*ei)
vya = max(ei'*A*ya)
vxb = min(xb'*A*ei)
vyb = max(ei'*A*yb)

%% 15 Optimal strategies and game value
A = [4 6 2 0;1 3 2 5];
syms t;
z = A(1,:)*(1-t)+A(2,:)*t
for i = 1:1:4
    ezplot(z(i),[0,1])
    hold on;
end

% Optimal strategies for x, with t = [2/5 2/3].

%% Optimal strategies for y:
syms c1 c3;
y = [c1;0;c3;0];
eq1 = [1 0]*A*y == 2
eq2 = c1 + c3 == 1
[c1 c3] = solve(eq1,eq2)

%y = [c1;0;c3;0]

%% 19 Optimal strategies
supply = [0 1; 1 1/2];
soldiers = [-4 0; 0 -7];
z = supply(1,:)*(1-t)+supply(2,:)*t
for i = 1:1:2
    ezplot(z(i),[0,1])
    hold on;
end
hold off;
% intersection:
t_inter = solve(z(1) == z(2));
y_inter = subs(z(1),t,t_inter) % Game value
gameValue = y_inter;

x = [1-t_inter;t_inter]

syms c1 c2;
y = [c1;c2];
eq1 = [1 0]*supply*y == gameValue;
eq2 = c1 + c2 == 1;
[c1 c2] = solve(eq1,eq2)
y = [c1;c2]

% Expected supply througput: E(x,y)
supply_throug = x'*supply*y

%%
% Soldiers:
z1 = soldiers(1,:)*(1-t)+soldiers(2,:)*t
for i = 1:1:2
    ezplot(z1(i),[0,1])
    hold on;
end
hold off;
% intersection:
t_inter = solve(z1(1) == z1(2))
y_inter = subs(z1(1),t,t_inter) % Game value
gameValue = y_inter;

x = [1-t_inter;t_inter]

syms c1 c2;
y = [c1;c2];
eq1 = [1 0]*soldiers*y == gameValue;
eq2 = c1 + c2 == 1;
[c1 c2] = solve(eq1,eq2)
y = [c1;c2]

% Expected supply througput: E(x,y)
supply_throug = x'*supply*y
