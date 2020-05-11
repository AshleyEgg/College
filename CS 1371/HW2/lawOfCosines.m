function [lengthC]=lawOfCosines (lengthA,lengthB,angle)
%Takes given angles and lengths to find length of the third side using the law of cosines.
aSquare = lengthA.^2;
bSquare = lengthB.^2;
mult=-2.*lengthA.*lengthB.*cosd(angle);
lengthC = round(sqrt(aSquare+bSquare+mult),2);
end