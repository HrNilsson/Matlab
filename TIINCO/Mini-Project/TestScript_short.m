% Test script
clear; clc;
n = 7; k = 4; r = n-k;
syms x;
genPol = 1 + x + x^3;
genVec = pol2polvec(genPol)
message = [0 1 0 1];
codeWord = cyclicEncode(genPol,message)
error = [0 0 0 1 0 0 0]

[0     1     1;
 1     1     1;
 1     0     1]

receiveVector = mod(codeWord + error,2)

H = cyclgen(n,genVec);

Rx = polvec2pol(receiveVector);
s8 = mod(receiveVector*H',2)

syndromeReg = zeros(1,r);
bufferReg = zeros(1,n);
codeVector = zeros(1,n);
errSyndTable = [1 0 1];
errorDetected = 0;
errorGated = 0;

for i = 1:n*2
    % Output codeVector
    codeVector = circshift(codeVector,[1 1]);
    if(i > n)
        codeVector(1) = mod(bufferReg(end) + errorDetected,2);
    end

    %Update syndrome register
    syndromeGate = syndromeReg(end);

    syndromeReg(end) = syndromeReg(end-1);
    for j = 2:r-1
        syndromeReg(r+1-j) = mod(syndromeReg(r-j) + syndromeGate*genVec(r-j),2);
    end
    
    if(i > n)
        syndromeReg(1) = mod(receiveVector(n) + errorDetected + syndromeGate*genVec(1),2);
    else
        syndromeReg(1) = mod(receiveVector(n) + syndromeGate*genVec(1),2);
        disp('less')
    end
    
%     for j = 1:n
        if(errSyndTable == syndromeReg)
            errorDetected = 1;
        else
            errorDetected = 0;
        end
%     end
    
    b = [receiveVector(n) syndromeReg syndromeGate]

    % Buffer register update
    bufferReg = circshift(bufferReg,[1 1]);
    bufferReg(1) = mod(receiveVector(n) + codeVector(1),2);
    
    % Receive vector update
    receiveVector = circshift(receiveVector,[1 1]);
    receiveVector(1) = 0;
    pause;
end
