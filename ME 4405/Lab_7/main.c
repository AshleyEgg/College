/**
 * ME 4405 - Fundamentals of Mechatronics
 * Lab 7: Stepper Motor Control
 * Author: Ashley Eggart
 * Date: 3/12/20
 *
 * Simple program to read in a value between zero and 60 from PuTTy terminal.
 * The stepper motor rotates to the corresponding angle and counts backward
 * back down to zero similar to how an egg timer works.
 */

#include <main.h>

//Declare global variables
volatile char receivedBuffer[1] = " ";
volatile char tprompt[] = "Time?";
volatile char sprompt[] = "Start?";
volatile int value[2];         //Value returned from UART

int i = 0;
int j = 0;
int input = 0;  //What value was input from PuTTy
int state = 0;  //state of the stepper motor
int ticks = 0;  //number of ticks motor needs to turn

int zeroFlag = 1;   //Indicates if Timer is at zero position and ready for a new time to be input
int startFlag = 0;  //Indicates if Start response was positive
int turnFlag = 0;   //Indicates if full number received via UART

//Used to map stepper motor values to values input by user
int input_start = 0;
int input_end = 60;
int output_start = 0;
int output_end = 540;


void main(void)
{
    // Disable the Watchdog Timer
    WDT_A_holdTimer() ;

    //Do all the setup for interrupts, timers, ADC, UART
    //Interrupt disable master
    Interrupt_disableMaster();

    //Configure Pins as Outputs
    GPIO_setAsOutputPin(A1);
    GPIO_setOutputLowOnPin(A1);
    GPIO_setAsOutputPin(B1);
    GPIO_setOutputLowOnPin(B1);
    GPIO_setAsOutputPin(A2);
    GPIO_setOutputLowOnPin(A2);
    GPIO_setAsOutputPin(B2);
    GPIO_setOutputLowOnPin(B2);

    //From slides-Go through steps to configure Timer A
    CS_setDCOFrequency(3E+6);// Set DCO clock source frequency
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);  // Tie SMCLK to DCO
    Timer_A_configureUpMode(TIMER_A0_BASE, &upConfig_0);  // Configure Timer A using above struct
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P5, GPIO_PIN5, GPIO_TERTIARY_MODULE_FUNCTION);//Maybe needed

    // Configure P1.2 and P1.3 as UART TX/RX
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P1, GPIO_PIN2 | GPIO_PIN3, GPIO_PRIMARY_MODULE_FUNCTION);

    // Initialize UART Module 0
    UART_initModule(EUSCI_A0_BASE, &UART_init);

    // Enable UART receive interrupt
    UART_enableModule(EUSCI_A0_BASE);
    UART_enableInterrupt(EUSCI_A0_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    Interrupt_enableInterrupt(INT_EUSCIA0);

    Interrupt_enableInterrupt(INT_TA0_0);// Enable Timer A interrupt- must be called before timer start

    //Set interrupt priority (0 is highest)
    Interrupt_setPriority(INT_TA0_0,(1<<5));
    Interrupt_setPriority(INT_EUSCIA0,(0<<5));

    Timer_A_startCounter(TIMER_A0_BASE, TIMER_A_UP_MODE);  // Start Timer A- must be called after enable timer A interrupt
    Interrupt_enableMaster();// Enable all interrupts

    //Run forever with interrupts being the only thing to break the loop
    while(1){
        if (zeroFlag == 1){
            //Send Time? Prompt
            Interrupt_disableMaster() ;     // Turn off interrupts so we can print - i.e., stop receiving data
            for(i = 0; i < sizeof(tprompt); i++){
                while((UCA0IFG & 0x02) == 0){} ;                  // (UCA0IFG & 0x02) == 0 will evaluate to true when TXIFG bit is set, false when TXIFG bit is clear
                UART_transmitData(EUSCI_A0_BASE, tprompt[i]) ;  // Send each character in the text string through UART
            }
            // End the line in terminal window
            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0D) ;      // write carriage return '\r'
            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0A) ;      // write newline '\n'
            zeroFlag = 0;
            Interrupt_enableMaster() ;                      // Finished printing - allow the MSP to receive data again
        }
        if (turnFlag == 1){
            //Turn to the correct value and send start prompt
            Interrupt_disableMaster() ;     // Turn off interrupts so we can print - i.e., stop receiving data
            //Map time values to number of ticks
            double slope = 1.0 * (output_end - output_start)/(input_end-input_start);
            ticks = output_start + round(slope*(input-input_start));
            //Turn motor the correct number of ticks to starting position
            for(i = 0; i < ticks; i++){
                if(state == 0){
                    GPIO_setOutputHighOnPin(A1);
                    GPIO_setOutputLowOnPin(B1);
                    GPIO_setOutputLowOnPin(A2);
                    GPIO_setOutputLowOnPin(B2);
                    state++;
                    _delay_cycles(5000);
                } else if(state == 1){
                    GPIO_setOutputLowOnPin(A1);
                    GPIO_setOutputHighOnPin(B1);
                    GPIO_setOutputLowOnPin(A2);
                    GPIO_setOutputLowOnPin(B2);
                    state++;
                    _delay_cycles(5000);
                } else if(state == 2){
                    GPIO_setOutputLowOnPin(A1);
                    GPIO_setOutputLowOnPin(B1);
                    GPIO_setOutputHighOnPin(A2);
                    GPIO_setOutputLowOnPin(B2);
                    state++;
                    _delay_cycles(5000);
                } else if(state == 3){
                    GPIO_setOutputLowOnPin(A1);
                    GPIO_setOutputLowOnPin(B1);
                    GPIO_setOutputLowOnPin(A2);
                    GPIO_setOutputHighOnPin(B2);
                    state = 0;
                    _delay_cycles(5000);
                }
            }
            //Transmits Start? and waits for carriage return
            for(i = 0; i < sizeof(sprompt); i++){
                while((UCA0IFG & 0x02) == 0){} ;                  // (UCA0IFG & 0x02) == 0 will evaluate to true when TXIFG bit is set, false when TXIFG bit is clear
                UART_transmitData(EUSCI_A0_BASE, sprompt[i]) ;  // Send each character in the text string through UART
            }
            // End the line in terminal window
            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0D) ;      // write carriage return '\r'
            while((UCA0IFG & 0x02) == 0){} ;
            UART_transmitData(EUSCI_A0_BASE, 0x0A) ;      // write newline '\n'
            turnFlag = 0;
            Interrupt_enableMaster() ;                      // Finished printing - allow the MSP to receive data again
        }
    }

}


