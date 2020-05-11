function I = integrator(x,y,method)
%This function numerically integrates a function using either the
%trapezoidal rule or Simpson's 1/3 rule
%
%Inputs:
%   x = a vector
%   y = a matrix whose columns are the same length as x and contain equally
%   spaced data points
%   method = technique used to integrate
%
%Outputs:
%   I = a row vector whose elements are the integrals of each column 
%   of y with respect to x
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: CP2
%Date: 10/25/2018

if nargin == 3 && strcmp(method,'simp')
    I = Simpsons3rd(x,y);
else
    I = Trapezoidal(x,y);
end
end

function I = Simpsons3rd(x,y)
    n = length(x)-1;    %Initilize n
    if mod(n,2) == 1    %Throw an error if odd number of intervals
        error('Number of intervals to integrate over is odd.')
    end
    odd = sum(y(3:2:n-1,:),1);          %Find sum of odd 
    even = sum(y(2:2:n,:),1);           %Find sum of even
    I = ((x(end)-x(1)).*(y(1,:)+4.*even+2.*odd+y(end,:)))/(3*n);
end

function I = Trapezoidal(x,y)
    n = length(x)-1;              %Initilize n
    middle = y(2:end-1,:);          %Find the middle chunck of data
    I = (x(end)-x(1)).*(y(1,:)+y(end,:)+2.*sum(middle,1))./(2*n);
end