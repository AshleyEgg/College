#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

/**
* @brief Set the pixel at (row, col) to color.
* @param row The row of the pixel.
* @param col The col of the pixel.
* @param color The color to make the pixel.
*/
void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row, col, 240)] = color;
}

/**
* @brief Use DMA to draw a rectangle at (row, col)
* @param row The row to start drawing at.
* @param col The col to start drawing at.
* @param height The height of the rectangle.
* @param width The width of the rectangle.
* @param color The color to make the rectangle.
*/
void drawRectangle(int row, int col, int height, int width, unsigned short color) {
	for(int r=0; r<height; r++) {
		DMA[3].src = &color;
		DMA[3].dst = &videoBuffer[OFFSET(row + r, col, 240)];
		DMA[3].cnt = width | DMA_ON | DMA_SOURCE_FIXED;
	}
}

/**
* @brief Use DMA to undraw a rectangle at (row, col)
* @param row The row to start undrawing at.
* @param col The col to start undrawing at.
* @param height The height of the rectangle.
* @param width The width of the rectangle.
* @param image A pointer to the image to use to cover the old rectangle.
*/
void undrawRectangle(int row, int col, int height, int width, const u16 *image){
	for(int r=0; r<height; r++) {
		DMA[3].src = image + OFFSET(r + row, col, 240);
		DMA[3].dst = &videoBuffer[OFFSET(row + r, col, 240)];
		DMA[3].cnt = width | DMA_ON | DMA_SOURCE_FIXED;
	}
}

/**
* @brief Use DMA to draw an image at (row, col).
* @param row The row to start drawing at.
* @param col The col to start drawing at.
* @param height The height of the image.
* @param width The width of the image.
* @param image A pointer to the image to draw.
*/
void drawImage3 (int row, int col, int width, int height, const u16* image) {
    for (int r = 0; r < height; r++) {
        DMA[3].src = image + OFFSET(r, 0, width);
        DMA[3].dst = videoBuffer + OFFSET(r + row, col, 240);
        DMA[3].cnt = width | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT | DMA_ON;
    }
}

/**
* @brief Wait.
*/
void waitForVBlank(){ 
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

/**
* @brief Draws a full screen image.
* @param image A pointer to the image to draw.
*/
void drawBackground(const u16 *image) {
    DMA[3].src = image;
    DMA[3].dst = videoBuffer;
    DMA[3].cnt = 38400 | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT | DMA_ON;
}

/**
* @brief Use DMA to undraw an image at (row, col).
* @param row The row to start undrawing at.
* @param col The col to start undrawing at.
* @param height The height of the image.
* @param width The width of the image.
* @param image A pointer to the image to cover the old image with.
*/
void undrawImage3(int row, int col, int width, int height, const u16 *image) {
    for (int r = 0; r < height; r++) {
        DMA[3].src = image + OFFSET(r + row, col, 240);
        DMA[3].dst = videoBuffer + OFFSET(r + row, col, 240);
        DMA[3].cnt = width | DMA_SOURCE_INCREMENT | DMA_DESTINATION_INCREMENT | DMA_ON;
    }
}
