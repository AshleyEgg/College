%Script HW3_q2
%
%This script plots the function f(x)=-0.5x^2+2.5x+4.5 and solves for its
%roots
%
%Outputs: Plot that displays the above function and its derivative
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW3
%Date: 9/24/2018

%Declaration of local variables
w0 = 0.25;                                  
E = 5 * 10^(8);
I = 3 * 10^(-4);
L = 6;
const = w0/(120*E*I*L);

x = 0:0.1:6;                                          %x values
dydx = const.*(-5.*(x.^4)+ 6.*(L^2).*(x.^2)-(L^4));   %dy/dx of the function

figure 
hold on
grid on
plot(x,dydx)
title('Derivative of the Linearly Distributed Load')
xlabel('x')
ylabel('f(x)')
hold off
