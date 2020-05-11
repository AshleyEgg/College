%Script CP3
%
%This script analyze the maximum displacement of a wind turbine over a wide
%range of frequencies to determine the resonance frequency and amplitude
%
%Outputs: Figure 3: Maximum displacemnet vs forcing frequency plot
%         Resonanace frequency and amplitude printed to command line
%         Figure 1: Displacement vs Time graph using ODE45 at the resonance
%         frequency
%         Figure 2: Step size vs step number graph for ODE45 at the
%         resonance frequency.
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: CP3
%Date: 11/18/2018

freqs= 0.1:0.02:4;                  %Create vector of frequencies
response= zeros(length(freqs),1);   %Initilize vector
for i = 1:length(freqs)
    shakemax = towershake(freqs(i),'ODE45');
    response(i)=shakemax;
end

%Plot Maximum displacment as a function of frequency
figure(3)                  %Figure 3
grid on
plot(freqs,response)
title('Maximum Displacement vs Frequency')
xlabel('Frequency [Hz]')
ylabel('Displacement [m]')

%Find the resonance frequency and amplitude
resAmp = max(response);
resFreq = freqs(response==resAmp);
fprintf('The resonance frequency is %f Hz and has a resonance amplitude of %f m \n',resFreq,resAmp)

%Call towershake with the resonacne frequency
shakemax = towershake(resFreq,'ODE45','true');