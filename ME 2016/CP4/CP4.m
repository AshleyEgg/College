%Script CP4
%
%This script calls torsion and plots the twist angle as a function of
%position and prints the maximum twist angle. This script also finds the
%required length of the shaft so that the maximum twist angle does not
%exceed 2 degrees and plots the subplots from torsion.
%
%Outputs: Figure 1: Twist angle a function of position when L=2
%         Figure 2: Subplots from torsion showing when maximum twist anlge
%         does not exceed 2 degrees
%         Max twist angle and required length of the shaft to not exceed 2 degree twist in command window
%
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: CP4
%Date: 12/3/2018

%Plot in figure 1 the results for a length of 2 meters
figure(1);
maxtwist = torsion(2);
fprintf('The maximum twist angle for a shaft of length 2 meters is %f.\n',maxtwist);

%Plot in figure 2 the results with a max twist angle of 2 degrees
figure(2);
torsion2 = @(x) torsion(x)- 2;
x = fzero(torsion2,1);      %Make it into a root finding problem
clf;                        %Used because fzero plots everytime torsion is called so it clears before plotting the final answer
maxtwist2 = torsion(x);
fprintf('The maximum rod length is %f for a maximum twist angle of 2 degrees.\n',x);

