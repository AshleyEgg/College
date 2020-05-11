function [T,Y]= my_ODE_solver(odefun,tspan,y0,dt,method)
%This function implements both Euler's and Heun's method to solve ordinary
%differential equations
%
%Inputs:
%   odefun = function handel defining the ODE to solve
%   tspan = integration interval vector [t0 tf]
%   y0 = row vector of initial conditions
%   dt = the step size
%   method = string to specify Euler or Heun
%
%Outputs:
%   T = column vector of times at which solutions are computed
%   Y = the solution matrix
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: CP3
%Date: 11/18/2018

if tspan(1)>tspan(end)          %Throw error if invalid tspan
    error('Error. t0 must be less than tf\n')
end

T = (tspan(1):dt:tspan(end))';  %Create T col vector

if strcmp(method,'Euler')
    [Y]= Euler(odefun,dt,T,y0);   %Call Euler subfunction
elseif strcmp(method,'Heun')
    [Y]= Heun(odefun,dt,T,y0);    %Call Heun subfunction
else                            %Throw error if invalid method
    error('Please input Euler or Heun as your method.\n');
end
Y = Y';     %Invert final matrix to match ODE45 output
end

function [Y]= Heun(odefun,dt,T,y0) 
Y = y0';                        %Initilize Y matrix with initial values
for j = 2:length(T)             
    slope1 = odefun(T(j-1),Y(:,j-1));   %Calulate the first slope needed
    ycircle = Y(:,j-1) + dt*slope1;     %Predictor Equation
    slope2 = odefun(T(j),ycircle);      %Calculate the second slope needed
    y = Y(:,j-1)+(dt/2)*(slope1+slope2);%Corrector Equation
    Y = [Y,y];
end
end

function [Y]= Euler(odefun,dt,T,y0)
Y = y0';                        %Initilize Y matrix with initial values
for j = 2:length(T)
    slope = odefun(T(j-1),Y(:,j-1));    %Calculate the needed slope
    y = Y(:,j-1) + dt*slope;            %Eulers Equation
    Y = [Y,y];
end
end