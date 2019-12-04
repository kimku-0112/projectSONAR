function [  ] =  display_monitor( played_audio, recorded_audio, correlated_audio )
%This function simply plots the three data sets so that visually
% it becomes very easy to understand the interdependency of the data and the validity. 

figure();
%Plotting the played audio signal
subplot(311);
plot(played_audio);
title('Played Audio');
xlabel('Sample Number');
ylabel('Amplitude');
axis tight; 
grid on;



%Plotting the recorded audio signal
subplot(312);
plot(recorded_audio);
title('Recorded Audio');
xlabel('Sample Number');
ylabel('Amplitude');
axis tight; 
grid on;


%Plotting the correlated audio signal
subplot(313);
plot(correlated_audio);
title('Correlated Audio');
xlabel('Sample Number');
ylabel('Amplitude');
axis tight; 
grid on;

end