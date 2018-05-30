/**
* @file graphics.c
* @author Ashley Eggart
* @date 3/24/18
* @brief A graphics library for drawing geometry, for Homework 8 of Georgia Tech
*        CS 2110, Spring 2018.
*/

// Please take a look at the header file below to understand what's required for
// each of the functions.
#include "graphics.h"
#include<stddef.h>

Pixel noFilter(Pixel c) {
    // This is the correct implementation, please do not edit it.
    return c;
}

// TODO: Complete according to the prototype in graphics.h
Pixel greyscaleFilter(Pixel c) {
	Pixel r = c & 0x1F; 
	Pixel g = (c>>5) & 0x1F;
	Pixel b = (c>>10) & 0x1F;
	Pixel n = ((r*77)+(g*151)+(b*28)) >> 8;
	c = (n<<10) + (n<<5) + n;
    return c;
}

// TODO: Complete according to the prototype in graphics.h
Pixel redOnlyFilter(Pixel c) {
	c = c & 0x1F;
    return c;
}

// TODO: Complete according to the prototype in graphics.h
Pixel brighterFilter(Pixel c) {
	Pixel r = c & 0x1F; 
	Pixel g = (c>>5) & 0x1F;
	Pixel b = (c>>10) & 0x1F;
	Pixel r2 = 0x1F-r;
	Pixel g2 = 0x1F-g;
	Pixel b2 = 0x1F-b;
	r = r + (r2>>1);
	g = g + (g2>>1);
	b = b + (b2>>1);
	c = (b<<10) + (g<<5) + r;
    return c;
}

// TODO: Take a look at this function, which we have readily implemented,
// to see the coding style and logic. This function is not required, delete it
// if you want, or keep it if it's useful to look at for help.
void drawHorizontalLine(Screen *screen, Line *line) {
    // Check if the line is actually horizontal
    if (line->start.y != line->end.y) {
        return;
    }

    // Okay, so it is horizontal. Let's find which one is the left-side vertex
    unsigned int l = line->start.x <= line->end.x ? line->start.x : line->end.x;
    unsigned int r = line->start.x > line->end.x ? line->start.x : line->end.x;

    // Keep a vector that we can pass to drawPixel
    Vector v = {0, line->start.y};
    for (unsigned int x = l; x <= r; x++) {
        v.x = x;
        drawPixel(screen, v, line->color);
    }
}

// TODO: Complete according to the prototype in graphics.h
void drawPixel(Screen *screen, Vector coordinates, Pixel pixel) {
	if ((screen->size.x <= coordinates.x) | (screen->size.y <= coordinates.y)){
		return;
	}
	unsigned int index = (screen->size.x * coordinates.y)+ coordinates.x;
	*(screen->buffer + index) = pixel;
	
}

// TODO: Complete according to the prototype in graphics.h
void drawFilledRectangle(Screen *screen, Rectangle *rectangle) {
	unsigned int width = rectangle->size.x; //width
	unsigned int height = rectangle->size.y; //height
	Vector vect = {0,0};	

	for (unsigned int r = 0; r < height; r++){
		for (unsigned int c = 0; c < width; c++){
			vect.x = rectangle->top_left.x + c;
			vect.y = rectangle->top_left.y + r;
			drawPixel(screen, vect, rectangle->color);		
		}
	}
}

// TODO: Complete according to the prototype in graphics.h
void drawLine(Screen *screen, Line *line) {
	unsigned int changed = 0;
	int x1 = line->start.x;
	int y1 = line->start.y;
	int x2 = line->end.x;
	int y2 = line->end.y;

	int dx = (x2 - x1) >= 0 ? x2 - x1 : x1 - x2;
	int dy = (y2 - y1) >= 0 ? y2 - y1 : y1 - y2;
	
	int signx = x2-x1 == 0 ? 0 : (x2-x1 > 0 ? 1 : -1);
	int signy = y2-y1 == 0 ? 0 : (y2-y1 > 0 ? 1 : -1);

	if (dy>dx){
		int temp = dx;
		dx=dy;
		dy=temp;
		changed = 1;	
	}

	int e = 2 * dy - dx;
	Vector vect;
	for (int i = 1; i<=dx; i++){
		vect.x = x1;
		vect.y = y1;
		drawPixel(screen, vect, line->color);
		while (e >= 0){
			if (changed == 1){
				x1 = x1 + signx;
			}else {
				y1 = y1 + signy;			
			}
			e = e - 2 * dx;		
		}
		if (changed == 1){
			y1 += signy;
		}else {
			x1 += signx;			
		}
		e = e + 2 * dy;
	}
	Vector vect2 = {x2,y2};
	drawPixel(screen, vect2, line->color);
}

// TODO: Complete according to the prototype in graphics.h
void drawPolygon(Screen *screen, Polygon *polygon) {
	Vector *vert = polygon->vertices;//pointer
	int nv = polygon->num_vertices;
	Pixel color = polygon->color;

	Line l;
	Line *pl;
	Vector start;
	Vector end;

	for (int i= 0; i < nv-1; i++){
		start = *(vert+i);
		end = *(vert+i+1);
		l.start = start;
		l.end = end;
		l.color = color;
		pl=&l;
		drawLine(screen, pl);
	}	
	
	start = end;
	end = *(vert);
	l.start = start;
	l.end = end;
	l.color = color;
	pl=&l;
	drawLine(screen, pl);
		

}

