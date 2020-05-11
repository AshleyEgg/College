function [words]=wordCounter(fileName)
%Counts number of unique words in a text file
fh=fopen(fileName);%opens file
line=fgetl(fh);%gets the first line
words={'';'count'};%Intilizes empty cell array and makes it not empty
word=strtok(line);

while ischar(line)%While there are still lines in the file
    line=lower(line);%lowercase the line
    [word,rem]=strtok(line);%get the first word
    while ~isempty(word)%While there are still words in the line
        mask=word>='a'&word<='z';%Gets where word is made of letters
        word=word(mask);%gets only letters in the word
        if all(word>='a'&word<='z')%If only lowercase letters in the word
            mask=strcmp(words(1,:),word);%Search the first row of cA for the word
            if any(mask)%If the word exsists in the CA already 
                words{2,mask}=words{2,mask}+1;%Increment the value          
            else
                col={word;1};
                words=[words,col];%Otherwise add the word to the cA
            end            
        end
        [word,rem]=strtok(rem);%gets the next word
    end
    line=fgetl(fh);%gets the next line
end
words=words(:,2:end);%Gets rid of the first filler column
[~,ind]=sort(words(1,:));%Sorts the first row alphabetically
words=words(:,ind);%Sorts the bottom to match the top
fclose(fh);%closes the file
end