%Script CP2
%
%This script plots the power coefficient versus the velocity as a
%continuous curve and power output based on month fitted with 2 spline
%curves
%
%Outputs: Figure 1 with a single continuous curve of the power coefficient
%versus the velocity and Figure 2 with data of power output based on month
%fitted with 2 splines
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: CP2
%Date: 10/25/2018

%Initilize local variables
vcin = 3;                           %cut in velocity (m/s)
vcout = 5;                          %cut out velocity (m/s)
d = 18;                             %blade diameter (m)
meff = 0.9;                         %mechanical efficiency
row = 1026;                         %density of seawater(kg/m^3)
load('velocity.mat');               %Load in your velcoity data
A = pi*d^2/4;                       %Calculate area

velocities = (linspace(vcin,vcout))';   %col vector of 100 linspaced points
v = @(Cp) (6.433*exp(-1.255*Cp))-(6*10^(-16)*exp(70*Cp)); %Define function handle for v
Cp = root_finder_vector(v,0.59,velocities);      %Calculates Cp's for velocities

%Plot power coefficients vs velocity
figure
hold on
grid on
plot(velocities,Cp)
title('Power Coefficient vs Velocity')
xlabel('Velocity (m/s)')
ylabel('Power Coefficient')
hold off

%Part B
pdf = normpdf(velocities,CapeSuckling(1,:),CapeSuckling(2,:));
fun = Cp.*(velocities.^3).*pdf;
integral = integrator(velocities,fun);
power = (A*row*meff/2).*integral;           %Calculate Power
month = 1:12;                               %Plot month
spx = linspace(1,12);
sp1 = spline(month,power,spx);              %Calculate the first spline

forwardDiff = (power(2)-power(1))/(spx(2)-spx(1));  %Forward Difference
backDiff = (power(end)-power(end-1))/(spx(end-1)-spx(end));%Backward Difference

sp2 = spline(month,[forwardDiff,power,backDiff],spx);   %Calculate second spline

%plot everything on figure 2
figure
hold on
grid on
scatter(month,power)
plot(spx,sp1)
plot(spx,sp2)
title('Projected Turbine Power as a Function of the Month')
xlabel('Month')
ylabel('Projected Power')
legend({'Discrete Data','Spline 1','Spline 2'},'Location','northwest')
hold off
