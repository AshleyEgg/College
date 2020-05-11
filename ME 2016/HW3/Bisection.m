function [xr,iter,X] = Bisection(f,xl,xu,es,imax)
%This function implements a generic form of the bisection method for root
%finding
%
%Inputs:
%   f = function handle that defines the root finsing problem
%   xl = lower initial value
%   xu = upper initial value
%   es = stopping criterion
%   imax = max number of allowable iterations
%
%Outputs:
%   xr = value of the root
%   iter = the number of iterations used to calculate the root
%   X = a vector contating all of the approx root values for each iteration
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: HW3
%Date: 9/24/2018

%Initilize local variables
ea = es;
iter = 0;
X = [];
eArray = [];
fxl = f(xl);
fxu = f(xu);

while ea >= es && iter <= imax && (fxl*fxu)<=0
    iter = iter + 1;
    xr = (1/2)*(xl + xu);               %Calculate xr
    X = [X xr];                         %Add xr onto the end of array X
    temp = fxl*f(xr);                                                     
    if temp==0                          %If you guess an exact root, break
        break
    elseif temp<0                       %f(xl)*f(xu)<0
        xu = xr;
        fxu = f(xu);
    else                                %f(xl)*f(xu)>0
        xl = xr;
        fxl = f(xl);      
    end
    
    if iter >= 2
        ea = abs((X(end)-X(end-1))/X(end))*100;   %Calculate ea
        eArray = [eArray ea];
    end
    
    
end

fprintf('The approximate root %.4f was calculated after %i iterations and has a relative approximate percent error of %.6f"%"', xr, iter, ea)

iters = 2:iter;
figure 
semilogy(iters,eArray,'k')
grid on
title('Relative Approximate Percent Error vs Number of Iterations')
xlabel('Iterations')
ylabel('Error')
end