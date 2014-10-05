function [ x ] = Ex2_Channel1_Rene( txsignal,fsample,bitspersample )

% Symbol time is 22.67 us
Ts = 1/fsample

% Delay profile [Delay / Amplitude weight ]
a = zeros(6,2);
a(:,1) = [0:5].*Ts;
a(:,2) = ones(1,6);
a(:,2) = a(:,2)/size(a,1);

% Scale time
a(:,1) = a(:,1)*100

% Channel impulse response
lImp = ceil(max(a(:,1))*fsample+1);
impRes = zeros(lImp,1);
for i = 1:size(a,1)
    impRes(round(a(i,1)*fsample)+1) = a(i,2);
end
figure(1)
subplot(2,2,1);
x = linspace(0,max(a(:,1)),length(impRes));
plot(x,impRes,'-');
title('Channel impulse response')
xlabel('Time (s)')
ylabel('Amplitude')


% Channel frequency response
% Tip: Always pad zeros to "power-of-2" number of elements
PaddedLength=2^nextpow2(length(impRes));
Hch=fft(impRes,PaddedLength);
f=(fsample/2)*linspace(0,1,(PaddedLength/2)+1);
subplot(2,2,2);
plot(f,20*log10(2*abs(Hch(1:(PaddedLength/2)+1))))
title('Channel transfer function')
xlabel('Frequency (Hz)')
ylabel('20log(|Hc(f)|)')

% Channel time output
ych = conv(txsignal,impRes,'same');

% Adding AWGN to the signal: 
% snr = 5; % SNR ratio in dB:
% ych = awgn(ych,snr,'measured');

% Play original sound
sound=audioplayer(txsignal,fsample);
sound.play;
pause;

% Play channel modified sound
sound=audioplayer(ych,fsample);
sound.play;

% Zeroforcing equalizer frequency response
Heq = 1./Hch;
subplot(2,2,4);
plot(f,20*log10(2*abs(Heq(1:(PaddedLength/2)+1))))
title('Equalizer transfer function')
xlabel('Frequency (Hz)')
ylabel('20log(|Hc(f)|)')

% Remove NaN's and Inf's
k = isinf(Heq) | isnan(Heq);
no = 0;
for j = 1:length(Heq)
    if k(j) == 1
        Heq(j) = 1;
        no = no + 1;
    end
end
if(no ~= 0)
    warning('Equalizer transfer function contained NaN or Inf: %d occurence(s)',no)
end

% Zeroforcing equalizer impulse response
heq = ifft(Heq);
subplot(2,2,3);
x = linspace(0,max(a(:,1)),length(heq));
plot(x,heq,'-');
title('Equalizer impulse response')
xlabel('Time (s)')
ylabel('Amplitude')

yeq = conv(ych,heq,'same');

x = yeq;
pause;

end

