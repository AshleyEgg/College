#include "myLib.h"
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include "text.h"
#include "Start2.h"
#include "EndWin.h"
#include "EndLose.h"
#include "Background.h"
#include "Frog2.h"
#include "Heart.h"
#include "FrogLily.h"
#include "Rules.h"


typedef struct {
	int row; //location of the frog
	int col; //location of the frog
	int width; //width of the frog
	int height; // height of the frog
} FROG;

typedef struct {
	int row; //location of the log
	int col; //location of the log
	int width; //width of the log
	int length; //length of the log
	int speed; //speed the log is moving at
}LOG;

typedef struct {
	int row; //location of the life
	int col; //location of the life
	int width; //width of the life
	int height; //height of the life
}LIFE;

typedef struct {
	int row; //location of the lily pad
	int col; //location of the lily pad
	int width; //width of the lily pad
	int height; // height of the lily pad
	bool filled; //true if there is a frog on the lily pad
}LILYPAD;


enum GBAState { //possible states during the game
	START,
	RESET,
	RULES,
	GAME,
	GAME_OVER_LOSE,
	GAME_OVER_WIN,
	GAME_OVER_RESET,
};

FROG ourFrog;
LIFE life1;
LIFE life2;
LIFE life3;
LOG lag1;
LOG lag2;
LOG lag3;
LOG lag4;
LILYPAD pad1;
LILYPAD pad2;
LILYPAD pad3;
LILYPAD pad4;
LILYPAD pad5;

volatile int score = 0;
volatile int lives = 3;
volatile int frogsInHome = 0;
static int jump = 25; //size of one jump of the frog


