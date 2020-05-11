function [final]=GSquare(hw,com,modeG)
%Calculates final homework grade after taking into account the grade mode
%and the extra credit assignments and comment grades
EC=hw(end);%Takes extra credit grade out
hw(end)=[];
numAssign=length(com);%Finds number of hw assignments
modeG(:,[2 3])=[];%Gets rid of last two rows of grade mode
modeG=modeG';%Finds the transpose
hw=reshape(hw,2,[]);%Reshapes the vector into columns with each column as an assignment
comPoints=com./10;%Figures out extra points based on comment grades

avgMask=modeG=='a';%Finds where you need to calculate average
maskLow=hw(1,:)>hw(2,:);%Finds where second score is lower returns a vec of half the length
mask1=maskLow&avgMask;%Finds where resubmission is lower and it says take average
modeG(mask1)='m';%replaces lower and average mask pos with max
maxMask=modeG=='m';%Finds a mask where max occurs after replacing some of them

hwMax=max(hw);%Gives a vector of max in each col
hwAvg=(sum(hw))./2;%Gives avg for each col
hw3=zeros(1,numAssign);%Makes an empty array with length of the num of assignments and 1 col
hw3(maxMask)=hwMax(maxMask);%fills in the max values
hw3(~maxMask)=hwAvg(~maxMask);%fills in avg values
hw3=hw3+comPoints;%adds in comm points

hwMin=min(hw3);%Finds a min hw grade
total=sum(hw3);%Adds all the components together

if EC<hwMin %Establishes if EC is lowest and what to do with it based on that info
    lowest=EC;
else 
    total=total-hwMin+EC;    
end

final=round((total/(numAssign)),1);%Finds final grade and rounds it

end