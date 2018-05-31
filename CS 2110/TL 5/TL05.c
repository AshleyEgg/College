// Name: Ashley Eggart

#include "myLib.h"
#include "rotate_puppy.h"
#include "rotate_puppy_red.h"
#include "rotate_puppy_blue.h"
#include "rotate_puppy_green.h"
#include "background.h"

#define OFFSET(r, c, rowlen) ((r)*(rowlen) + (c))

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

/*	1)
	Use DMA to implement the drawFullBackgroundImage function. 
	You may not use any loops in this function, but you are guarenteed 
	that the image passed is the same size as the screen, 240x160.
*/
void drawFullBackgroundImage(const unsigned short *image) {
    DMA[3].src = image;
    DMA[3].dst = videoBuffer;
    DMA[3].cnt = 38400 | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT | DMA_ON;
}

/* 2) 
	Implement the drawImageRotated180 function.
	You will need to draw an image at the specified point on the screen
	and rotate it 180 degrees. HINT: rotating 180 degrees is the same thing
	as flipping it both horizontally and vertically!
	You will also need to pass each pixel from the image through the colorFilter
	and draw the output onto the screen
*/


void setPixel(int row, int col, unsigned short color) {
    videoBuffer[row * 240 + col] = color;
}


void drawImageRotated180(const unsigned short *image, unsigned int row, unsigned int col,
	 unsigned int width, unsigned int height, unsigned short (*colorFilter)(unsigned short)) {

   		for (unsigned int r = 0; r < height; r++) {//flip LR
    	    for (unsigned int c = 0; c < width; c++) {
    	        unsigned short pix = image[r * width + width - c - 1];
				pix = colorFilter(pix);
    	        setPixel(row + r, c + col, pix);
    	    }
    	}

	    for (unsigned int r = 0; r < height ; r++) {//flip UD not working
        	for (unsigned int c = 0; c < width; c++) {
        	    unsigned short pix = videoBuffer[OFFSET(height +row-1 -r,c+col, 240 )];//image[(height - r - 1) * width + c];
        	    setPixel(row + r, c + col, pix);
        	}
    	}

}


/* 3)
	Implement the following 3 function: redFilter, greenFilter, and blueFilter
	For each function, create a new pixel where all the other channels are zero'd out
	i.e the redFilter returns a pixel that only has the red channel from the given pixel,
	greenFilter only has the green channel, etc.
*/
unsigned short redFilter(unsigned short pixel) {
	//pixel = pixel & 0x1F;
	return pixel & 0x1F;
}

unsigned short greenFilter(unsigned short pixel) {
	return pixel & (0x1F<<5);
}

unsigned short blueFilter(unsigned short pixel) {
	return pixel & (0x1F<<10);
}

/* DO NOT EDIT THIS */
unsigned short noFilter(unsigned short pixel) {
	return pixel;
}

/* 4)
	Using the functions you just wrote, draw all the images onto the screen. 

*/
int main(void)
{
	REG_DISPCNT = MODE3 | BG2_ENABLE;	
	waitForVblank();
    	
	//Draw the background image
	drawFullBackgroundImage(background);
	
	//Draw and rotate rotate_puppy at row 9 and column 31 using noFilter
	drawImageRotated180(rotate_puppy, 9, 31, 62, 62, noFilter);
	
	//Draw and rotate rotate_puppy_red at row 9 and column 140 using redFilter
	drawImageRotated180(rotate_puppy_red, 9, 140, 62, 62, redFilter);
	
	//Draw and rotate rotate_puppy_green at row 89 and column 31 using greenFilter
	drawImageRotated180(rotate_puppy_green, 89, 31, 62, 62, greenFilter);
	
	//Draw and rotate rotate_puppy_blue at row 89 and column 140 using blueFilter
	drawImageRotated180(rotate_puppy_blue, 89, 140, 62, 62, blueFilter);

	while (1);
}


void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}
