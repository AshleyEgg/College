function [guilty]=criminalMinds(lie1, lie2, lie3, lie4)
%Determines who is guilty
ans12=all(lie1==lie2);%Compares the first answers with the others
ans13=all(lie1==lie3);
ans14=all(lie1==lie4);

sum12=sum(ans12);%Adds all the responses together from the compared vectors
sum13=sum(ans13);
sum14=sum(ans14);

if(sum12==sum13&sum12==sum14)%Figures out which suspect is lying based on which set does not match the others
    guilty='Suspect #1 is lying.';
elseif(sum12~=sum13&sum12~=14)
    guilty='Suspect #2 is lying.';
elseif(sum13~=sum12&sum14~=14)
    guilty='Suspect #3 is lying.';
else
    guilty='Suspect #4 is lying.';
    
end
    
end