int main() {//Game Loop
	REG_DISPCNT = MODE3 | BG2_ENABLE;

	enum GBAState state = START;

	bool right_down = false;
	bool left_down = false;
	bool up_down = false;
	bool down_down = false;
	bool start_down = false;
	bool select_down = false;

	char scorestr[20];

	while(1) {
		waitForVBlank();		
		
		switch (state) {
		case START:
			declareStart();
			reset();
			drawBackground(Start2);
			sprintf(scorestr, "PRESS A TO START");
			drawString(138, 75, scorestr, WHITE);

			if (KEY_DOWN_NOW(BUTTON_A) && !start_down){
				start_down = true;
				state = RULES;
				drawBackground(Rules);
			}else if (!(KEY_DOWN_NOW(BUTTON_A)) && start_down){
				start_down = false;
			}

			
		break;

		case RULES:
			sprintf(scorestr, "PRESS A TO START");
			drawString(135, 75, scorestr, WHITE);

			sprintf(scorestr, "HELP FIVE FROGS GET HOME");
			drawString(50, 55, scorestr, WHITE);

			sprintf(scorestr, "YOU HAVE 3 LIVES");
			drawString(70, 65, scorestr, WHITE);
			drawImage3(70, 168, life1.width, life1.height, Heart);

			sprintf(scorestr, "ONLY ONE FROG CAN GO ON EACH LILYPAD");
			drawString(60, 15, scorestr, WHITE);			

			sprintf(scorestr, "+100 POINTS FOR EACH FROG HOME");
			drawString(80, 35, scorestr, WHITE);	

			sprintf(scorestr, "-50 POINTS FOR EACH LIFE LOST");
			drawString(90, 37, scorestr, WHITE);

			sprintf(scorestr, "USE THE ARROW KEYS TO MOVE");
			drawString(100, 40, scorestr, WHITE);

			sprintf(scorestr, "PRESS SELECT TO RETURN TO START");
			drawString(110, 33, scorestr, WHITE);			

			if (KEY_DOWN_NOW(BUTTON_A) && !start_down){
				start_down = true;
				state = RESET;
			}else if (!(KEY_DOWN_NOW(BUTTON_A)) && start_down){
				start_down = false;
			}
			
		break;

		case RESET:
			reset();
			drawBackground(Background);
			drawFrog();
			drawLives();
			drawLogs();
			state = GAME;
		break;

		case GAME:
			// reset to start if select is pressed
			if(KEY_DOWN_NOW(BUTTON_SELECT) && !select_down){
				select_down = true;
				state = START;
			} else if(!(KEY_DOWN_NOW(BUTTON_SELECT)) && select_down){
				select_down = false;
			}
			undrawFrog(Background);
			undrawLogs(Background);
			moveLogs();

			//check if the frog is on the log and if it is necessary to move him
			if(frogIsOnLog()){
				moveFrogOnLog();
			}

			if (KEY_DOWN_NOW(BUTTON_RIGHT) && !right_down){ //right button pressed
				right_down = true;
				ourFrog.col += jump;
				if (ourFrog.col > 240){
					ourFrog.col = 220;
				}
			} else if (!(KEY_DOWN_NOW(BUTTON_RIGHT)) && right_down){
				right_down = false;
			}

			if (KEY_DOWN_NOW(BUTTON_LEFT) && !left_down){ //left button pressed
				left_down = true;
				ourFrog.col -= jump;
				if (ourFrog.col < 0){
					ourFrog.col = 0;
				}
			}else if (!(KEY_DOWN_NOW(BUTTON_LEFT)) && left_down){
				left_down = false;
			}

			if (KEY_DOWN_NOW(BUTTON_UP) && !up_down){ //up button pressed
				up_down = true;
				ourFrog.row -= jump;
				if (ourFrog.row < 0){
					ourFrog.row = 15;
				}
			}else if (!(KEY_DOWN_NOW(BUTTON_UP)) && up_down){
				up_down = false;
			}
			if (KEY_DOWN_NOW(BUTTON_DOWN) && !down_down){ //down button pressed
				down_down = true;
				ourFrog.row += jump;
				if (ourFrog.row > 160 ){
					ourFrog.row = 140;
				}
			}else if (!(KEY_DOWN_NOW(BUTTON_DOWN)) && down_down){
				down_down = false;
			}

			//Checks if the frog is alive
			if(!checkIfAlive()){
				lives -= 1;
				score -= 50;
				undrawLives(Background, lives);
				reset();
			}
		
			//Checks if the frog is on a lily pad
			if(checkIfHome()){
				reset();
			} 
			
			//Determines if you have won or lost the game
			if((pad1.filled && pad2.filled && pad3.filled && pad4.filled && pad5.filled)){
				state = GAME_OVER_WIN;
			}else if (lives == 0){
				state = GAME_OVER_LOSE;
			}		

			//Redraws everything and updates the score and lives
			drawFrog();
			drawLogs();
			sprintf(scorestr, "Score: %-10d", score);
			drawString(0, 0, scorestr, GREEN);
			sprintf(scorestr, "Lives:");
			drawString(0, 170, scorestr, GREEN);
		break;

		case GAME_OVER_LOSE:
			drawBackground(EndLose);
			sprintf(scorestr, "Score: %-10d", score);
			drawString(115, 80, scorestr, WHITE);
			sprintf(scorestr, "PRESS A TO PLAY AGAIN");
			drawString(125, 55, scorestr, WHITE);
			state = GAME_OVER_RESET;


		break;
		
		case GAME_OVER_WIN:
			drawBackground(EndWin);
			sprintf(scorestr, "Score: %-10d", score);
			drawString(115, 80, scorestr, WHITE);
			sprintf(scorestr, "PRESS A TO PLAY AGAIN");
			drawString(125, 55, scorestr, WHITE);
			state = GAME_OVER_RESET;

		break;

		case GAME_OVER_RESET:
			if (KEY_DOWN_NOW(BUTTON_A) & !start_down){
				start_down = true;
				drawBackground(Start2);
				state = START;
			} else if (!(KEY_DOWN_NOW(BUTTON_A)) & start_down) {
				start_down = false;
				
			}
		break;

		}

	}
}

/**
* @brief Draw a frog.
*/
void drawFrog() {
    drawImage3(ourFrog.row, ourFrog.col, ourFrog.width, ourFrog.height, Frog2);
}

/**
* @brief Undraw a frog.
* @param image A pointer to the image to cover the old frog location with.
*/
void undrawFrog(const u16 *image) {
    undrawImage3(ourFrog.row, ourFrog.col, ourFrog.width, ourFrog.height, image);
}

/**
* @brief Resets the frog to the starting position.
*/
void reset() {
	ourFrog.col = 240 / 2 - ourFrog.width / 2;
   	ourFrog.row = 160 - ourFrog.height;
}

