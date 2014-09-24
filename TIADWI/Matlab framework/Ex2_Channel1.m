function [ x ] = Ex2_Channel1( txsignal,fsample,bitspersample )

% Symbol time is 22.67 us
Ts = 1/fsample

% Delay profile [Delay / Amplitude weight ]
% a = [
%     0   1 ;
%     32  1 ;
%     64  1 ;
%     96  1 ;
%     128 1 ;
%     160 1 
%     ];

a = zeros(6,2);
a(:,1) = [1:6].*Ts;
a(:,2) = ones(1,6)

% Scale for correct time unit
% a(:,1) = a(:,1)*10^-6  % 10^-3 ms ; 10^-6 µs ; 10^-9 ns

% Scale time
a(:,1) = a(:,1)*100;

% Convert amplitude to power
Ac = a;
Ac(:,2) = Ac(:,2).^2;

% Max delay is 160 us


upsamp = 10;
fc = 2.4 * 10^9;

lImp = ceil(max(a(:,1))*upsamp*fsample);

% Init impRes
impRes = zeros(lImp,1);

for i = 1:size(a,1)
   
    impRes(floor(a(i,1)*upsamp*fsample)+1) = a(i,2);
    
end

txUp = upsample(txsignal,upsamp); % upsample
txUp = filter(ones(1,upsamp),1,txUp); % LP filter

rxUp = filter(impRes,1,txUp); % Filter with channel
rxSignal = downsample(rxUp,upsamp); % Downsample to Baseband


% Mean delay is weigthed average:
meanDelay = Ac(:,1)'*Ac(:,2)/sum(Ac(:,2))

% RMS delay spread
RMSdelaySpread = sqrt(((Ac(:,1)-meanDelay).^2)'*Ac(:,2)/sum(Ac(:,2)))
 
% Coherent bandwidth:
Bc = 1/RMSdelaySpread
% Note Bc = 388kHz >> B = 44.1kHz, which agrees with the narrowband
% assumption.

% figure(1)
% subplot(211)
% Himp = fft(impRes);
% plot([0:fsample*upsamp/lImp:fsample*upsamp],abs(Himp))
% % plot(abs(Himp))
% subplot(212)

x = rxSignal;

% Adding AWGN to the signal: 
% Note: Using -15 dB is barely hearable 
% Changing SNR does not change BER.

% snr = 2; % SNR ratio in DB:
% x = awgn(x,snr,'measured');
end

