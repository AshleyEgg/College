function [TOUT, YOUT]=Euler(problem, yi, ti, tf, dt)
%This function defines Euler's method.
%
%Inputs:
%   problem = function handler 
%   ti = initial time
%   yi = initial value
%   tf = final time
%   yf = final value at tf
%   dt = time step size
%
%Outputs:
%   TOUT = vector containing incremental time values from ti-tf
%   YOUT = solution vector corressponding to times in TOUT
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: HW0
%Date: 8/25/2018

if ti>tf
    error('Error. ti must be less than tf')
else
    TOUT = ti:dt:tf;
    if TOUT(end)~= tf
        TOUT = [TOUT, tf];
    end
    y = yi;
    YOUT = yi;
    for temp = TOUT
        slope = problem(y);
        y = y + slope *dt;
        YOUT = [YOUT,y];
    end  
    YOUT = YOUT(1:end-1);
end
end