%% System model:
clear;clc

% Input message data
[TxMessage, MessageSampleRate,BitsPerMessage] = ADWI_Message();

% Encode message
[TxEncodedData]=ADWI_Encoder(TxMessage,MessageSampleRate,BitsPerMessage);

% Modulate message
[TxSignal]=ADWI_Modulator(TxEncodedData,MessageSampleRate,BitsPerMessage);

% Simulate channel
[RxSignal]=ADWI_Channel(TxSignal,MessageSampleRate,BitsPerMessage);

% Demodulate message
[RxEncodedData]=ADWI_Demodulator(RxSignal,MessageSampleRate,BitsPerMessage);

% Decode demodulated message
[RxMessage]=ADWI_Decoder(RxEncodedData,MessageSampleRate,BitsPerMessage);


% Playback reconstructed message:
    % wavplay(RxMessage,MessageSampleRate);
% soundsc(RxMessage,MessageSampleRate);
player = audioplayer(RxMessage, MessageSampleRate);
player.play;


%Various manipulations and presentations

% Bit error rate (BER):
% BitErrorVector = xor(TxEncodedData, RxEncodedData);
% BER = sum(BitErrorVector) / length(TxEncodedData)
