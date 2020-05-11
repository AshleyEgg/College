function []=memeGenerator(top,bottom,name,txtcolor)
img=imread(name);%Reads in the image
[r,c,l]=size(img);

topW=str2img(top,c);%Turns the top string into an image
rT=topW(:,:,1);
gT=topW(:,:,2);
bT=topW(:,:,3);
[rowT,colT]=size(bT);
bottW=str2img(bottom,c);%Turns the bottom string into an image
rB=bottW(:,:,1);
gB=bottW(:,:,2);
bB=bottW(:,:,3);
[rowB,colB]=size(bB);

maskT= rT==0 & gT==0 & bT==0;%Makes a mask of where the top word image is black
maskB= rB==0 & gB==0 & bB==0;%Makes a mask of where the bottom word image is black

rT(~maskT)=txtcolor(1);
gT(~maskT)=txtcolor(2);
bT(~maskT)=txtcolor(3);
topW=cat(3,rT,gT,bT);

rB(~maskB)=txtcolor(1);
gB(~maskB)=txtcolor(2);
bB(~maskB)=txtcolor(3);
bottW=cat(3,rB,gB,bB);
%Puts the top words onto the picture


for i=1:rowT
    for j=1:colT
        if maskT(i,j)
            img(i,j,:)=img(i,j,:);
        else
            img(i,j,:)=topW(i,j,:);
        end
    end
end
%Adds the bottom words
for i=1:rowB 
    for j=1:colB
        if maskB(i,j)
             img(r-rowB+i,j,:)=img(r-rowB+i,j,:);
        else
            img(r-rowB+i,j,:)=bottW(i,j,:);
        end
    end
end

imwrite(img,[name(1:end-4),'_meme','.png'])%Outputs the final image

end