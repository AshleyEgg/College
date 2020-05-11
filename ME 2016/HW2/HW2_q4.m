%Script: HW2_q4
%
%This script computes sin(pi) using its MacLaurin expansion with up to 10 
%terms and generates a plot that displays the remainder as a function of
%the number of terms.
%
%Outputs: Plot that displays the remainder as a function of the number of
%terms.
%
%Author: Ashley Eggart
%Section: ME 2016-A
%Assignment: HW2
%Date: 9/19/2018

exactSoln = 0;      % sin(pi)==0 but due to rounding errors MATLAB says that sin(pi)!=0
mSeries = [pi];     %Initilize array to hold MacLaurin Series answers and set first value to pi
terms = 1:10;

for i = 2:10
    mSeries(i) = mSeries(i-1) + ((-1)^(i+1))*(pi^(2*i-1))/factorial(2*i-1);
end
remainder = exactSoln - mSeries;    % The remainder is the difference 
                                    %between the exactSoln and the MacLaurin series approx

figure 
plot(terms,remainder)
title('Remainder as a Function of Number of Terms')
xlabel('Number of Terms')
ylabel('Remainder')
legend({'Exact Solution'},'Location','southeast')