void TA0_0_IRQHandler(void){        //Timer A interrupt - occurs every second
    Timer_A_clearCaptureCompareInterrupt(TIMER_A0_BASE, TIMER_A_CAPTURECOMPARE_REGISTER_0);
    if (startFlag == 1){    //If start flag is positive-Start counting down- once every second
        for(i = 0; i < ticks; i++){
            if(state == 0){
                GPIO_setOutputHighOnPin(A1);
                GPIO_setOutputLowOnPin(B1);
                GPIO_setOutputLowOnPin(A2);
                GPIO_setOutputLowOnPin(B2);
                state = 3;
                _delay_cycles(300000);
            } else if(state == 1){
                GPIO_setOutputLowOnPin(A1);
                GPIO_setOutputHighOnPin(B1);
                GPIO_setOutputLowOnPin(A2);
                GPIO_setOutputLowOnPin(B2);
                state--;
                _delay_cycles(300000);
            } else if(state == 2){
                GPIO_setOutputLowOnPin(A1);
                GPIO_setOutputLowOnPin(B1);
                GPIO_setOutputHighOnPin(A2);
                GPIO_setOutputLowOnPin(B2);
                state--;
                _delay_cycles(300000);
            } else if(state == 3){
                GPIO_setOutputLowOnPin(A1);
                GPIO_setOutputLowOnPin(B1);
                GPIO_setOutputLowOnPin(A2);
                GPIO_setOutputHighOnPin(B2);
                state--;
                _delay_cycles(300000);
            }
        }
        startFlag = 0;
    }
}

void EUSCIA0_IRQHandler(void){// Interrupt occurs when recieving data
    // Read the data from the RX buffer
    receivedBuffer[0] = EUSCI_A_UART_receiveData(EUSCI_A0_BASE); // Note: reading the RX buffer also resets the receive interrupt flag

    if(receivedBuffer[0]== 0x0D){     // 0x0D is a carriage return, according to ASCII table
        startFlag = 1;                // Set the text print flag high
    } else{                           // If any char other than cr is sent, store it in a buffer
        value[j] = receivedBuffer[0] - '0';
        j++;
    }
    if(j == 2 && startFlag == 1){ //If full number was received reset and turn on turn flag
        j = 0;
        input = value[0]*10+value[1];
        turnFlag = 1;
        startFlag = 0;
    }
}

double round(double d) {
    return floor(d + 0.5);
}
