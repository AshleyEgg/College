%Recitation 4/11/17
%Images

%Basics
    %Images are made of pixels and each pizles are made of three colors (red, green, blue)
    %Can make every color. all on-white, all off-black
    
    %Images are saved as 3 2D arrays(3d arrays):one for each color RGB:123
    %Size of image is same as sixe of each layer (300x2000)
    
%Functions
    %imread(filename)-reads in a file and produces a 3D array
    %class(im)%The class of images is uint8(an 8 bit number)
        %uint must be between [0 255]
    %Index 3D array pix=im(:,:,1)
    %imshow(arr)-displays the image
    
    [r,c,l]=size(im);%Gives the size of the image
    cind=round(linspace(1,c,c*factor));%Resizes an image columns by factor
    rind=round(linspace(1,r,r*factor));%Resizes an image rows by factor
    new=arr(rind,cind,:)%Resizes the actual image
    
    %or you can use imresize(image,factor to resize by)
    imresize(im,[100,500])
    
%Slicing an image
    %Index just like an array
    %You can also use masking and logical indexing
    
%cat() reconcatinates a 3D image
imout=cat(3,redlayer,bluelayer,greenlayer);%Concatinates the layers back together into an image

%Green Screen
%Step1: Seperate the image
%Step2: Make a mask of where r==255 &g==0 & b==0(where the picute is red)
    %cat(3,mask,mask,mask)-makes a 3D mask to be able to apply to the
    %picture or you can break it into layers and go layer by layer

%imwrite(arr,filename)

%GreyScaling an image
    %Just average the rgb values for each pixel but first cast them as
    %doubles and then go back and and cast them as uint8 after doing the
    %math to average them 
        newR=double(red);
        newG=double(green);
        newB=double(blue);
        avg=(newR+newG+newB)./3;
        arr=uint8(avg);
        D = cat(3,arr,arr,arr);
    
    %Or just use im2=mean(im,3)
    
%Rotating an image
    %transpose then flip the rows up down