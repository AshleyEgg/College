%Script: HW0
%
%This script solves the parachutist problem approached in class by ploting 
%the exact solution for the velocity from t=0 to t=25,
%using a smooth continuous line. It also calls the Euler function and plots
%the approximate solution for step sizes of 2s, 1s, and 0.5s using discrete
%points.
%
%Outputs: Plots the exact solution using a continuous line as well as three
%different approximate solutions based on different step sizes using
%discrete points. It also displays the approximate value of the velocity of
%the parachutist at the final time based on the 0.5s step size.
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW0
%Date: 8/26/2018

g = 9.81; %Gravity
m = 68.1; %Mass
c = 12.5; %Drag Coefficient

%Exact Solution
t = 0:0.1:25;
v = (g*m/c)*(1-exp(-c/m*t));

%Approximate Solution Step Size: 2s
[TOUT1, YOUT1] = Euler(@para,0,0,25,2);

%Approximate Solution Step Size: 1s
[TOUT2, YOUT2] = Euler(@para,0,0,25,1);

%Approximate Solution Step Size: 0.5s
[TOUT3, YOUT3] = Euler(@para,0,0,25,0.5);

%Plot all the points calculated aboce
figure 
plot(t,v)
hold on;
scatter(TOUT1,YOUT1,6,'r','filled')
scatter(TOUT2,YOUT2,6,'g','filled')
scatter(TOUT3,YOUT3,6,'y','filled')
title('Falling Parachutist Velocity as a Function of Time')
xlabel('Time[sec]')
ylabel('Velocity[m/sec]')
legend({'Exact Solution','Approx. Solution(2 sec)','Approx. Solution(1 sec)','Approx. Solution(0.5 sec)'},'Location','southeast')
hold off;

fprintf('The approximate value of the speed of the parachutist based on the approximate solution with a step size of 0.5s at 25s is %.4g m/s',YOUT3(end))
