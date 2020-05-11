function [winner]= poker(cards)
%Determines who wins a hand of poker
cards=sort(cards,2);%Sorts the cards lowest to highest across row
[M,F,C]=mode(cards,2);
highest=max(cards,2);

mask4=F==4;
ofKind4=M(mask4);
mask3=F==3;
ofKind3=M(mask3);
mask2=F==2;
fullHouse=mask3&mask2;


% empty=zeros(6,13);

% for i=1:6
%     for j=1:14
%         count=sum(cards(i,:)==j);
%         empty(i,j)=count;
%     end
% end


if mask4
    if length(mask4)==1
        k=find(mask4);
        winner=sprintf('Player %d won with a Four of a Kind.',k);
    else
        [M,I]=max(ofKind4);
        if length(ofKind4)>1
            winner='Thank you for your donation to Hope and Zell Miller.';
        else
            winner=sprintf('Player %d won with a Four of a Kind.',I);
        end
    end
elseif fullHouse
    if length(fullHouse)==1
        k=find(fullHouse);
        winner=sprintf('Player %d won with a Four of a Kind.',k);
    else
        [M,I]=max(ofKind3(fullHouse));
        if length(I)>1
            winner='Thank you for your donation to Hope and Zell Miller.';
        else
            winner=sprintf('Player %d won with a Four of a Kind.',I);
        end
        
    end
    
    
end

end