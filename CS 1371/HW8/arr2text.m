function []=arr2text(nums,name)
%Arranges data into a formated table
fh1=fopen(name,'w');%opens file with write acess
maxes=max(nums);%finds max num in each col
maxes=num2str(maxes);%Makes maxes into strings
[row,col]=size(nums);%Gives size of number array 
[long,rem]=strtok(maxes);%intilizes strtok variables
width=[];%intilizes empty width vector

while ~isempty(long)%Finds the length of the longest number in each col
    len=length(long);
    width=[width,len];
    [long,rem]=strtok(rem);
end

%Creates the line that goes in between each row of numbers
line='+';
for j=width%For every element in width
    dashes='';
    for j=1:j%Creates individual dashes lines
        dashes=[dashes,'-'];
    end
    line=[line,dashes,'+'];%Adds a plus in between each set of dashes
end

%Decide which row to print finds the even line
r=1;
for i=1:(row*2+1)
    if row*2+1==i%If last line do not print new line char
        fprintf(fh1,'%s',line);
    else
        line2='|';
        if mod(i,2)==1%If odd line print the dashes line 
            fprintf(fh1,'%s\n',line);
        else   %Otherwise calculates the even line
            c=1;
            line2='';
            j=1;%Counter variable
            while j<=length(line)
                if strcmp(line(j),'+')%If dash line is a plus at index then print |
                    line2=[line2,'|'];
                    j=j+1;
                elseif strcmp(line(j-1),'+')%If one to the left of plus add the number
                    line2=[line2,num2str(nums(r,c))];
                    j=j+length(num2str(nums(r,c)));%Increments j by the length of the number
                    c=c+1;
                else%If just a dash add a space
                    line2=[line2,' '];
                    j=j+1;
                end
            end      
            r=r+1;
            fprintf(fh1,'%s\n',line2);%Prints even line
        end
    end
end

fclose(fh1);
end