/**
* @brief Draw 4 logs and the frog.
*/
void drawLogs(){
	drawRectangle(lag1.row, lag1.col, lag1.width, lag1.length, BROWN);
	drawRectangle(lag2.row, lag2.col, lag2.width, lag2.length, BROWN);
	drawRectangle(lag3.row, lag3.col, lag3.width, lag3.length, BROWN);
	drawRectangle(lag4.row, lag4.col, lag4.width, lag4.length, BROWN);
	drawFrog();
}

/**
* @brief Undraw 4 logs and undraw the frog.
* @param image A pointer to the image to cover the old log locations with.
*/
void undrawLogs(const u16 *image){
	undrawRectangle(lag1.row, lag1.col - lag1.speed, lag1.width, lag1.length, image);
	undrawRectangle(lag2.row, lag2.col - lag2.speed, lag2.width, lag2.length, image);
	undrawRectangle(lag3.row, lag3.col - lag3.speed, lag3.width, lag3.length, image);
	undrawRectangle(lag4.row, lag4.col - lag4.speed, lag4.width, lag4.length, image);
	undrawFrog(image);
}

/**
* @brief Move the logs one pixel to the right or left
*/
void moveLogs(){
	lag1.col += lag1.speed;
	lag2.col += lag2.speed;
	lag3.col += lag3.speed;
	lag4.col += lag4.speed;
	

	if(lag1.col < 0){
		lag1.col = 0;
		lag1.speed = -lag1.speed;
	}else if(lag1.col + lag1.length > 240){
		lag1.col = 240 - lag1.length;
		lag1.speed = -lag1.speed;
	}

	if(lag2.col < 0){
		lag2.col = 0;
		lag2.speed = -lag2.speed;
	}else if(lag2.col + lag2.length > 240){
		lag2.col = 240 - lag2.length;
		lag2.speed = -lag2.speed;
	}

	if(lag3.col < 0){
		lag3.col = 0;
		lag3.speed = -lag3.speed;
	}else if(lag3.col + lag3.length > 240){
		lag3.col = 240 - lag3.length;
		lag3.speed = -lag3.speed;
	}

	if(lag4.col < 0){
		lag4.col = 0;
		lag4.speed = -lag4.speed;
	}else if(lag4.col + lag4.length > 240){
		lag4.col = 240 - lag4.length;
		lag4.speed = -lag4.speed;
	}

}

/**
* @brief If the frog is on the log move it with the log.
*/
void moveFrogOnLog(){
	if(ourFrog.col >= lag1.col && ourFrog.col <= lag1.col+lag1.length && lag1.row == ourFrog.row){
		ourFrog.col += lag1.speed;
	}else if(ourFrog.col >= lag2.col && ourFrog.col <= lag2.col+lag2.length && lag2.row == ourFrog.row){
		ourFrog.col += lag2.speed;
	}else if(ourFrog.col >= lag3.col && ourFrog.col <= lag3.col+lag3.length && lag3.row == ourFrog.row){
		ourFrog.col += lag3.speed;
	}else if(ourFrog.col >= lag4.col && ourFrog.col <= lag4.col+lag4.length && lag4.row == ourFrog.row){
		ourFrog.col += lag4.speed;
	}
}

/**
* @brief Draw 3 lives in the top right corner of the screen.
*/
void drawLives(){
	drawImage3(life1.row, life1.col, life1.width, life1.height, Heart);
	drawImage3(life2.row, life2.col, life2.width, life2.height, Heart);
	drawImage3(life3.row, life3.col, life3.width, life3.height, Heart);
}

/**
* @brief Undraw a life depending on how many lives remain.
* @param image A pointer to the image to cover the old life location with.
* @param lifeNum Number of lives remaining
*/
void undrawLives(const u16 *image, int lifeNum){
	switch (lifeNum){
	case 2:
		undrawImage3(life3.row, life3.col, life3.width, life3.height, image);
	break;
	case 1:
		undrawImage3(life2.row, life2.col, life2.width, life2.height, image);
	break;
	case 0:
		undrawImage3(life1.row, life1.col, life1.width, life1.height, Heart);
	break;
	}
}

