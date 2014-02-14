function Cs = Capacity(B,SNRdb,db)
% Calculate the capacity of a channel affected by AWGN, given the bandwidth 
% and the signal-to-noise ratio
% Capacity(B,SNR,db) returns the capacity in bps taking SNR as db/not db.
% Capacity(B,SNR) returns the capacity in bps taking SNR as db.
% db = 'y' or 'n'. 

switch nargin
    case 3
        if db == 'n'
            Cs = B*log2(1+SNRdb/B);
        else
            Cs = B*log2(1+10^(SNRdb/10)/B);
        end
    case 2
        Cs = B*log2(1+10^(SNRdb/10)/B);
    otherwise
end

end