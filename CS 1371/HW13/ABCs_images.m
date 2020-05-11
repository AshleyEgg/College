function [A B C D E] = ABCs_images(img1, img2)
% ABCs of Images
%
% This is a multi-part problem. Do each of the parts below.
%
% DO NOT CHANGE THE FUNCTION HEADER (the first line of code)

% a) imread. Read in the image matrix of the file whose name is stored in
% the variable img1. Store the image matrix in a variable named A.
%
% Write your code here:
A = imread(img1);
red=A(:,:,1);
green=A(:,:,2);
blue=A(:,:,3);
% b) Flipping images. Create a copy of A and then flip the image matrix
% along the diagonal. Store your result in B. Do *NOT* use the flipup() or
% fliplr() function. 
%
% Write your code here:
B = A(end:-1:1,end:-1:1,:);

% c) Swapping colors. Swap the green and blue layers of A. Store your
% result in C.
%
% Write your code here:

C(:,:,1)=red;
C(:,:,2)=blue;
C(:,:,3)=green;


% d) Grayscale. Store the grayscale of the image matrix A in the variable
% D. Use the simpler grayscale formula where the pixel value is the average
% of the three layers. Do *NOT* use the weighted average formula or any
% built-in MATLAB functions such as rgb2gray() or gray(). Note: First the
% image matrix will need to by type double, and the final image needs to be
% returned to uint8.
%
% Write your code here (it will be a few lines):
newR=double(red);
newG=double(green);
newB=double(blue);
avg=(newR+newG+newB)./3;
arr=uint8(avg);
D = cat(3,arr,arr,arr);

% e) Negative. Store the negative of the image matrix A in the variable E. 
%
% Write your code here:
E = 255-A;

% f) imwrite. Write a new image that is similar to the image matrix A,
% except that the values should be a third as bright. The name of the new
% image is stored in the variable img2. 
%
% Write your code here:
imwrite(A./3,img2)

end
