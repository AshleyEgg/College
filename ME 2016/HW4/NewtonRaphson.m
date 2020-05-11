function xr = NewtonRaphson(f,dfdx,xi,es,imax)
%This function implements a generic form of the bisection method for root
%finding
%
%Inputs:
%   f = function handle that defines the root finding problem
%   dfdx = function handle for derivative of function f
%   xi = initial guess
%   es = stopping criterion
%   imax = max number of allowable iterations
%
%Outputs:
%   xr = value of the root
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: HW4
%Date: 10/10/2018

%Initilize local variables
ea = es;
iter = 0;
dxi = dfdx(xi);
X = [xi];

while ea >= es && iter <= imax
    if dxi == 0
        error('The function stoped because dfdx = 0')
    end
    iter = iter + 1;                    %Increment iteration number
    xr = xi - (f(xi)/dxi);              %Calculate xr  
    X = [X xr];

    ea = abs((X(end)-X(end-1))/X(end))*100;   %Calculate ea
    
    xi = xr;
    dxi = dfdx(xi);
       
end

finalVal = f(xr);
fprintf('The approximate root %.10f was calculated after %i iterations and has a relative approximate percent error of %.10f"%"', xr, iter, ea)
fprintf('\nThe value of the approximate root in the final function is f(xr)=%i.', finalVal)
end