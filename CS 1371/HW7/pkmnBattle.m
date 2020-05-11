function [out]=pkmnBattle(myStats,rStats,myMoves,rMoves)
%Determines the winner of a pkmn battle
first=myStats(7)>rStats(7);%Determines if I go first
mylvl=myStats(1);%
rlvl=rStats(1);
myHP=myStats(2);
rHP=rStats(2);
dam=[];%Initilizes empty vector

for x=1:4
    if myMoves(x,3)==1%If special move makes att and def special
            att=myStats(5);
            def=rStats(6);
        else%Otherwise uses normal att and def
            att=myStats(3);
            def=rStats(4);
    end
    base=myMoves(x,1);%base of move
    damage=round(((2*mylvl+10)/250)*(att/def)*base + 2);%Calculates damage
    dam=[dam,damage];%Puts the damage for each move into a vector
end
dam=dam';%Inverts the vector
myMoves=[myMoves,dam];%Adds it in as an extra column to the moves
%Below lines do same as above expcept for rivals moves
dam=[];
for x=1:4
    if rMoves(x,3)==1%If special move makes att and def special
            att=rStats(5);
            def=myStats(6);
        else%Otherwise uses normal att and def
            att=rStats(3);
            def=myStats(4);
    end
    base=rMoves(x,1);%base of most powerful move
    damage=round(((2*rlvl+10)/250)*(att/def)*base + 2);%Calculates damage
    dam=[dam,damage];
end
dam=dam';
rMoves=[rMoves,dam];

myMoves=sortrows(myMoves,4);%Sorts the rows in ascending order based on damage
rMoves=sortrows(rMoves,4);

while myHP>0 && rHP>0%Runs as long as both pkmn are alive
    if first%If I am going first
        rHP=rHP-myMoves(end,4);%Damages rival
        myMoves(end,2)=myMoves(end,2)-1;%Subtracts one from PP after move is used
        if myMoves(end,2)==0%If PP is 0 for move then removes row
            myMoves(end,:)=[];
        end
        
    else%If they are going first
        myHP=myHP-rMoves(end,4);%Damages me
        rMoves(end,2)=rMoves(end,2)-1;%Subtracts one from PP after move is used
        if rMoves(end,2)==0%If PP is 0 for move then removes row
            rMoves(end,:)=[];
        end
    end
    first=~first;%Alternates who is going   
end
if myHP>0 && rHP<=0%Prints out who won
    out=sprintf('Congratulations, Champion of the Pokemon League! Your Pokemon survived with %d HP.',myHP);
else 
    out=sprintf('You lost the battle and blacked out! The enemy had %d HP remaining.',rHP);
end
end