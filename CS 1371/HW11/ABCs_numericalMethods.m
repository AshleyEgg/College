function [A, B, C, D, E, F, G, H, I, J, K] = ABCs_numericalMethods(x, y, xi)
% ABCs of Numerical Methods
%
% This is a multi-part problem.  Do each of the parts below.
%
% DO NOT CHANGE THE FUNCTION HEADER (the first line of code)
%
% Problem Parts:

% 1. interp1. Find the y values that correspond to the xi values using
% linear interpolation from the vectors x and y. (A)

A = interp1(x,y,xi);
% 2. spline. Find the y values that correspond to the xi values using
% the spline method from the vectors x and y. (B)

B = spline(x,y,xi);
% 3. polyfit. Find the coefficients of the fifth order polynomial that best
% fits the points represented by vectors x and y. (C)

C = polyfit(x,y,5);
% 4. polyval. Evaluate the polynomial found in part 3 at the points in the
% vector xi. (D)

D = polyval(C,xi);
% 5. diff. Approximate the derivative, dy/dx, for the vectors x and y. (E)

E = diff(y)./diff(x);
% 6. Approximate the second derivative for the vectors x and y. The
% x vector should consist of all except for the last index of the original
% x vector used in the previous part. (F)

F = diff(E)./diff(x(1:end-1));
% 7. cumsum. Find the cumulative sum of the elements in x. (G)

G = cumsum(x);
% 8. trapz. Find the area under the curve represented by x and y by using
% the trapzoidal method of approximation. (H)

H = trapz(x,y);
% 9. cumtrapz. Find the cumulative area under the curve represented by x
% and y by using the trapzoidal method of approximation. (I)

I = cumtrapz(x,y);

% 10. Analytical derivative. Make a vector of coefficients that represent
% the coefficients of the derivative of the polynomial found in part 3. (J)
J = C(1:end-1).*(length(C)-1:-1:1);

% 11. Analytical integral. Make a vector of coefficients that represent
% the coefficients of the integral of the polynomial found in part 3. Set
% the constant to 0. (J)
K = [C./(length(C):-1:1), 0];
end