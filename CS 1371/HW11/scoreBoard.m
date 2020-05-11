function [report]=scoreBoard(names,points)
%Analyzes a basketball game and plots the data
point1=cumsum(points(1,:));
point2=cumsum(points(2,:));
time=points(3,:);

%Gets the maximum score between the two teams
high=point1(end);
if point2(end)>high
    high=point2(end);
end

%Graphs the data from the game
hold on
plot(time,point1,'r')
plot(time,point2,'b')
plot([20,20],[0,high+5],'k')
axis([0,40,0,high+5])
title([names{1},' vs. ',names{2}])
ylabel('points')
xlabel('minutes')

%Calculates who was in the lead the most
try1=cumtrapz(points(1,:));
try2=cumtrapz(points(2,:));
mask1=try1>try2;
mask2=try2>try1;
interval=diff(time);
out1=sum(interval(mask1(2:end)));
out2=sum(interval(mask2(2:end)));


if out1>30 && point1(end)==high
    report=sprintf('%s totally dominated this game and took home the win from %s!', names{1},names{2});
elseif out2>30 && point2(end)==high   
    report=sprintf('%s totally dominated this game and took home the win from %s!', names{2},names{1});
elseif out1>30 && point2(end)==high
    report=sprintf('%s totally dominated this game but %s stole the win tonight!', names{1},names{2});
elseif out2>30 && point1(end)==high
    report=sprintf('%s totally dominated this game but %s stole the win tonight!', names{2},names{1});
elseif out1<30 && out1<30&& point1(end)==high
    report=sprintf('Although a fairly evenly matched game, %s came out on top over %s tonight!', names{1},names{2});
elseif out2<30 && out1<30 && point2(end)==high
    report=sprintf('Although a fairly evenly matched game, %s came out on top over %s tonight!', names{2},names{1});
end
end