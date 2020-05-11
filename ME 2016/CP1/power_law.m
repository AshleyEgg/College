function [a,p,r] = power_law(x,y,plot_logical)
%This function implements a generic function to fit a power law to a
%data set.
%
%Inputs:
%   x = data 
%   y = data 
%   plot_logical = determines if the data and curve fit will be plotted on
%   the same curve
%
%Outputs:
%   a = coefficient
%   p = power
%   r = correlation coefficient of the fit
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: Computer Project 1
%Date: 10/22/2018

%Remove any zero valued data points that would interfere with log10
xorig = x;
x = x(xorig>0 & y>0);
y = y(xorig>0 & y>0);

%Linearize your data
linX = log10(x);
linY = log10(y);

%Use linear regression to find a and p
[a0,a1,~] = linear_regression(linX,linY);    
a = 10^a0;
p = a1;

%Calculate st, sr, and r
yBar = mean(y);
st = sum((y-yBar).^2);
sr = sum((y-(a.*x.^p)).^2);                 
r = sqrt((st-sr)/st);                       

%Generate 100 linearly spaced data points to plot
xPlot = linspace(x(1),x(end));
f = a.*(xPlot.^p);

if nargin == 3 && plot_logical == true      %Plot data and curve fit on same graph
    hold on
    grid on
    scatter(x,y)
    plot(xPlot,f)
    title('Power Law Regression')
    xlabel('X')
    ylabel('Y')
    hold off
end
end