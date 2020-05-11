function [out]=findLocalMin(func,minx,maxx,x0)
%Finds the local min of a polynomial and graphs it
[tok,rem]=strtok(func);%Gets the f(x) portion
variable=tok(3);
[~,rem]=strtok(rem);%Gets the equal sign
[tok,rem]=strtok(rem);%Gets the first term
coeffs=[];
expons=[];
while ~isempty(tok)%Makes a vector of the coefficients and of the exponents from the string
    loc=strfind(tok,variable);%Finds location of x
    coeff=tok(1:loc-1);
    expon=tok(loc+2:end);
    if isempty(loc)%If there is no variable in the token
        coeffs=[coeffs,str2num(tok)];
        expons=[expons,0];
    else
        if isempty(coeff)%If no coefficient
            coeffs=[coeffs,1];
        elseif ~isempty(coeff)%If there is a coefficient
            coeffs=[coeffs,str2num(coeff)];

        end

        if isempty(expon)%If no exponent
            expons=[expons,1];
        elseif ~isempty(expon)%If there is an exponent
            expons=[expons,str2num(expon)];
        end
    end
    [~,rem]=strtok(rem);%Gets plus sign
    [tok,rem]=strtok(rem);%Gets the next set of points
end

final=zeros(1,expons(1)+1);%Makes a vector of zeros the length we need
%final(1)=coeffs(1);
for i=1:length(expons)
    j=expons(i);
    final(j+1)=coeffs(i);

end
final=fliplr(final);

data=linspace(minx,maxx);
newy=polyval(final,data);
plot(data,newy,'b')
ylabel(sprintf('f(%s)',variable))
xlabel(variable)
hold on
axis manual
deriv = final(1:end-1).*(length(final)-1:-1:1);%Takes the derrivative
incr=1;%Sets the intial increment

slope=polyval(deriv,x0);
y0=polyval(final,x0);
b=slope*-x0+y0;
newy2=polyval([slope,b],[(x0-5),(x0+5)]);
plot([(x0-5),(x0+5)],newy2,'r')

while slope>=0.1 || slope<=-0.1
    if slope>0
        while slope>0%If the slope is positive
            x0=x0-incr;
            slope=polyval(deriv,x0);
            y0=polyval(final,x0);
            b=slope*-x0+y0;
            newy2=polyval([slope,b],[(x0-5),(x0+5)]);
            plot([(x0-5),(x0+5)],newy2,'r')
        end
    elseif slope<0%It the slope is negative
        while slope<0
            x0=x0+incr;
            slope=polyval(deriv,x0);
            y0=polyval(final,x0);
            b=slope*-x0+y0;
            newy2=polyval([slope,b],[(x0-5),(x0+5)]);
            plot([(x0-5),(x0+5)],newy2,'r')
        end
    end
    incr=incr/2;
end

out=[round(x0,3),round(y0,3)];
end