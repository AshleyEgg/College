function [out]=r_nFib(init,terms)
%Starts the fibbanocci sequaence where you want for as many terms as you
%want
if init==0 || init==1%Gives the first and second term
    second=1;
else
    second=init;
end
if terms==1
    out=init;
elseif terms==0
    out=[];
else
    out=help(init,second,[init,second],terms,2);
end
end

function [out]=help(init,sec,curr,terms,count)%Finds the next number
if count==terms
    out=curr;
else
    next=init+sec;
    curr=[curr,next];
    out=help(sec,next,curr,terms,count+1);
end

end