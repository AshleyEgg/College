/*
 * main.c
 *
 *  Created on: Feb 7, 2020
 *      Author: Ashley Eggart
 *  This program turns on and off the LED's on the MSP432 based on button presses.
 *  While S1 is pressed LED1 turns on. While S2 is pressed LED2 turns on and cycles
 *  through RED, BLUE, and GREEN color values each time the button is pressed.
 */
#include "driverlib.h"
#include "main.h"

//Declare global variables
int b1;
int b2;
int color = RED;

int main(void)
{
    WDT_A_holdTimer();  //Turn off watchdog timer

    //Set up initial values and pin configurations
    GPIO_setAsOutputPin(GPIO_PORT_P1,GPIO_PIN0);
    GPIO_setAsOutputPin(GPIO_PORT_P2,RED|BLUE|GREEN);
    GPIO_setOutputLowOnPin(GPIO_PORT_P1,GPIO_PIN0);
    GPIO_setOutputLowOnPin(GPIO_PORT_P2,RED|BLUE|GREEN);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1,BUTTON1);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P1,BUTTON2);

    while(1){//While the board has power
        //Button1 - Red LED
        b1 =  GPIO_getInputPinValue(GPIO_PORT_P1,BUTTON1);
        if(b1 == GPIO_INPUT_PIN_LOW){//If button1 is pressed
            GPIO_setOutputHighOnPin(GPIO_PORT_P1,GPIO_PIN0);
            while(GPIO_getInputPinValue(GPIO_PORT_P1,BUTTON1) == GPIO_INPUT_PIN_LOW){}
            GPIO_setOutputLowOnPin(GPIO_PORT_P1,GPIO_PIN0);
        }

        //Button2 - RED, BLUE, GREEN LED
        b2 = GPIO_getInputPinValue(GPIO_PORT_P1,BUTTON2);
        if(b2 == GPIO_INPUT_PIN_LOW){//If button2 is pressed
            GPIO_setOutputHighOnPin(GPIO_PORT_P2,color);
            while(GPIO_getInputPinValue(GPIO_PORT_P1,BUTTON2) == GPIO_INPUT_PIN_LOW){}
            GPIO_setOutputLowOnPin(GPIO_PORT_P2,color);

            pickColor();
        }
    }
}

void pickColor(){
    //Changes the color of the LED
    if (color == RED){
        color = BLUE;
    } else if (color == BLUE){
        color = GREEN;
    } else if (color == GREEN){
        color = RED;
    }
}
