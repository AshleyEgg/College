function [pos vel] = freefall(t)
%Based on a provided time, gives the position and velocity at that time
a=9.807;
pos=round((a*t^2)/2,3)
vel=round(a*t,3)
end