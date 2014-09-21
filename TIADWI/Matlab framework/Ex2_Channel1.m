function [ x ] = Ex2_Channel1( txsignal,fsample,bitspersample )

% Delay profile [Delay / Amplitude weight ]
a = [
    0   1 ;
    32  1 ;
    64  1 ;
    96  1 ;
    128 1 ;
    160 1 
    ];

% a = [
%     0   1 ;
%     22.67  1 ;
%     2*22.67  1 ;
%     3*22.67  1 ;
%     4*22.67 1 ;
%     5*22.67 1 
%     ];

% Scale for correct time unit
a(:,1) = a(:,1)*10^-6  % 10^-3 ms ; 10^-6 µs ; 10^-9 ns

% Convert amplitude to power
Ac = a;
Ac(:,2) = Ac(:,2).^2;

% Max delay is 160 us
% Symbol time is 22.67 us
Ts = 1/fsample

upsamp = 100;
fc = 2.4 * 10^9;

lImp = ceil(max(a(:,1))*upsamp*fsample);

% Init impRes
impRes = zeros(lImp,1);

for i = 1:size(a,1)
   
    impRes(floor(a(i,1)*upsamp*fsample)+1) = a(i,2)*exp(-1*j*2*fc*a(i,1));
    
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

x = rxSignal;

% Adding AWGN to the signal: 
% Note: Using -15 dB is barely hearable 
% Changing SNR does not change BER.

% snr = 2; % SNR ratio in DB:
% x = awgn(x,snr,'measured');
end

