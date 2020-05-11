function [match]=compareContour(vec1,vec2)
%Compares the pattern of increasing and decresing between each elment of a
%vector and identifies if it matches the same pattern in the other vector
d1=diff(vec1);
d2=diff(vec2);
abs1=abs(d1);
abs2=abs(d2);
signs1=d1./abs1;
signs2=d2./abs2;

match=isequaln(signs1,signs2);
end