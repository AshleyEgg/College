function [decoded]=decodeASCII(arr1,vScale,hScale,bChar,bWidth)
%Decodes an image made from ASCII values
arrCh1=char(arr1);%Turns nums into chars
[row,col]=size(arrCh1);%Finds num of rows and num of col of array

%Divides the character array into quadrants
topR=arrCh1(1:row/2,col/2+1:col);
bottomL=arrCh1(row/2+1:row,1:col/2);
bottomR=arrCh1(row/2+1:row,col/2+1:col);

arrCh1(1:row/2,col/2+1:col)=flipud(topR);%Replaces values in top right with flipped values

arrCh1(row/2+1:row,1:col/2)=bottomR;%Flips the bottom left and right quads
arrCh1(row/2+1:row,col/2+1:col)=bottomL;

%Stretches the image by given vertical and horizontal scaling factor
vIdx = floor(linspace(1, row + (vScale - 1)/vScale, row*vScale));
hIdx = floor(linspace(1, col + (hScale - 1)/hScale, col*hScale));
arrCh1=arrCh1(vIdx,:);
arrCh1=arrCh1(:,hIdx);

%Adds a border to the image
[row,col]=size(arrCh1);%Recalculates the size afterresizing the array
sideB=zeros(row,bWidth);%Makes an empty array that is the correct border size
topB=zeros(bWidth,(col+2*bWidth));
sideB(sideB==0)=bChar;%Fills the empty vector with the border char
topB(topB==0)=bChar;
half=[sideB, arrCh1, sideB];%Adds the border on
decoded=[topB;half;topB];
end