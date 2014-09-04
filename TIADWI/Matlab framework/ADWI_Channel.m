function [x] = ADWI_Framework_Channel(txsignal,fsample,bitspersample)
%
%   Channel definition. Output is delivered to receiver
%   so the block should include all channel effects: noise,
%   interference and fading. Output is an analog signal.
%
%   Output:
%   x : Channel output.
%

addpath('..\Exercise1');

x = Ex1_Channel1(txsignal,fsample,bitspersample);

% x=txsignal;