%Script HW3_q1a
%
%This script plots the function f(x)=-0.5x^2+2.5x+4.5 and solves for its
%roots
%
%Outputs: Plot that displays the above function and where it intersects the
%x-axis
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW3
%Date: 9/24/2018

x = -5:0.1:10;                      %x values
y = -0.5.*(x.^(2)) + 2.5.*x +4.5;   %y values
zs = zeros(1,151);                  %zero array to show axis line

figure 
plot(x,y)                           %plot the function
hold on
grid on
plot(x,zs,'k');                     %plot x axis
title('Graphical Representation of the Function')
xlabel('x')
ylabel('f(x)')
hold off