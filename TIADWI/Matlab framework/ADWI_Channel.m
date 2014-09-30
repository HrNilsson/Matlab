function [x] = ADWI_Channel(txsignal,fsample,bitspersample)
%
%   Channel definition. Output is delivered to receiver
%   so the block should include all channel effects: noise,
%   interference and fading. Output is an analog signal.
%
%   Output:
%   x : Channel output.
%

%x = Ex1_Channel1(txsignal,fsample,bitspersample);
% x = Ex1_Channel2_2(txsignal,fsample,bitspersample);
% x = Ex1_Channel3(txsignal,fsample,bitspersample);
x = Ex2_Channel1_Rene(txsignal,fsample,bitspersample);

% x=txsignal;