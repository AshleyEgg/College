function accel1 = gravity(mass1,mass2,dist)
%Based on the given masses and distances, calculates the acceleration of
%the first mass.
G = 6.67.*10.^-11;
F = G.*((mass1.*mass2)./(dist.^2));
accel1=round(F./mass1,2);
end