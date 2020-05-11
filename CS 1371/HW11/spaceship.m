function [result]=spaceship(data,dist)
%Determines if a spaceship burned up or landed
temps=data(2,:);%Gets temp data

hold=cumtrapz(data(1,:),data(3,:));%Finds the cumalitive integral of the speeds
hold=dist-hold;%Finds the current distance from earth to the spaceship
loc=interp1(temps,hold,1260);%linearly interpolates the data

temp=interp1(temps,hold,2000,[],'extrap');
if temp<dist&&temp>0%If any of the temps exceed 2000
    result=sprintf('The spaceship''s warning alarm sounded %0.2f meters from the Earth. Unfortunately, the ship did not make it.',loc);
else
    result=sprintf('The spaceship''s warning alarm sounded %0.2f meters from the Earth. Luckily, the ship landed safely!',loc);
end

end