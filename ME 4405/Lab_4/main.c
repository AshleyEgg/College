/**
 * ME 4405 - Fundamentals of MEchatronics
 * Lab 4: UART Communication
 * Author: Ashley Eggart
 * Date: 2/20/20
 *
 * Simple program to collect characters transmitted over UART via PuTTy
 * Terminal and return them when enter is pressed. Baud rate is set to
 * 57600 bps. Based on provided "Simple UART Example" provided in class
 */

#include "msp.h"
#include "stdio.h"
#include "driverlib.h"
#include "string.h"

//Declare global variables
volatile char receivedBuffer[1] = " ";
volatile uint8_t printPrompt = 0; //Flag for printing text over UART
volatile char sendingBuffer[200];
int j = 0;

// Set Baud Rate = 57600
/* Calculations:
 * N = 3,000,000/57600 = 52.0833
 * DIV = 52.0833/16 = 3.255
 * INT(DIV) = 3
 * FirstModReg = 0.255*16 = 4.08 INT(FirstModReg) = 4
 * SecondModReg = 2 from Datasheet
 * Oversampling mode used */

const eUSCI_UART_Config UART_init =
    {
     EUSCI_A_UART_CLOCKSOURCE_SMCLK,
     3,
     4,
     2,
     EUSCI_A_UART_NO_PARITY,
     EUSCI_A_UART_LSB_FIRST,
     EUSCI_A_UART_ONE_STOP_BIT,
     EUSCI_A_UART_MODE,
     EUSCI_A_UART_OVERSAMPLING_BAUDRATE_GENERATION
    };

void main(void)
{
	WDT_A->CTL = WDT_A_CTL_PW | WDT_A_CTL_HOLD;		// stop watchdog timer
    CS_setDCOFrequency(3E+6);       // Set clock frequency to 3MHz
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);

    // Disable Interrupts at the NVIC level before configuration
    Interrupt_disableMaster();

    // Configure P1.2 and P1.3 as UART TX/RX
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P1, GPIO_PIN2 | GPIO_PIN3, GPIO_PRIMARY_MODULE_FUNCTION);

    // Initialize UART Module 0
    UART_initModule(EUSCI_A0_BASE, &UART_init);
    UART_enableModule(EUSCI_A0_BASE);

    // Enable the UART receive interrupt at the peripheral level
    UART_enableInterrupt(EUSCI_A0_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    Interrupt_enableInterrupt(INT_EUSCIA0);

    // Enable interrupts at the NVIC level
    Interrupt_enableMaster();  // No priority was set because this is the only interrupt in this program

    int i = 0;
    while(1){
        // If the Return Key was pressed
        if(printPrompt){
            Interrupt_disableMaster() ;     // Turn off interrupts so we can print - i.e., stop receiving data

            //Need to change this so that it only transmits length of string
            for(i = 0; i < sizeof(sendingBuffer); i++){
                while((UCA0IFG & 0x02) == 0){} ;                  // (UCA0IFG & 0x02) == 0 will evaluate to true when TXIFG bit is set, false when TXIFG bit is clear
                UART_transmitData(EUSCI_A0_BASE, sendingBuffer[i]) ;  // Send each character in the text string through UART
            }

            // End the line in terminal window
            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0D) ;      // write carriage return '\r'

            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0A) ;      // write newline '\n'

            printPrompt = 0;                                // Set print flag back to 0
            memset(sendingBuffer,0,sizeof(sendingBuffer));  //Clear the buffer
            j = 0;                                          // Reset counter
            Interrupt_enableMaster() ;                      // Finished printing - allow the MSP to receive data again
        }


    }
}

void EUSCIA0_IRQHandler(void){
    // Read the data from the RX buffer
    receivedBuffer[0] = EUSCI_A_UART_receiveData(EUSCI_A0_BASE); // Note: reading the RX buffer also resets the receive interrupt flag

    if(receivedBuffer[0]== 0x0D){     // 0x0D is a carriage return, according to ASCII table
        printPrompt = 1;                // Set the text print flag high
    } else{                           // If any char other than cr is sent, store it in a buffer
        sendingBuffer[j] = receivedBuffer[0];
        j++;
    }
}
