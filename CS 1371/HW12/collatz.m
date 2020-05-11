function [out,count]=collatz(in)
%Needs to count how many times it runs
if in<2%If we are now less than 2
    out=in;%Give back the number put in which is always 1
    count=0;
else%Ohterwise
    if mod(in,2)==0%If it is even
        in=in/2;
    else%If it is odd
        in=(in*3)+1;   
    end
    [in,count]=collatz(in);%Recursively calls the function
     count=count+1;%Increases count by one each time
end
out=in;
end