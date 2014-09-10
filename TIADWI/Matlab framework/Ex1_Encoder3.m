function [ x ] = Ex1_Encoder3( message,fsample,bitspersample )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x = message + 1;
x = x .* 2^(bitspersample-1);
x = de2bi(x,bitspersample);
x = reshape(x',[],1);

end

