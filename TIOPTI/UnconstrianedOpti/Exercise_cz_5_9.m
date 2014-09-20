%% 5.9

[x1, x2] = meshgrid(-10:1:10,-10:1:10);

f1 = x1.^2-x2.^2;
f2 = 2*x1.*x2; 

%%
figure(1)
surf(x1,x2,f1);
figure(2)
surf(x1,x2,f2);
%%
figure(3)
[C,h1] = contour(f1,[0 12]);
set(h1,'ShowText','on','TextStep',get(h1,'LevelStep')*2)
colormap cool
hold on
%figure(4)
[C,h2] = contour(f2,[0 16]);
set(h2,'ShowText','on','TextStep',get(h2,'LevelStep')*2)
colormap cool
%%
figure(5)
[C,h] = contourf(x1,x2,f1,10);
colormap autumn
colorbar

%% 5.10 
% a
syms x1 x2;
y = 2 + [1 0]*[x1-1;x2]+[x1-1 x2]*[0 -1/2;-1/2 1/2]*[x1-1;x2]
expand(y)

