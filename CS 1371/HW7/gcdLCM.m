function [gcd,lcm]=gcdLCM(a,b)
%Finds the greatest common divisor and least common multiple of 2 nums
ai=a;%Initial a value
bi=b;%Initial b value
while a>0&&b>0%Finds the gcd using steps provided
    r=rem(a,b);
    a=b;
    b=r;
    if b==0
        gcd=a;  
    end
    
end
lcm=(ai.*bi)./(gcd);%Finds lcm
end