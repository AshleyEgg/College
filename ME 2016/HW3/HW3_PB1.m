%Script HW3_PB1
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
%Date: 9/26/2018

y = @(x) -0.5.*(x.^(2)) + 2.5.*x +4.5;   %Define function handle

[xr,iter,X] = Bisection(y,5,10,10^-6,100); %Evaluate Bisection method

true = 2.5 + sqrt((2.5^2 - 4*(-0.5*4.5)));  %True root value

etArray = abs((true-X)./true).*100;

iters = 1:iter;
hold on
semilogy(iters,etArray,'r')
legend({'Relative Approximate Percent Error','True Percent Relative Error'},'Location','southeast')
