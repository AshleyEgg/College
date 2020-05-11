%Script: HW2_q3
%
%This script plots sin(x) for -pi<=x<=pi and plots the MacLaurin series
%expansion for sin(x) using 1,2,3, and 4 terms over the same range.
%
%Outputs: Plots of sin(x) and plots of the MacLaurin series expansion for
%sin(x) using 1,2,3, and 4 terms.
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW2
%Date: 9/19/2018

x = -pi:0.1:pi; % -pi to pi with step size of 0.1
y = sin(x);

m1 = x;
m2 = m1 - ((x.^3)/factorial(3));
m3 = m2 + ((x.^5)/factorial(5));
m4 = m3 - ((x.^7)/factorial(7));

figure 
plot(x,y,'k')
hold on;
plot(x,m1,'r')
plot(x,m2,'g')
plot(x,m3,'y')
plot(x,m4,'b')
title('MacLaurin Series Expansion for sin(x)')
xlabel('x')
ylabel('sin(x)')
legend({'Exact Solution','1 Term MacLaurin Series','2 Term MacLaurin Series','3 Term MacLaurin Series','4 Term MacLaurin Series'},'Location','southeast')
hold off;