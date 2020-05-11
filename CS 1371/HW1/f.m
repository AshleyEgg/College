function result = f (x,y,k)
%Solves the complicated f function given to us in the hw
sum=y+k;
rem1=rem(sum,17);
expon=(-17.*x)-rem1;
raise=2.^expon;
div1=floor(sum./17);
mult1=div1.*raise;
result=floor(rem(mult1,2));
end