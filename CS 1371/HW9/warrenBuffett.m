function [name,out]=warrenBuffett(stocks)
[~,~,raw]=xlsread(stocks);%Reads in data
%Moves the Symbol col to be the first col
mask4=strcmp(raw(1,:),'Symbol');
tempCol=raw(:,mask4);
raw(:,mask4)=[];
raw=[tempCol,raw];

%Calculates the percent change for each row and adds it on the end
mask1=strcmp(raw(1,:),'Change');
mask2=strcmp(raw(1,:),'Price');
pChange={'% Change'};
change=cell2mat(raw(2:end,mask1));
price=cell2mat(raw(2:end,mask2));
nums=round((change./price).*100,2);
nums=num2cell(nums);
pChange=[pChange;nums];
raw=[raw,pChange];


%Sorts the table into the correct order
[~,idx]=sort(cell2mat(raw(2:end,end)),'descend');
idx=[1;idx+1];
out=raw(idx,:);

%Gives the name of the stock to invest in
mask3=strcmp(raw(1,:),'Name');
name=out{2,mask3};
end