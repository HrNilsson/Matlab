clear; clc;
% close all;

%Define then World
world_size = 100.0;
landmarks  = [[20.0; 20.0], [0.0; 80.0], [80.0; 80.0], [80.0; 20.0]];
nLandmarks = size(landmarks,2);
%Define robot
Z=[30;30; 0];%[world_size*rand;world_size*rand;2*pi*rand];
Zdist=zeros(1,nLandmarks);
for j=1:nLandmarks
    dx = (Z(1) - landmarks(1,j));
    dy = (Z(2) - landmarks(2,j));
    Zdist(j) = sqrt(dx*dx+dy*dy);
end

%Particles
N=500;
p=[world_size*rand(1,N);world_size*rand(1,N);2*pi*rand(1,N)];

%Move particles
turn=.1;
forward=.01;
forward_noise_std=.1;

for j=1:N
% - turns a particle (add random uniform distributed noise in interval
% 0-2*pi)
p(3,j) = mod(p(3,j) + turn + 2*pi*rand,2*pi);
% - moves a particle forward in the current direction add gaussin noise with
%  std = forward_noise_std
dist = forward + forward_noise_std*randn;
p(1,j) = mod(p(1,j) + cos(p(3,j))*dist,world_size);
p(2,j) = mod(p(2,j) + sin(p(3,j))*dist,world_size);
end

%Resample
%Calculates how likely a measurement should be
sense_noise=20;
w=zeros(1,N);
for k=1:N
    prob = 1.0;
    for j=1:nLandmarks
        dx = (p(1, k) - landmarks(1,j));
        dy = (p(2, k) - landmarks(2,j));
        dist = sqrt(dx*dx+dy*dy);
        prob = prob*(1/sqrt(2*pi*sense_noise^2))*exp(-(dist-Zdist(j))^2/(2*sense_noise^2));
    end
    w(k) = prob;
end
alfa=w/sum(w);

ca=cumsum(alfa);
np=zeros(3,N)
for k=1:N
   s = rand;
   m=1;
   while s>ca(m)
       m=m+1;
   end
   np(:,k) = p(:,m);
end

%Draw the world
figure(2)
plot(landmarks(1,:), landmarks(2,:), 'ob', Z(1,:),Z(2,:),'og', p(1,:),p(2,:),'.r');
axis([0 world_size 0 world_size]);