/**
* @brief Return true if the frog is alive.
* @return True if the frog is alive and false if it is dead.
*/
bool checkIfAlive(){
	if(ourFrog.row == 140 || ourFrog.row == 15 || frogIsOnLog() || checkIfHome()){
		return true;
	}else{
		return false;
	}
}

/**
* @brief Return true if the frog is on a log.
* @return True if the frog is on a log and false if it is not on a log.
*/
bool frogIsOnLog(){
	if((ourFrog.col >= lag1.col && ourFrog.col <= lag1.col+lag1.length - ourFrog.width && lag1.row == ourFrog.row)
		||(ourFrog.col >= lag2.col && ourFrog.col <= lag2.col+lag2.length - ourFrog.width && lag2.row == ourFrog.row)
		||(ourFrog.col >= lag3.col && ourFrog.col <= lag3.col+lag3.length - ourFrog.width && lag3.row == ourFrog.row)
		||(ourFrog.col >= lag4.col && ourFrog.col <= lag4.col+lag4.length - ourFrog.width && lag4.row == ourFrog.row)){
		return true;
	}else{
		return false;
	}
}

/**
* @brief Declares the necessary values needed on startup of a new game.
*/
void declareStart(){
	score = 0;
	lives = 3;
	frogsInHome = 0;

	ourFrog.width = 20;
	ourFrog.height = 20;

	life1 = (LIFE){0, 230, 8, 8};
	life2 = (LIFE){0, 218, 8, 8};
	life3 = (LIFE){0, 206, 8, 8};

	lag1 = (LOG){115, 0, 20, 60, 1};
	lag2 = (LOG){90, 180, 20, 60, -1};
	lag3 = (LOG){65, 0, 20, 60, 2};
	lag4 = (LOG){40, 180, 20, 60, -2};

	pad1 = (LILYPAD){15,13,25,25, false};
	pad2 = (LILYPAD){15,60,25,25,false};
	pad3 = (LILYPAD){15,105,25,25,false};
	pad4 = (LILYPAD){15,153,25,25,false};
	pad5 = (LILYPAD){15,198,25,25,false};

	
}

/**
* @brief Return true if the frog is on a lily pad and draw a fog on that lily pad and increment the score.
* @return True if the frog is on a lily pad and false if it is not on a lily pad.
*/
bool checkIfHome(){
	if(ourFrog.col >= pad1.col-5 && ourFrog.col <= pad1.col + pad1.width + 5 && pad1.row == ourFrog.row){
		drawImage3(pad1.row, pad1.col, pad1.height, pad1.width, FrogLily);
		if(!pad1.filled){
			pad1.filled = true;	
			frogsInHome += 1;
			score += 100;	
		}
		return true;
	}else if(ourFrog.col >= pad2.col-5 && ourFrog.col <= pad2.col + pad2.width + 5 && pad2.row == ourFrog.row){
		drawImage3(pad2.row, pad2.col, pad2.height, pad2.width, FrogLily);
		if(!pad2.filled){
			pad2.filled = true;
			frogsInHome += 1;	
			score += 100;	
		}
		return true;
	}else if(ourFrog.col >= pad3.col-5 && ourFrog.col <= pad3.col + pad3.width + 5 && pad3.row == ourFrog.row){
		drawImage3(pad3.row, pad3.col, pad3.height, pad3.width, FrogLily);
		if(!pad3.filled){
			pad3.filled = true;	
			frogsInHome += 1;
			score += 100;	
		}
		return true;
	}else if(ourFrog.col >= pad4.col -5 && ourFrog.col <= pad4.col + pad4.width + 5 && pad4.row == ourFrog.row){
		drawImage3(pad4.row, pad4.col, pad4.height, pad4.width, FrogLily);
		if(!pad4.filled){
			pad4.filled = true;
			frogsInHome += 1;	
			score += 100;	
		}
		return true;
	}else if(ourFrog.col >= pad5.col - 5 && ourFrog.col <= pad5.col + pad5.width + 5 && pad5.row == ourFrog.row){
		drawImage3(pad5.row, pad5.col, pad5.height, pad5.width, FrogLily);
		if(!pad5.filled){
			pad5.filled = true;
			frogsInHome += 1;	
			score += 100;	
		}
		return true;
	}else {
		return false;
	}
}

