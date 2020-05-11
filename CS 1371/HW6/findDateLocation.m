function [out]=findDateLocation(loc1,loc2,ratings,dateP,yourR)
%Determines where you should take your date for Valentines day
good=dateP=='+';%Finds which locations your date likes
%Seperates the ratings and gets rid of all zeros
rate1=ratings(1,:);
zeros1=rate1==0;
rate2=ratings(2,:);
zeros2=rate2==0;
rate1(zeros1)=[];
rate2(zeros2)=[];
%Finds average rate for each location
[r1,c1]=size(rate1);
[r2,c2]=size(rate2);
avg1=sum(rate1)/c1;
avg2=sum(rate2)/c2;

%Based on your date's preferences, your prefernces and the average rating
%for each place the below statements determine where to go
if sum(good)==1
    if dateP(1)=='+'
        out=loc1;
    else
        out=loc2;
    end
elseif sum(good)==0
    if avg1>avg2&& avg1>=7.5
        out=loc1;
    elseif avg1<avg2&& avg2>=7.5
        out=loc2;
    else
        if yourR(1)>yourR(2)
            out=loc1;
        else
            out=loc2;
        end
    end
elseif sum(good)==2
    if avg1==avg2
        if yourR(1)>yourR(2)
            out=loc1;
        else
            out=loc2;
        end
    elseif avg1>avg2
        out=loc1;
    else
        out=loc2;
        
    end
end
    
end