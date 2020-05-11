function [cards]=imagePoker(name,rank)
img=imread(name);
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);

whiteMask= r==255 & g==255 & b==255;%Makes a mask of where the white cards are

topHalf=img(1:end/2,:,:);
bottHalf=img(end/2+1:end,:,:);

topPic=topHalf(~whiteMask(1:end/2,:,:));%Gets the picture in the top left corner
bottPic=bottHalf(~whiteMask(end/2+1:end,:,:));%Gets the picture in the bottom right corner
bottPic=bottPic(end:-1:1,end:-1:1,:);%Rotates the bottom pic 180 degrees

if topPic==bottPic%If the top and bottom and pic are the same
    
else
    cards={};
end

end