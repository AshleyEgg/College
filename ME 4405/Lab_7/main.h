/*
 * main.h
 *
 *  Created on: March 6, 2020
 *      Author: Ashley Eggart
   This file contains declarations of macros and functions needed
 *  for Lab 7 of ME 4405 Spring 2020
 */

#include "msp.h"
#include <driverlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#ifndef MAIN_H_
#define MAIN_H_
#endif /* MAIN_H_ */


#define A1 GPIO_PORT_P2, GPIO_PIN4   //A1-P4-Pink
#define A2 GPIO_PORT_P2, GPIO_PIN5   //A2-P5-Orange
#define B1 GPIO_PORT_P2, GPIO_PIN6   //B1-P6-Yellow
#define B2 GPIO_PORT_P2, GPIO_PIN7   //B2-P7-Blue


//Declare global structures

// Set Baud Rate = 57600
const eUSCI_UART_Config UART_init = //Configure structure for UART
    {
     EUSCI_A_UART_CLOCKSOURCE_SMCLK,
     3,    //clock Prescaler
     4,     //first ModReg
     2,    //second ModReg
     EUSCI_A_UART_NO_PARITY,
     EUSCI_A_UART_LSB_FIRST,
     EUSCI_A_UART_ONE_STOP_BIT,
     EUSCI_A_UART_MODE,
     EUSCI_A_UART_OVERSAMPLING_BAUDRATE_GENERATION
    };

    //From slides used to configure TimerA in Up Mode for 1 second
    const Timer_A_UpModeConfig upConfig_0 =     // Configure counter in Up mode
    {
        TIMER_A_CLOCKSOURCE_SMCLK,              // Tie Timer A to SMCLK
        TIMER_A_CLOCKSOURCE_DIVIDER_64,         // Increment counter every 64 clock cycles
        177000,                                  // Period of Timer A (this value placed in TAxCCR0)
        TIMER_A_TAIE_INTERRUPT_DISABLE,         // Disable Timer A rollover interrupt
        TIMER_A_CCIE_CCR0_INTERRUPT_ENABLE,     // Enable Capture Compare interrupt
        TIMER_A_DO_CLEAR                        // Clear counter upon initialization};
    };

//Implicitly declare functions
double round(double d);
