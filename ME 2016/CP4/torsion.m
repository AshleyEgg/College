function maxtwist = torsion(L)
%This function calculates the max imum twist angle as a function of the
%shaft length
%
%Inputs:
%   L = shaft length
%
%Outputs:
%   maxtwist = maximum twist angle
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: CP4
%Date: 12/3/2018

%Intilize local variables
n = 4;
D0 = 0.2;           %m
ro = 2700;          %kg/m^3
f = 3;              %Hz
w = 2*pi*f;         %Radians
G = 24* 10^9;       %Pa
TL = 2 * 10^5;      %N*m
B = (512*TL)/(81*pi*G*D0^4);

%Call finite difference with n = 4
[nodes1,theta1] = finite_difference(n);
subplot(2,1,1);
hold on;
grid on;
theta1 = rad2deg(theta1);       %Convert to degrees
plot(nodes1,theta1, '-o');
title('Twist Angle as a Function of Position Along the Shaft')
xlabel('Position Along the Shaft (m)')
ylabel('Twist Angle (degree)')
hold off;

rel = 10;       
maxprev = max(theta1);      %Initiate the prev max
while rel >= 0.001          %While the relative error is greater than 0.1%
    n = 2*n;
    [nodes2,theta2] = finite_difference(n);
    maxcurr = max(theta2);  
    rel = (maxcurr-maxprev)/maxcurr;    %Calulate the rel error
    maxprev= maxcurr;
end
hold on;
theta2 = rad2deg(theta2);       %Convert to deg
plot(nodes2,theta2,'-o');
legend('4 segments',[num2str(n),' segments'],'Location','southeast');
hold off;

%Set up bvp4c
solinit = bvpinit(nodes2,[0,B]);
options = bvpset('RelTol', 10e-4, 'AbsTol', 10e-7);
sol = bvp4c(@twist_BV,@twist_BC,solinit,options);

%Plot data in second subplot from bvp4c
subplot(2,1,2);
plot(sol.x,rad2deg(sol.y(1,:)));
grid on;
title('Twist Angle as a Function of Position Along the Shaft from BVP4C')
xlabel('Position Along the Shaft (m)')
ylabel('Twist Angle (degree)')
%Set maxtwist to max twist angle
maxtwist = max(rad2deg(sol.y(1,:)));

%Set up finite difference function
function [nodes,theta] = finite_difference(n)
    %Declare variables
    h = L/n;
    A =(ro*(w^2)*(h^2))/G;
    M = zeros(n,n);
    V = zeros(n,1);
    %For the entire matrix fill it in with the correct values
    for i = 1:n
        for j = 1:n
            if i == j          
                M(i,j) = A-2;
            elseif j == i+1
                M(i,j) = 1+(h/L)*(1+(i/(2*n)))^(-1);
            elseif j == i-1
                M(i,j) = 1-(h/L)*(1+(i/(2*n)))^(-1);
            end
        end
    end
    M(n,n-1) = 2;
    V(n) = -2*h*B*(1+(h/L)*(1+(i/(2*n)))^(-1));
    theta = M\V;
    theta = [0;theta];
    nodes = (0:h:L)';           
end

%Set up function for bvp4c
function dydx = twist_BV(x,y)
    dydx = zeros(2,1);
    dydx(1) = y(2);
    dydx(2) = ((-2/L)*(1+(x/(2*L)))^(-1)*y(2))-((ro*(w^2))/G)*y(1);
end

%Set up function for bvp4c
function res = twist_BC(ya,yb)
   res = zeros(2,1);
   res(1) = ya(1)-0;
   res(2) = yb(2)-B;
end
end