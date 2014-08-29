function [x,y,z] = ADWI_Message()
% Actual Message data definition. Here,
% data can be read or otherwise generated.
% 
%Output:
%x : Vector containing message data
%y:  Message Sample Rate
%z:  No. of bits per message

[x y z]=wavread('SoundMessage.wav');

