function [ x ] = Ex1_Decoder3( RxEncodedData,fsample,bitspersample )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% x = (RxEncodedData+1)/2;
x = reshape(RxEncodedData, bitspersample, [])';
x(x>0) = 1;
x(x<=0) = 0;
x = bi2de(x,2);
x = x .* 2^-(bitspersample-1);
x = x - 1;

end