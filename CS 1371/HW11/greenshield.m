function []=greenshield(data)
%Takes in an excel file of traffic data and analyzes and plots it
[num,~,raw]=xlsread(data);%Reads in data

mask1=strcmp(raw(1,:),'flow rate (q)');
frate=num(1:end,mask1);

mask2=strcmp(raw(1,:),'speed (u)');
speed=num(1:end,mask2);

mask3=strcmp(raw(1,:),'density (k)');
density=num(1:end,mask3);

critS=max(speed)/2;%Gets the critical speed
diffs=speed-critS;
[~,I]=min(abs(diffs));
critD=density(I);
critF=frate(I);


%Plots all the data
subplot(2,2,1)
hold on
plot(density,speed,'k*')%Plots data
ylabel('Speed, u [mi/hr]')
xlabel('Density, k [veh/mi/ln]')
axis([0,max(density),0,max(speed)])
coe=polyfit(density,speed,1);
newy=polyval(coe,density);
plot(density,newy,'g')%Plots regression line
str1=sprintf('u = %0.3fk + %0.3f',coe(1),coe(2));%Formats the label
text(3,5,str1)%adds the regression equation
plot([critD,critD],[0,critS],'y')
plot([critD,max(density)],[critS,critS],'y')

subplot(2,2,2)
hold on
plot(frate,speed,'k*')%Plots data
ylabel('Speed, u [mi/hr]')
xlabel('Flow Rate, q [veh/hr/ln]')
axis([0,max(frate),0,max(speed)])
coe2=[-1/abs(coe(1)),coe(2)/abs(coe(1)),0];
newx2=polyval(coe2,speed);
[newy2,I2]=sort(speed);
plot(newx2(I2),newy2,'c')%Plots cubic regression
str2=sprintf('q = %0.3fu + %0.3fu^2',coe2(2),coe2(1));%Formats the label
text(500,10,str2)%adds the regression equation
plot([0,max(frate)],[critS,critS],'y')

subplot(2,2,3)
hold on
plot(density,frate,'k*')%Plots data
ylabel('Flow Rate, q [veh/hr/ln]')
xlabel('Density, k [veh/mi/ln]')
axis([0,max(density),0,max(frate)])
coe3=[coe(1),coe(2),0];
[newy3,I3]=sort(polyval(coe3,density));
plot(density(I3),newy3,'r')%Plots cubic regression
str3=sprintf('q = %0.3fk + %0.3fk^2',coe3(2),coe3(1));%Formats the label
text(10,250,str3)%adds the regression equation
plot([critD,critD],[0,max(frate)],'y')
end