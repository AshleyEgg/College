/**
 * ME 4405 - Fundamentals of Mechatronics
 * Lab 5: Analog to Digital Conversion
 * Author: Ashley Eggart
 * Date: 2/27/20
 *
 * Simple program to read analog data from a temperature sensor circuit
 * and convert it to a digital signal. If the temperature reading is over 80F
 * a red LED is turned on the MSP432
 */

#include "msp.h"
#include "stdio.h"
#include "driverlib.h"
#include "string.h"
#include "timer_a.h"

float tempV = 0;
int i = 0;
float temp;

//From slides used to configure TimerA in Up Mode-maybe takes into consideration
const Timer_A_UpModeConfig upConfig_0 =     // Configure counter in Up mode
{
    TIMER_A_CLOCKSOURCE_SMCLK,              // Tie Timer A to SMCLK
    TIMER_A_CLOCKSOURCE_DIVIDER_64,         // Increment counter every 64 clock cycles
    10000,                                  // Period of Timer A (this value placed in TAxCCR0)-probably needs to be changed so it is 1 sec
    TIMER_A_TAIE_INTERRUPT_DISABLE,         // Disable Timer A rollover interrupt
    TIMER_A_CCIE_CCR0_INTERRUPT_ENABLE,     // Enable Capture Compare interrupt
    TIMER_A_DO_CLEAR                        // Clear counter upon initialization};
};


void main(void)
{
    WDT_A_holdTimer();		// stop watch dog timer

    //Interrupt disable master
    Interrupt_disableMaster();

    //Enable ADC module
    ADC14_enableModule();

	//From slides-Go through steps to configure Timer A
	CS_setDCOFrequency(1.5E+6);// Set DCO clock source frequency
	CS_initClockSignal(CS_SMCLK, CS_DCOCLK_SELECT, CS_CLOCK_DIVIDER_1);  // Tie SMCLK to DCO
	Timer_A_configureUpMode(TIMER_A0_BASE, &upConfig_0);  // Configure Timer A using above struct
	GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P5, GPIO_PIN5, GPIO_TERTIARY_MODULE_FUNCTION);

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

    ADC14_enableSampleTimer(ADC_MANUAL_ITERATION);

    ADC14_enableInterrupt(ADC_INT0);
    ADC14_enableConversion();

    Interrupt_enableInterrupt(INT_TA0_0);// Enable Timer A interrupt- must be called before timer start

	Timer_A_startCounter(TIMER_A0_BASE, TIMER_A_UP_MODE);  // Start Timer A- must be called after enable timer A interrupt
	Interrupt_enableMaster();// Enable all interrupts

    //Set up initial values and pin configurations for red LED as output
    GPIO_setAsOutputPin(GPIO_PORT_P1,GPIO_PIN0);
    GPIO_setOutputLowOnPin(GPIO_PORT_P1,GPIO_PIN0);

	ADC14_toggleConversionTrigger();// Initializes the trigger

	//Run forever with interrupts being the only thing to break the loop
	while(1){}
}

void TA0_0_IRQHandler(void){
    //Timer A interrupt - occurs every second
    Timer_A_clearCaptureCompareInterrupt(TIMER_A0_BASE, TIMER_A_CAPTURECOMPARE_REGISTER_0);
    ADC14_toggleConversionTrigger();

    while(ADC14_isBusy()){
        tempV = ADC14_getResult(ADC_MEM0);  //Read the ADC value
        temp = (2.5/1023) * 60 * tempV;     //Do the math from the slides to convert from ADC values to temperature value

        //printf("Current Temperature: %f F \n", temp);
        printf("%f\n", temp);
        //Turn on the red led on the MSP when the temperature is above 80F
        if (temp > 80) {
            GPIO_setOutputHighOnPin(GPIO_PORT_P1,GPIO_PIN0);
        } else{
            GPIO_setOutputLowOnPin(GPIO_PORT_P1,GPIO_PIN0);
        }
    }
}
