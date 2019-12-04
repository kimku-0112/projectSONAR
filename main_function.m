function [time_delay, distance ]= main_function( )

%_____________________SETTING UP THE ANALOG CHANNELS______________. 
[channel_in, channel_out] = get_audio_channels();



%_____________________SETTING THE PARAMETERS______________________

N = 44100;								%no of sample taken per trigger
duration=1.0; 							% duration of recording in second
SampleRate=44100; 						%sampling rate of recording
set([channel_in channel_out], 'SampleRate', SampleRate); %setting up sample rate for both the input and output
set(channel_in,'SamplesPerTrigger',N)    %input is taken after the trigger
sound_velocity = 343; 					%velocity of sound at room temperature metre/second. 


%% setting the input and output audio channels with appropriate sound data. 
played = sound_beep(SampleRate);
%set the audio data in the output channel. 
putdata(channel_out,played);


%__________________START PLAYING AND RECORDING SIMULTANEUSLY______________.  
start([channel_in channel_out]);

%____________________COLLECT DATA FROM INPUT CHANNELS_______________. 
received = getdata(channel_in);




%_____________________________DATA PROCESSING AND CALCULATIONS_____________
% Processing the data in order to find the delay and then finding the 
% distance of the target from the source. 
%
[t_del, result] = process_data( played, received, SampleRate , sound_velocity);

%___________________PRINT THE OUTPUT (DISTANCE)______________________________
disp(strcat('The distance of the target from the soruce is : ' , num2str(result)));
distance = result; 
time_delay = t_del;
end