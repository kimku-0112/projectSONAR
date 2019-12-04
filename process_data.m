function [ output_time ,output_distance ] =  process_data( PLAYED, RECEIVED, SampleRate , sound_vel)

%_____PERFORMING THE CORRELATION BETWEEN THE RECEIVED SOUND ANDTHE ECHO__
CORRELATED_SOUND = xcorr(RECEIVED, PLAYED);

%_______________TRIMMING THE EXTRA DATA AFTER CORRELATION _________
%%since we know that in correlation of an n * n matrix the total no of 
% output produced is 2*n-1. But for comparing the sounds by the sample no 
% we have to keep the input and output same size. 
CORRELATED_SOUND = CORRELATED_SOUND( (SampleRate/2) : (SampleRate * 1.5) );



% maxAmp_out : Maximum of the samples for correlated data. 
% masAmpSamp_out : Index no of the sample with the maximum amplitude for input data. 
[maxAmp_out, maxAmpSamp_out] = max(CORRELATED_SOUND);
[maxAmp_in, maxAmpSamp_in] = max(PLAYED);




% delay calculation in seconds
delay = ( maxAmpSamp_out - maxAmpSamp_in )/SampleRate;
%
% Distance calculation in seconds. 
%
distance = (delay * sound_vel)/2; 

disp(strcat('The time delay is: ' , num2str(delay)));



%________________________DISPLAY DIFFERENT DATA COMPARISON_________________
%Displayig the comparison of the data.
%
display_monitor( PLAYED, RECEIVED, CORRELATED_SOUND );


%_______________________RETURN THE RESULT__________________________________ 
 output_distance = distance;
 output_time = delay;
end