// TODO: Complete according to the prototype in graphics.h
void drawRectangle(Screen *screen, Rectangle *rectangle) {
	//needs to convert a rectangle into a polygon
	unsigned int width = rectangle->size.x;
	unsigned int height = rectangle->size.y;
	unsigned int x = rectangle->top_left.x;
	unsigned int y = rectangle->top_left.y;
	unsigned int x2 = x + width - 1;//maybe I dont need the -1
	unsigned int y2 = y + height - 1;

	Vector verts [] = {
		{x,y},
		{x2,y},
		{x2,y2},
		{x,y2}
	};

	Polygon poly;
	poly.vertices = verts;
	poly.num_vertices = 4;
	poly.color = rectangle->color;
	Polygon *pp = &poly;
	drawPolygon(screen, pp);	
}

// TODO: Complete according to the prototype in graphics.h
void drawCircle(Screen *screen, Circle *circle) {
	unsigned int mx = circle->center.x;
	unsigned int my = circle->center.y;
	int r = circle->radius;
	Pixel color = circle->color;
	Vector vect;

	int x = 0;
	int y = r;
	int d = 1 - r;

	while (x <= y){
		vect.x = mx + x;
		vect.y = my + y;
		drawPixel(screen, vect, color);
		vect.x = mx + x;
		vect.y = my - y;
		drawPixel(screen, vect, color);

		vect.x = mx - x;
		vect.y = my + y;
		drawPixel(screen, vect, color);
		vect.x = mx - x;
		vect.y = my - y;
		drawPixel(screen, vect, color);

		vect.x = mx + y;
		vect.y = my + x;
		drawPixel(screen, vect, color);
		vect.x = mx + y;
		vect.y = my - x;
		drawPixel(screen, vect, color);

		vect.x = mx - y;
		vect.y = my + x;
		drawPixel(screen, vect, color);
		vect.x = mx - y;
		vect.y = my - x;
		drawPixel(screen, vect, color);

		if (d < 0){
			d = d + 2 * x + 3;
			x += 1;
		} else {
			d = d + 2 * (x-y) + 5;
			x += 1;
			y -= 1;
		}
	}
}

// TODO: Complete according to the prototype in graphics.h
void drawFilledCircle(Screen *screen, Circle *circle) {
	int mx = circle->center.x;
	int my = circle->center.y;
	int r = circle->radius;
	Pixel color = circle->color;

	Vector vect1;
	Vector vect2;
	Line l;
	Line *pl;

	int x = 0;
	int y = r;
	int d = 1 - r;

	while (x <= y) { // vect1 = p1, vect2 =p2
		vect1.x = mx + x;
		vect1.y = my + y;
		vect2.x = mx + x;
		vect2.y = my > y ? my -y : 0;
		l.start = vect1;
		l.end = vect2;
		l.color = color;
		pl = &l;
		drawLine(screen, pl);

		if (mx >= x) { // vect1 = p3, vect2 = p4
			vect1.x = mx - x;
			vect1.y = my + y;
			vect2.x = mx - x;
			vect2.y = my > y ? my -y : 0;
			l.start = vect1;
			l.end = vect2;
			l.color = color;
			pl = &l;
			drawLine(screen, pl);
		}
		//vect1 = p5, vect2 = p6
		vect1.x = mx + y;
		vect1.y = my + x;
		vect2.x = mx + y;
		vect2.y = my > x ? my - x : 0;
		l.start = vect1;
		l.end = vect2;
		l.color = color;
		pl = &l;
		drawLine(screen, pl);

		if (mx >= y) { // vect1 = p7, vect2 = p8
			vect1.x = mx - y;
			vect1.y = my + x;
			vect2.x = mx - y;
			vect2.y = my > x ? my - x : 0;
			l.start = vect1;
			l.end = vect2;
			l.color = color;
			pl = &l;
			drawLine(screen, pl);
		}

		if (d < 0) {
			d = d + 2 * x + 3;
			x += 1;
		} else {
			d = d + 2 * (x-y) + 5;
			x += 1;
			y -= 1;
		}
	}
}

// TODO: Complete according to the prototype in graphics.h
void drawImage(Screen *screen, Image *image, CropWindow *cropWindow, Pixel (*colorFilter)(Pixel)) {
	int imx = image->top_left.x;
	int imy = image->top_left.y;
	int imsizex = image->size.x;
	int imsizey = image->size.y;
	Vector vect;
	Pixel pix;
	unsigned int index;
	int cwx;
	int cwy;
	int cwidth;
	int cheight;
	int tempx;
	int tempy;
	
	if (cropWindow == NULL){
		cwx = 0;
		cwy = 0;
		tempx = 0;
		tempy = 0;
		cwidth = image->size.x;
		cheight = image->size.y;
	} else {
		cwx = cropWindow->top_left.x;
		cwy = cropWindow->top_left.y;
		tempx = cropWindow->top_left.x;
		tempy = cropWindow->top_left.y;
		cwidth = cropWindow->size.x;
		cheight = cropWindow->size.y;
	}
	
	for (int r = 0; r < cheight; r++) {
		for (int c = 0; c < cwidth; c++) {
			if (tempx <= imsizex && tempy <= imsizey) {
				vect.x = imx + c;
				vect.y = imy +r;
				tempx = cwx + c;
				tempy = cwy + r;
				index = (screen->size.x * tempy)+ tempx;
				pix = *(image->buffer + index);
				pix = colorFilter(pix);
				drawPixel(screen, vect, pix);
			}
		}
	}
}
