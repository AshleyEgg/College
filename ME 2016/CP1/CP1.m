%Script CP1
%
%This script 
%   *fits a power law to velocity vs power data
%   *Prints the coefficients a and p associated with the above power law
%   *Calculates the power coefficient cp
%   *Fits a polynomial of order 3, 5, and 7 to the same data set\
%   *Fits a polynomial curve to data corresponding to the angular velocity 
%    vs magnification factor 
%
%Outputs: Figure 1: Plot of discrete data points and power law fit for
%         velocity vs power data
%         Figure 2: Plot of polynomial fit of order 3,5,and 7 to the same
%         data set
%         Figure 3: Plot of discrete data points and polynomial fit based
%         on angular velocity vs magnification factor data
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: Computer Project 1
%Date: 10/22/2018

%Initilize local variables and load files
load('power.mat');
load('vibration.mat');
ro = 1.225;                          %Air density in kg/m^3
d = 123;                             %Diameter of the wind turbine in m

%Section 5
figure 
hold on
grid on
scatter(v,P)
[a,b,r] = power_law(v(1:13),P(1:13),true);
hold off
fprintf('For the power law regression:\nThe coefficient a = %.6f.\nThe exponent p = %.6f.\nThe correlation coefficient r = %.6f\n',a,b,r)

%Calculation of Power Coefficient
Cp = a/((pi/8)*((d)^2)*ro);                   
fprintf('The calculated power coefficient Cp = %.6f\n', Cp)

%Section 6
figure 
hold on
grid on
scatter(v,P)
%m = 3
[A1,r1] = polynomial_regression(v,P,3,true);
fprintf('For the polynomial regression:\nThe correlation coefficient r = %.6f when m = 3\n',r1)
pause
clf(2)
%m = 5
[A2,r2] = polynomial_regression(v,P,5,true);
fprintf('The correlation coefficient r = %.6f when m = 5\n',r2)
pause
clf(2)
%m = 7
[A3,r3] = polynomial_regression(v,P,7,true);
fprintf('The correlation coefficient r = %.6f when m = 7\n',r3)
pause
hold off

%Section 8
figure 
hold on
grid on
scatter(omega,G)
X = (omega.^2)';                        %Compute change of variables for w
Y = (1./(G.^2))';                       %Compute change of variables for G
[A4,r4] = polynomial_regression(X,Y,2);
omegan = nthroot((1/A4(3)),4);          %Calculate the natural angular frequency
zita = sqrt((A4(2)*((omegan)^2)+2)/4);  %Calculate the nondimensional viscous damping factor
fprintf('The calculated natural angular frequency is %.6f rad/s.\n',omegan)
fprintf('The nondimensional viscous damping factor is %.6f\n',zita)

%Generate 100 linearly spaced data points to graph
wPlot = linspace(omega(1),omega(end));
denom1 = (1-((wPlot./omegan).^2)).^2;
denom2 = (2.*zita.*(wPlot./omegan)).^2;
GPlot = 1./(sqrt(denom1+denom2));
plot(wPlot,GPlot)
title('Magnification Factor vs Angular Frequency')
xlabel('Angular Frequency')
ylabel('Magnification Factor')
hold off







