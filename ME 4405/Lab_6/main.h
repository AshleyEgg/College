/*
 * main.h
 *
 *  Created on: Feb 28, 2020
 *      Author: Ashley Eggart
   This file contains declarations of macros and functions needed
 *  for Lab 6 of ME 4405 Spring 2020
 */

#include "msp.h"
#include <driverlib.h>
#include <stdio.h>
#include <string.h>

#ifndef MAIN_H_
#define MAIN_H_
#endif /* MAIN_H_ */

#define MAIN_1_SECTOR_31 0x0003F000   // Address of Main Memory, Bank 1, Sector 31

#define BUTTON1 GPIO_PORT_P1, GPIO_PIN1   //S1
#define BUTTON2 GPIO_PORT_P1, GPIO_PIN4   //S2
#define RED GPIO_PORT_P1,GPIO_PIN0        //RED LED

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




