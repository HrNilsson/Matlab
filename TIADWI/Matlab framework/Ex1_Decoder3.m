function [ x ] = Ex1_Decoder3( RxEncodedData,fsample,bitspersample )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x = reshape(RxEncodedData, bitspersample, [])';
x = bi2de(x,bitspersample);
x = x .* 2^-(bitspersample-1);
x = x - 1;

end