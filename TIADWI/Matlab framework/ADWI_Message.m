function [x,y,z] = ADWI_Message()
% Actual Message data definition. Here,
% data can be read or otherwise generated.
% 
%Output:
%x : Vector containing message data
%y:  Message Sample Rate
%z:  No. of bits per message

% wavFileName = 'SoundMessage.wav';
wavFileName = 'ReducedWav.wav';

% [x y z]=wavread(wavFileName);
[x, y] = audioread(wavFileName);
info = audioinfo(wavFileName);
z = info.BitsPerSample;


