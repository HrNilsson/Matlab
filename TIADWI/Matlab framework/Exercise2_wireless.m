clear, close all ; 
% Sound load, Noise load, Echoes
[x, FsX, nBit]=wavread('SoundMessage.wav');
x=x';

% Fs Carrier
FsC=2.4*10^9; % 2.4 GHZ 

DA=[1 1;32 1;64 1;96 1;128 1;160 1];

Tau=DA(:,1); % delay unit in us 
Alfa=DA(:,2);
Tau=Tau/10^6; % convert delay unit to "second"


%% Channel impulse response

CIR=zeros(length(x),1)';
for n=1:length(Tau)
    
if n==1
CIR(n)=Alfa(n); 

else 
CIR(round(Tau(n)*FsC)+1)=Alfa(n);

end 
end
figure(1)
plot(CIR,'s-');

x(end:length(CIR))=0 ; % add zeros to x so the length of CIR and x is the same 


%% Channel frequency response
Hc=fft(CIR);
figure(2)
plot(abs(Hc(1:10^2+10^2)));

%% Amplitude modulation
xAm=(1+x).*cos(2*pi*FsC); 
Hc_xAm = fft(xAm); 

%% Simulation
CFO = Hc_xAm.*Hc; % channel frequency output 
CTO = ifft(CFO) ; % channel time output 

CTO = CTO - mean(CTO); 

sound=audioplayer(CTO,FsX);
sound.play;

%% Equalizer - Zero Forcing 

Heq = 1./Hc ; % Zero Forcing princip 

Heq_out = CFO.*Heq ; % equalizer freq. output 

ETO = ifft(Heq_out); % equalizer time output 

sound=audioplayer(ETO,FsX);
sound.play;

%% Adding noise to the signal 
xNoise=wgn(1,length(x),-50); 
sk=1; % Noise skalar --> Higher Skalar gives Lower SNR! 
xNoise=xNoise.*sk;

xAm = xAm + xNoise ; % white noise is now added 




