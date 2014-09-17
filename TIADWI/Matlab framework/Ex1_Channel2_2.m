function [ x ] = Ex1_Channel2_2( txsignal,fsample,bitspersample )


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

% Convert amplitude to power
Ac = a;
Ac(:,2) = Ac(:,2).^2;

% Max delay is 8000 ns = 8 us
% Symbol time is 22.67 us
Ts = 1/fsample

% Since the maximum delay is less than the symbol time, we make the
% narrowband assumption: m(t-tau) = m(t).

upsamp = 250;
fc = 2.4 * 10^9;

lImp = ceil(max(a(:,1))*upsamp*fsample);

% Init impRes
impRes = zeros(lImp,1);

for i = size(a,1)
   
    impRes(round(a(i,1)*upsamp*fsample)) = a(i,2)*exp(-1*j*2*fc*a(i,1));
    
end

txUp = upsample(txsignal,upsamp); % upsample
txUp = filter(ones(1,upsamp),1,txUp); % LP filter

rxUp = filter(impRes,1,txUp); % Filter with channel
rxSignal = downsample(rxUp,upsamp); % Downsample to Baseband






% Mean delay is weigthed average:
meanDelay = Ac(:,1)'*Ac(:,2)/sum(Ac(:,2));

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

snr = 2; % SNR ratio in DB:
x = awgn(x,snr,'measured');
end

