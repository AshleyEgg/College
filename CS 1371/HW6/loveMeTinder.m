function [out]=loveMeTinder(AD,profile)
%Determines if a profile meets your standards on Tinder
%Breaks up profile into useable components
[name,remain]=strtok(profile,',');
[age,remain]=strtok(remain,',');
[dist,remain]=strtok(remain,',');
[school,remain]=strtok(remain,',');
[pic,remain]=strtok(remain,',');
bio=remain;

%Breaks up my info into useable componets
myAge=AD(1);
maxDist=AD(2);
minAge=(0.5 .* myAge + 7);
maxAge=((myAge - 7) * 2);

if str2double(age)>=minAge && str2double(age)<=maxAge
   if str2double(dist)>maxDist
       out=sprintf('Swipe left on %s''s picture',name);
   else
       switch school
           case{'Georgia Tech','GT','Georgia Institute of Technology'}
               out=sprintf('Super Like %s''s picture',name);
           case{'u(sic)ga'}
               out=sprintf('Swipe left on %s''s picture',name);
           otherwise
                if strcmp(pic,'selfie')&&contains(bio,'"')
                    out=sprintf('Swipe left on %s''s picture',name);
                else
                    out=sprintf('Swipe right on %s''s picture',name);
                end 
       end
   end
else
    out=sprintf('Swipe left on %s''s picture',name);
end
end

