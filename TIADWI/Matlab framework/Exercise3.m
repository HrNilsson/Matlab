clear; clc;
%% Convolotional code
% Code rate=1/2, C1 =S1?S2?S3, C2=S1?S3 (n=2, k=1, K=3)
n = 2;
k = 1;
K = 3;
Rc = k/n; % Code rate
inputLength = 10000;
input = randi([0 1], [1 inputLength]); 
encodedData1 = zeros(1,(inputLength)/Rc);
state = zeros(1,3);
% Manual encoding
for j = 1:inputLength
   state = circshift(state,[0,1]);
   state(1) = input(j);
   encodedData1(2*j-1) = mod(state(1)+state(2)+state(3),2); % C1
   encodedData1(2*j) =  mod(state(1)+state(3),2); % C2
end

%% Encoding using trellis:
trellis = poly2trellis(3,[7 5]);
encodedData2 = convenc(input,trellis);

% Is our method equal to convenc?: -> Of course it is ;)
[numErr1, BER1] = biterr(encodedData1, encodedData2) % number of bit errors and Bit Error Rate

%% Adding bit errors:
BER = 10^(-4);
noiseEncoded = mod(encodedData2 + randerr(1, length(encodedData2),BER*length(encodedData2)),2); % Add noise.

[numErr2, BER2] = biterr(encodedData2, noiseEncoded)
%% Viterbi decoding
tblen = 3; % Traceback length 
decodedData = vitdec(noiseEncoded,trellis,tblen,'cont','hard'); %Hard decision

% Does input and decoded message match?:
% Note the decoded output is delayed tblen samples.
[numErr3, BER3] = biterr(input(1:end-tblen), decodedData(tblen+1:end))

%% Notes:
% c) Introducing a BER = 10^-4 is not enough to cause decoding errors.(This
% corresponds to two errors in our encoded data sequence.)
% d) Somewhere between 10^-3 and 10^-4 is an appropriate BER value, when no
% deooding errors are acceptable.