function [ input_channel, output_channel ] = get_audio_channels( )
% In this function the analog audio channels are created. 
% Here we can not use digital audio recording because it is not 
% possible to play and record in the digital audio recording method.
% Here the functions analoginput() and analogoutput() are the builtin
% function of the Data Acquisition Tool(DAT) of the MATLAB. 

%
% In order to use the Data Acquisition Tool(DAT) 32 bit version of the 
% MATLAB software is to be used. It is better to use MATLAB 2010 32 bit
% as some problem are faced in the new version of MATLAB 2015 32 bit. 
%


%% creating the analog audio input channel
ai=analoginput('winsound', 0);
addchannel(ai,1);



%% Creating the analog output output channel
ao=analogoutput('winsound', 0);
addchannel(ao, 1);



%% returning the channels
input_channel = ai;
output_channel = ao;

end