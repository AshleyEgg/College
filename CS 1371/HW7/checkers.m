function [jumps]=checkers(board)
%Determines how many moves can be given a checker board
jumps=0;%intilizes counter
[row,col]=size(board);%Finds the size of the board
for x=row:-1:1
    for y=col:-1:1
        piece=board(x,y);%Gives the value of the piece at that position
        tl=x-2>0 && y-2>0 && strcmp(board(x-2,y-2),'O') && strcmp(board(x-1,y-1),'b');%Checks all the conditions needed to be able to jump in each direction
        tr=x-2>0 && y+2<=col && strcmp(board(x-2,y+2),'O') && strcmp(board(x-1,y+1),'b');
        bl=x+2<=row && y-2>0 && strcmp(board(x+2,y-2),'O') && strcmp(board(x+1,y-1),'b');
        br=x+2<=row && y+2<=col && strcmp(board(x+2,y+2),'O') && strcmp(board(x+1,y+1),'b');
        switch piece%Determines which peice you have and then adds the number of moves it can make
            case 'R'
               jumps=jumps+tl+tr+bl+br;
            case 'r'
                jumps=jumps+tl+tr;
        end
    end   
end
end