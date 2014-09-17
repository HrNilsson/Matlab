function [x] = ADWI_Framework_Channel(txsignal,fsample,bitspersample)
%
%   Channel definition. Output is delivered to receiver
%   so the block should include all channel effects: noise,
%   interference and fading. Output is an analog signal.
%
%   Output:
%   x : Channel output.
%

echoes=[0.5e-6 1.4e-6 1.8e-6 2.3e-6 5e-6 8e-6; 0.5 0.5 0.4 0.5 0.8 0.6]; 
echoes(2,:)=echoes(2,:)/sum(echoes(2,:)); % Normalize ampl.!

% Observe the need for upsampling !!!
% 250 times upsampling is selected -> better than 0.1 us resolution ! 
upsamp=250;

fc=2.4e9;

EchoVec=zeros(round(echoes(length(echoes)))*upsamp*44100,1);

for i=1:length(echoes) EchoVec(round(echoes(1,i)*upsamp*44100),1)=echoes(2,i)*exp(-1*j*2*fc*echoes(1,i)); end;

tempwav=conv(ones(upsamp,1),upsample(txsignal,upsamp));
tempsignal=conv(EchoVec,tempwav);
x=downsample(tempsignal,upsamp);
