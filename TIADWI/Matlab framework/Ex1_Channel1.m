function [ x ] = Ex1_Channel1( txsignal,fsample,bitspersample )


% Delay profile [Delay / Amplitude weight ]
a = [
    300     0.4 ;
    350     0.2 ;
    400     0.1 ;
    450     0.1 ;
    800     0.04
    ];

% Scale for correct time unit
a(:,1) = a(:,1)*10^-3  % 10^-3 ms ; 10^-6 µs ; 10^-9 ns


maxDelay = max(a(:,1));

nDelayTaps = maxDelay * fsample;
nPath = size(a,1);

h = zeros(1,nDelayTaps);

for i = 1:nPath
   
    h(floor(a(i,1)*fsample)) = a(i,2);
    
end
    
t = 0:maxDelay/nDelayTaps:maxDelay-maxDelay/nDelayTaps;

H = fft(h);

figure(1)
subplot(211)
stem(t,h);
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

meanDelay = a(:,1)'*a(:,2)/sum(a(:,2))


% RMSdelaySpread = 0;
% for i = 1:size(h,2)
%     
%     RMSdelaySpread = RMSdelaySpread + ((i/fsample - meanDelay)^2 * h(i));
% 
% end
% 
% RMSdelaySpread = sqrt(RMSdelaySpread/sum(h))

RMSdelaySpread = sqrt(((a(:,1)-meanDelay).^2)'*a(:,2)/sum(a(:,2)))

Bc = 1/RMSdelaySpread
 
x = filter(h,1,txsignal);


f = 0:0.1:fsample;

H1 = sum(a(:,2)*exp(-1j*2*pi*f*a(:,1)))

for i = 0:numel(f)
    
    
end

subplot(212)
plot(f,H1)


end

