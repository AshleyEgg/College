%Script HW4_q4
%
%This script plots the trajectory of a launched ball
%
%Outputs: Plot that displays the function
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW4
%Date: 10/10/2018

%Declaration of local variables
x = 40;         %x = 40m
y0 = 1.8;       %y0 = 1.8m
v0 = 20;        %v0 = 20 m/s
g = 9.81;       %g = 9.81m/s
y = 1;          %y = 1m

f = @(t0) tand(t0).*x - ((g.*(x.^2))./(2.*(v0.^2).*(cosd(t0).^2))) + y0 - y;  %t0 = theta
dfdx = @(t0) x.*(secd(t0).^2) - (g.*sind(t0).*(x.^2)) ./ ((v0.^2).*(cosd(t0).^3));
angles = 30:60;
 
zs = angles.*0;

figure 
hold on
grid on
plot(angles,f(angles))
plot(angles,zs,'k')
title('Theta versus the Trajectory Function')
xlabel('Theta(degrees)')
ylabel('Value of Trajectory Function')
hold off

xr = NewtonRaphson(f,dfdx,36,10^-6,1000);

options = optimset('Display','iter');
[root,FVAL,EXITFLAG,OUTPUT] = fzero(f,36,options)

