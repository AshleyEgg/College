/*
 * main.h
 *
 *  Created on: Apr 5, 2020
 *      Author: Ashley Eggart
 *
 *  Contains all of the definitions of variables and macros for Lab 8.
 */
#include "msp.h"
#include <driverlib.h>
#include <stdio.h>
#include <math.h>

#ifndef MAIN_H_
#define MAIN_H_
#endif /* MAIN_H_ */

#define BUTTON1 GPIO_PORT_P1, GPIO_PIN1   //S1
#define BUTTON2 GPIO_PORT_P1, GPIO_PIN4   //S2
#define RED GPIO_PORT_P1,GPIO_PIN0        //RED LED



/* Timer_A PWM Configuration Parameter */
Timer_A_PWMConfig pwmConfig =
{
        TIMER_A_CLOCKSOURCE_SMCLK,
        TIMER_A_CLOCKSOURCE_DIVIDER_1,
        2250,
        TIMER_A_CAPTURECOMPARE_REGISTER_1,
        TIMER_A_OUTPUTMODE_RESET_SET,
        225
};

Timer_A_PWMConfig pwmConfig2 =
{
        TIMER_A_CLOCKSOURCE_SMCLK,
        TIMER_A_CLOCKSOURCE_DIVIDER_1,
        2250,
        TIMER_A_CAPTURECOMPARE_REGISTER_2,
        TIMER_A_OUTPUTMODE_RESET_SET,
        225
};
