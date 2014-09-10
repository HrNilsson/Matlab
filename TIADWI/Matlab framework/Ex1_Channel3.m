function [ x ] = Ex1_Channel3( txsignal,fsample,bitspersample )


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
% See mathcad document Ex2.xmcd for calculation of transfer function:
h = abs(3.3-i*4.4076026506002340748e-15);

% Mean delay is weigthed average:
meanDelay = Ac(:,1)'*Ac(:,2)/sum(Ac(:,2));

% RMS delay spread
RMSdelaySpread = sqrt(((Ac(:,1)-meanDelay).^2)'*Ac(:,2)/sum(Ac(:,2)));
 
% Coherent bandwidth:
Bc = 1/RMSdelaySpread
% Note Bc = 388kHz >> B = 44.1kHz, which agrees with the narrowband
% assumption.

x = filter(h,1,txsignal);

% Adding AWGN to the signal: 
% Note: Using -15 dB is barely hearable 
% Changing SNR does not change BER.

snr = 5; % SNR ratio in DB:
% x = awgn(x,snr,'measured');
end

