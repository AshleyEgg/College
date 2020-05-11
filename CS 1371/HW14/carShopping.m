function [out]=carShopping(name,first,second)
[num,txt,raw]=xlsread(name);
headers=raw(1,:);
mask1=strcmp(headers,first);
data1=[raw{2:end,mask1}];
mask2=strcmp(headers,second);
[firstData,idx]=sort(data1,'descend');

temp=raw(2:end,:);%sorts all data by the most important thing
temp=temp(idx,:);
out=headers;

for i=1:3%For every unique value
    maxInd=find(firstData==max(firstData));
    maxFirst =temp(maxInd,:);
    if length(maxInd)>1
        data2=[maxFirst{:,mask2}];
        [~,idx2]=sort(data2,'descend');
        maxFirst=maxFirst(idx2,:);
    end
    out(end+1:end+length(maxInd),:)=maxFirst;
    firstData(maxInd)=[];
    temp(maxInd,:)=[];
end

out=out(1:4,:);

end