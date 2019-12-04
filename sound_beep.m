function [ output_args ] = sound_beep( F_sample)
%sound_beep is the funcion that generates a beep sound which is 
%	used as the ping of the sonar system. This sound will be played 
%	so that echo of this sound can be captured and that can be processed. 
%   Detailed explanation goes here
%
%
% F_sample is the supplied sampling frequency. 
%
%

%_____________________SETTING_SOUND_PARAMETERS____________________________					
tt = 0:1/F_sample:1-1/F_sample ; 		%The time sequence of the generated sound;
freq = 400;					%Frequency of the sound
f2 = sin(2*pi*(2*freq)*tt);	%Generating the sound data; 


%________________MAKING THE SOUND AS A SPIKE___________________________
% Here the uniform sound is made like a spike so that it becomes easier
% to visualize them in the plot as well as correlation becomes meaningful. 
% Otherwise the received sound can be matched immediate sample. 
%
a = length(f2);
hm = blackman(a);		% blackman window of equal size to make the sound spike like. 
hm = hm';				% Feel free to use your own idea to make the spike more distinguishable. 




%multiplying repeated time in order to make the spike sharper.  
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;
f2 = f2.*hm;



% Amplifying the sound a little bit for a strong signal. 
f2 = f2*8;



%returning the generated sound. 
output_args = f2';
end