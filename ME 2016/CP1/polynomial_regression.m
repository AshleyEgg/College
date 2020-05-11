function [A,r] = polynomial_regression(x,y,m,plot_logical)
%This function implements a generic function to fit a polynomial to a
%data set.
%
%Inputs:
%   x = data 
%   y = data
%   m = order of the polynomial
%   plot_logical = determines if the data and curve fit will be plotted on
%   the same curve
%
%Outputs:
%   A = vector of polynomial coefficients
%   r = correlation coefficient of the fit
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: Computer Project 1
%Date: 10/22/2018

V = [];                                 %Initilize empty vector        
for n = 0:m                             %Creates V vector
    temp = sum((x.^n).*y);
    V = [V;temp];       
end

M = zeros(m+1,m+1);                     %Initilize empty vmatrix
e = 0;                                  %Exponent
for t = 1:(m+1)^2                       %Create matrix M
    M(t)= sum(x.^e);
    e=e+1;
    if(mod(t,(m+1)) == 0)
        e = e-m;
    end
end                             

A = M\V;                                %Uses M and V to calculate A                                

xexps = 0:length(A)-1;                  %Generate vector of exponents
f = (x.^xexps)*A;                       %Genearte function
sr = sum((y-f).^2);                     %Calculate sr

%Calculate st and r
yBar = mean(y);                         
st = sum((y-yBar).^2);                     
r = sqrt((st-sr)/st);                      

%Generate 100 linearly spaced data points to plot
xPlot = (linspace(x(1),x(end)))';
fPlot = (xPlot.^xexps)*A;

if nargin == 4 && plot_logical == true      %plot data and curve fit on same graph 
    hold on
    grid on
    scatter(x,y)
    plot(xPlot,fPlot)
    title('Polynomial Regression')
    xlabel('X')
    ylabel('Y')
    hold off
end
end