function [ x ] = Ex1_Channel( txsignal,fsample,bitspersample )


lDelay = 0.8; % Seconds
nDelayTaps = lDelay * fsample;

h = zeros(2,nDelayTaps);
h(2,:) = 0:lDelay/nDelayTaps:lDelay-lDelay/nDelayTaps;

h(1,floor(0.3*fsample)) = 0.4;
h(1,floor(0.35*fsample)) = 0.2;
h(1,floor(0.4*fsample)) = 0.1;
h(1,floor(0.45*fsample)) = 0.1;
h(1,floor(0.8*fsample)) = 0.04;

H = fft(h(1,:));
% H = fftshift(H);

figure(1)
subplot(211)
plot(h(2,:),h(1,:));
subplot(212)
plot(abs(H));

meanDelay = 0;
for i = 1:size(h,2)
   
    meanDelay = meanDelay + (i/fsample*h(1,i));
    
end

meanDelay = meanDelay/sum(h(1,:))

RMSdelaySpread = 0;
for i = 1:size(h,2)
    
    RMSdelaySpread = RMSdelaySpread + ((i/fsample - meanDelay)^2 * h(1,i));

end

RMSdelaySpread = sqrt(RMSdelaySpread/sum(h(1,:)))

 
sum(h(1,:))
x = filter(h(1,:),1,txsignal);

RMSdelaySpread

end

