function [] = shiaSurprise(shiaFile, imgFile, val)
    img = imread(shiaFile);%Opens the image
    sceneImg = imread(imgFile);

    [r,c,~] = size(img);%Finds the image size
    sceneImg = imresize(sceneImg, [r,c]);%Resizes the image
    [imgFile, ~] = strtok(imgFile,'.');
    newName = ['shia_visits_' imgFile '.png'];

    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);

    redCorner = double(red(1:10,1:10));
    avgR = uint8(mean(mean(redCorner)));

    greenCorner = double(green(1:10, 1:10));
    avgG = uint8(mean(mean(greenCorner)));
    
    blueCorner = double(blue(1:10, 1:10));
    avgB = uint8(mean(mean(blueCorner)));

    maskR = (red >= avgR-val) & (red <= avgR+val);
    maskG = (green >= avgG-val) & (green <= avgG+val);
    maskB = (blue >= avgB-val) & (blue <= avgB+val);

    bigMask = maskR & maskG & maskB;
    bigMask = cat(3, bigMask, bigMask, bigMask);
    img(bigMask) = sceneImg(bigMask);
    imwrite(img, newName);
end 