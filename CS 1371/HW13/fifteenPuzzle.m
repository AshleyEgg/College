function [move]=fifteenPuzzle(name)
img=imread(name);%Reads in the image
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);
[row,col]=size(b);
squareSize=row/4;
mask= r==0 & g==0 & b==0;%mask of where the image is pure black
[rowB,colB]=find(mask,1);%Finds the top left corner of the black square
%Finds the colors of the borders on the sides of the black square
left=img(rowB,colB-1,:);
right=img(rowB,colB+squareSize,:);
top =img(rowB-1,colB,:);
bottom=img(rowB+squareSize,colB,:);

if left==right%Determines which direction to slide the piece
    line=img(rowB-3,colB-1,:);%Gets the line color for the left of the black square
    if line==left
        move='R';
        blackS=img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:);
        piece=img(rowB:rowB+squareSize-1,colB+squareSize:colB+squareSize*2-1,:);    
        img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:)=piece;%The black square is equal to the piece to the right
        img(rowB:rowB+squareSize-1,colB+squareSize:colB+squareSize*2-1,:)=blackS;%The image piece is now black
    else
        move='L';
        blackS=img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:);
        piece=img(rowB:rowB+squareSize-1,colB-squareSize:colB-1,:);    
        img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:)=piece;%The black square is equal to the piece to the right
        img(rowB:rowB+squareSize-1,colB-squareSize:colB-1,:)=blackS;%The image piece is now black
    end
elseif top==bottom
    line=img(rowB-1,colB-3,:);%Gets the line color for the top of the black square
    if line==top
        move='U';
        blackS=img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:);
        piece=img(rowB-squareSize:rowB-1,colB:colB+squareSize-1,:);    
        img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:)=piece;%The black square is equal to the piece to the right
        img(rowB:rowB+squareSize-1,colB-squareSize:colB-1,:)=blackS;%The image piece is now black
    else
        move='D';
        blackS=img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:);
        piece=img(rowB+squareSize:rowB+squareSize*2-1,colB:colB+squareSize-1,:);    
        img(rowB:rowB+squareSize-1,colB:colB+squareSize-1,:)=piece;%The black square is equal to the piece to the right
        img(rowB+squareSize:rowB+squareSize*2-1,colB:colB+squareSize-1,:)=blackS;%The image piece is now black
    end
end
%[tempc,tempr,P]=impixel(img,colB,rowB+squareSize)



imwrite(img,[name(1:end-4),'_solved.png']);%Creates the solved image
end