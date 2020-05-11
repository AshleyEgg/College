/**
 * ME 4405 - Fundamentals of Mechatronics
 * Lab 6: Analog to Digital Conversion
 * Author: Ashley Eggart
 * Date: 3/5/20
 *
 * Simple program to read analog data from a temperature sensor circuit
 * and convert it to a digital signal. 30 values are collected when the
 * program is in acquiring data and these values are then stored in flash
 * memory. When in data output mode the values stored in memory are output
 * to a PuTTy terminal using UART.
 */

#include <main.h>

//Declare global variables
float tempV = 0;
float temp;
volatile float *temp_from_flash = (float*)MAIN_1_SECTOR_31 ;  // Allows changes to memory in an ISR
char buffer[50];

volatile int s1_state = 0;
volatile int s2_state = 0;
volatile float tempBuffer[30];

int b1;
int b2;
int i = 0;
int j = 0;



void main(void)
{
    // Disable the Watchdog Timer
    WDT_A_holdTimer() ;
    FPU_enableModule();

    //Do all the setup for interrupts, timers, ADC, UART
    //Interrupt disable master
    Interrupt_disableMaster();

    //Configure Buttons as Inputs
    GPIO_setAsInputPinWithPullUpResistor(BUTTON1);
    GPIO_setAsInputPinWithPullUpResistor(BUTTON2);

    //Set up initial values and pin configurations for red LED as output
    GPIO_setAsOutputPin(RED);
    GPIO_setOutputLowOnPin(RED);

    //Enable ADC module
    ADC14_enableModule();

    //From slides-Go through steps to configure Timer A
    CS_setDCOFrequency(3E+6);// Set DCO clock source frequency
    CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);  // Tie SMCLK to DCO
    Timer_A_configureUpMode(TIMER_A0_BASE, &upConfig_0);  // Configure Timer A using above struct
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P5, GPIO_PIN5, GPIO_TERTIARY_MODULE_FUNCTION);

    // Configure P1.2 and P1.3 as UART TX/RX
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P1, GPIO_PIN2 | GPIO_PIN3, GPIO_PRIMARY_MODULE_FUNCTION);

    // Initialize UART Module 0
    UART_initModule(EUSCI_A0_BASE, &UART_init);

    //Set Resolution- 10 bits
    ADC14_setResolution(ADC_10BIT);

    //Set clock sources
    ADC14_initModule(ADC_CLOCKSOURCE_MCLK, ADC_PREDIVIDER_1, ADC_DIVIDER_1, ADC_TEMPSENSEMAP);

    //Configure Sampling Mode
    ADC14_configureSingleSampleMode(ADC_MEM0, false);

    //Set reference voltage to be 2.5 volts
    REF_A_setReferenceVoltage(REF_A_VREF2_5V);

    //Configure Conversion Memory and Voltage Range
    ADC14_configureConversionMemory(ADC_MEM0, ADC_VREFPOS_INTBUF_VREFNEG_VSS, ADC_INPUT_A0, false);

    // Enable UART receive interrupt
    UART_enableModule(EUSCI_A0_BASE);
    UART_enableInterrupt(EUSCI_A0_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    Interrupt_enableInterrupt(INT_EUSCIA0);

    ADC14_enableSampleTimer(ADC_MANUAL_ITERATION);

    ADC14_enableInterrupt(ADC_INT0);
    ADC14_enableConversion();

    Interrupt_enableInterrupt(INT_TA0_0);// Enable Timer A interrupt- must be called before timer start

    Timer_A_startCounter(TIMER_A0_BASE, TIMER_A_UP_MODE);  // Start Timer A- must be called after enable timer A interrupt
    Interrupt_enableMaster();// Enable all interrupts

    ADC14_toggleConversionTrigger();// Initializes the trigger

    //Run forever with interrupts being the only thing to break the loop
    while(1){
        //Use polling to determine if either button has been pressed
        b1 = GPIO_getInputPinValue(BUTTON1);
        b2 = GPIO_getInputPinValue(BUTTON2);

        if(b1 == 0){
            //Need to collect Data
            s1_state = 1;
            printf("Button 1!\r\n");
        }else if (b2 == 0){
            //Need to display data
            s2_state = 1;
            printf("Button 2!\r\n");
        }
    }

}


void TA0_0_IRQHandler(void){        //Timer A interrupt - occurs every second
    Timer_A_clearCaptureCompareInterrupt(TIMER_A0_BASE, TIMER_A_CAPTURECOMPARE_REGISTER_0);
    ADC14_toggleConversionTrigger();
    if(s1_state){//Need to collect data
        //Collect Data for 30 seconds and store it in a buffer then store it in flash memory
        while(ADC14_isBusy()){
            tempV = ADC14_getResult(ADC_MEM0);  //Read the ADC value
            tempBuffer[i] = (2.5/1023) * 60 * tempV;     //Do the math from the slides to convert from ADC values to temperature value
            i++;
        }
        if(i==30){//If we have measured 30 data samples
            // Step 1. Unprotect Main Bank 1, Sector 31
            FlashCtl_unprotectSector(FLASH_MAIN_MEMORY_SPACE_BANK1,FLASH_SECTOR31);

            // Step 2. Erase the sector. Within this function, the API will automatically try to
            // erase the maximum number of tries. If it fails, notify user.
            if(!FlashCtl_eraseSector(MAIN_1_SECTOR_31))
                printf("Erase failed\r\n");

            // Step 3. Write the data to memory. If the write attempt fails, display an error message-not right
            if(!FlashCtl_programMemory(&tempBuffer, (float*) MAIN_1_SECTOR_31, 120))
                printf("Write attempt failed\r\n");

            // Step 4. Set the sector back to protected
            FlashCtl_protectSector(FLASH_MAIN_MEMORY_SPACE_BANK1,FLASH_SECTOR31);
            printf("Write to memory completed\r\n") ;

            //Turn on the LED and run in a loop
            GPIO_setOutputHighOnPin(RED);
            s1_state = 0;
            while(1){};

        }
    }else if(s2_state){//Needs to transmit data via UART
        //Turn off LED
        GPIO_setOutputLowOnPin(RED);

        float *temp_from_flash = (float*)MAIN_1_SECTOR_31;
        //Format all 30 values from flash memory and then send the data
        for(j = 0; j < 30; j++){
            sprintf(buffer, "%.2f F", temp_from_flash[j]);
            //Send the data via UART to PuTTy
            for(i = 0; i < 50; i++){
                while((UCA0IFG & 0x02) == 0){} ;                  // (UCA0IFG & 0x02) == 0 will evaluate to true when TXIFG bit is set, false when TXIFG bit is clear
                UART_transmitData(EUSCI_A0_BASE, buffer[i]) ;  // Send each character in the text string through UART
            }
            // End the line in terminal window
            while((UCA0IFG & 0x02) == 0){};
            UART_transmitData(EUSCI_A0_BASE, 0x0D);      // write carriage return '\r'

            while((UCA0IFG & 0x02) == 0){};
            UART_transmitData(EUSCI_A0_BASE, 0x0A);      // write newline '\n'

        }
        s2_state = 0;
    }


}
