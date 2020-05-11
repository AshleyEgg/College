function [a0,a1,r] = linear_regression(x,y,plot_logical)
%This function implements a generic function to fit a straight line to a
%data set.
%
%Inputs:
%   x = data 
%   y = data 
%   plot_logical = determines if the data and curve fit will be plotted on
%   the same curve
%
%Outputs:
%   a0 = intercept
%   a1 = slope
%   r = correlation coefficient of the fit
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: Computer Project 1
%Date: 10/22/2018

%Calculate intial values
yBar = mean(y);                     %average y
xBar = mean(x);                     %average x
sumx = sum(x);                      %summation of x

%Calculate a1 and a0
a1 = (sum(x.*y)-yBar*sumx)/(sum(x.^2)-(xBar*sumx));
a0 = yBar - a1 * xBar; 

%Calculate st, sr and r
st = sum((y-yBar).^2);
sr = sum((y-a0-a1.*x).^2);
r = sqrt((st-sr)/st);

%Generate 100 data points to plot
xPlot = linspace(x(1),x(end));
f = a0+a1.*xPlot;

if nargin == 3 && plot_logical == true      %plot data and curve fit on same graph
    hold on
    grid on
    scatter(x,y)
    plot(xPlot,f)
    title('Linear Regression')
    xlabel('X')
    ylabel('Y')
    hold off
end
end