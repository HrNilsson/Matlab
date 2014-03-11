function [ codeVector, errorVector, tag, bufferReg, syndromeReg ] = cyclicDecode( receiveVector, genPol, n, k)
% Meggit Decoder

r = degree(genPol);
n1 = numel(receiveVector);
k1 = n1-r;
if(n1 ~= n || k1 ~= k)
   error('The received vector and the generator polynomium does not correspond to the values of n and k'); 
end

% Generator polynomium in vector form:
genVec = pol2polvec(genPol);

% 'Registers' initialization:
bufferReg = zeros(1,n); % Buffer register
codeVector = zeros(1,n); % Corrected output
errorVector = zeros(1,n); % Calculated errors
syndromeReg = zeros(1,r); % Syndrome register
errorDetected = 0; % Error detection 'gate'
tag = 'Not set'; % Correctable/Uncorrectable tag.
% Syndrome vector table used for comparison with the syndromeReg
errSyndTable = generateErrExpr(n, genPol);

for i = 1:n*2
    % Output codeVector shifting
    codeVector = circshift(codeVector,[1 1]);
    if(i > n) % After the received vector is shifted into the buffer.
        codeVector(1) = mod(bufferReg(end) + errorDetected,2);
    end

    %Update syndrome register:
    syndromeGate = syndromeReg(end);

    % SyndromeGate feedback and shifting:
    for j = 1:r-1
        syndromeReg(r+1-j) = mod(syndromeReg(r-j) + syndromeGate*genVec(r+1-j),2);
    end
    
    % The errorDetected feedback is only used after the buffer have been
    % filled:
    if(i > n)
        syndromeReg(1) = mod(receiveVector(n) + errorDetected + syndromeGate*genVec(1),2);
    else
        syndromeReg(1) = mod(receiveVector(n) + syndromeGate*genVec(1),2);
    end
    
    % Compare syndrome register with syndrome vector table:
    for j = 1:n
        if(isequal(errSyndTable(j,:),syndromeReg))
            errorDetected = 1;
            if(i >= n)
                errorVector(2*n-i) = 1;
            end
            break;
        end
        errorDetected = 0;
    end

    % Buffer register shifting and feedback:
    bufferReg = circshift(bufferReg,[1 1]);
    bufferReg(1) = mod(receiveVector(n) + codeVector(1),2);
    
    % Receive vector shifting:
    receiveVector = circshift(receiveVector,[1 1]);
    receiveVector(1) = 0;
end
% Update tag:
if(isequal(syndromeReg,zeros(1,r)))
    tag = 'Correctable';
else
    tag = 'Uncorrectable error';
end

end
