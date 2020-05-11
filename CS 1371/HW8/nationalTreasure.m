function [out]=nationalTreasure(fn1,fn2)
%Scans a text file and picks specific letters out according to another file
%of corrdinates
fh1=fopen(fn1);%Coordinate file
loc=fgetl(fh1);%first coordinate
out='';

while ischar(loc)
    if strcmp(loc,'space')%if it says space then add a space
        out=[out,' '];
        loc=fgetl(fh1);
    else %Otherwise find the necessary letter 
        fh2=fopen(fn2);%Open text file
        [lineNum,rem]=strtok(loc,'-');
        lineNum=str2double(lineNum);%Gets line num
        [wordNum,rem]=strtok(rem,'-');
        wordNum=str2double(wordNum);%Gets word num
        [letNum]=strtok(rem,'-');
        letNum=str2double(letNum);%Gets letter num
        for i=1:lineNum%Finds the line we want
            line=fgetl(fh2);
        end
        for j=1:wordNum%On the line fids the word we want
            [word,rem]=strtok(line);
            line=rem;
        end
        let=word(letNum);%Finds the letter we want in the word

        out=[out,let];
        loc=fgetl(fh1);
        fclose(fh2);
    end
end
fclose(fh1);
end