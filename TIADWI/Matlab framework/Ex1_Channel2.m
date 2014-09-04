function [ x ] = Ex1_Channel2( txsignal,fsample,bitspersample )


% Delay profile [Delay / Amplitude weight ]
a = [
    500  0.5 ;
    1400 0.5 ;
    1800 0.4 ;
    2300 0.5 ;
    5000 0.8 ;
    8000 0.6 
    ];

% Scale for correct time unit
a(:,1) = a(:,1)*10^-9  % 10^-3 ms ; 10^-6 µs ; 10^-9 ns

Ac = a;
Ac(:,2) = Ac(:,2).^2;
Ac

maxDelay = max(a(:,1));

nDelayTaps = maxDelay * fsample;
nPath = size(a,1);

h = zeros(1,nDelayTaps);

for i = 1:nPath
   
    h(floor(a(i,1)*fsample)) = a(i,2);
    
end
    
t = 0:lDelay/nDelayTaps:lDelay-lDelay/nDelayTaps;

H = fft(h);

figure(1)
subplot(211)
plot(t,h);
subplot(212)
plot(abs(H));

% meanDelay = 0;
% for i = 1:size(h,2)
%    
%     meanDelay = meanDelay + (i/fsample*h(1,i));
%     
% end
% 
% meanDelay = meanDelay/sum(h)

meanDelay = Ac(:,1)'*Ac(:,2)/sum(Ac(:,2));


% RMSdelaySpread = 0;
% for i = 1:size(h,2)
%     
%     RMSdelaySpread = RMSdelaySpread + ((i/fsample - meanDelay)^2 * h(i));
% 
% end
% 
% RMSdelaySpread = sqrt(RMSdelaySpread/sum(h))

RMSdelaySpread = sqrt(((Ac(:,1)-meanDelay).^2)'*Ac(:,2)/sum(Ac(:,2)));
 
sum(h(1,:))
x = filter(h,1,txsignal);


end

