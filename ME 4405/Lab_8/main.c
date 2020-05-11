/**
 * ME 4405 - Fundamentals of Mechatronics
 * Lab 7: Stepper Motor Control
 * Author: Ashley Eggart
 * Date: 4/9/20
 *
 */
#include "main.h"

//Declare global variables
int b1state = 0;   //Indicates if motor is on in b1 direction
int b2state = 0;   //Indicates if motor is on in b2 direction
int lastDutyCycle = 225;
int potV = 0;
int Dcycle = 0;
int i = 0;

void main(void)
{
    // Disable the Watchdog Timer
    WDT_A_holdTimer() ;

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

    /* Setting MCLK to REFO at 128Khz for LF mode
     * Setting SMCLK to 64Khz*/
    CS_setReferenceOscillatorFrequency(CS_REFO_128KHZ);
    CS_initClockSignal(CS_MCLK, CS_REFOCLK_SELECT, CS_CLOCK_DIVIDER_1);
    CS_initClockSignal(CS_SMCLK, CS_REFOCLK_SELECT, CS_CLOCK_DIVIDER_2);

    /* Configuring GPIO2.4 and GPIO2.5 as peripheral output for PWM and buttons
     * interrupt */
    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN4,GPIO_PRIMARY_MODULE_FUNCTION);
    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN5,GPIO_PRIMARY_MODULE_FUNCTION);
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P5, GPIO_PIN5, GPIO_TERTIARY_MODULE_FUNCTION);
    GPIO_clearInterruptFlag(BUTTON1);
    GPIO_enableInterrupt(BUTTON1);
    GPIO_clearInterruptFlag(BUTTON2);
    GPIO_enableInterrupt(BUTTON2);

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

    //Enable Interrupts
    Interrupt_enableInterrupt(INT_PORT1);

    //Set interrupt priority (0 is highest)
    Interrupt_setPriority(INT_PORT1,(0<<5));

    Interrupt_enableMaster();// Enable all interrupts

    ADC14_toggleConversionTrigger();// Initializes the trigger

    while(1){

        ADC14_toggleConversionTrigger();
        potV = ADC14_getResult(ADC_MEM0);  //Read the ADC value
        Dcycle = 2250/1023 * potV;
        printf("%i %i\n", potV, Dcycle);
        if(b1state == 1 && b2state  == 0){//Motor is running Button1
            pwmConfig.dutyCycle = Dcycle;
            pwmConfig2.dutyCycle = 0;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);

        }else if(b1state == 0 && b2state  == 1){// Motor is running Button2
            pwmConfig.dutyCycle = 0;
            pwmConfig2.dutyCycle = Dcycle;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
        }else{// If neither motor is running
            lastDutyCycle = Dcycle;
        }
        for(i = 0; i < 1000; i++){}    //Delay
    }
}

void PORT1_IRQHandler(void)
{
    uint32_t status = GPIO_getEnabledInterruptStatus(GPIO_PORT_P1);
    GPIO_clearInterruptFlag(GPIO_PORT_P1, status);

    if (status & GPIO_PIN1)
    {
        if (b1state == 1 && b2state  == 0){
            // If motor is already on and running in right direction turn it off
            GPIO_setOutputLowOnPin(RED);
            lastDutyCycle = pwmConfig.dutyCycle;
            pwmConfig.dutyCycle = 0;
            pwmConfig2.dutyCycle = 0;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
            //printf("%s DutyCycle:%i\n", "Turn off Button 1", lastDutyCycle);
            b1state = 0;
        } else if (b1state == 0 && b2state  == 0){
            // If motor is all the way off turn it on
            GPIO_setOutputHighOnPin(RED);
            pwmConfig.dutyCycle = lastDutyCycle;
            pwmConfig2.dutyCycle = 0;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);    //Make sure pwm is off on other channel
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);     //Turn on the correct pwm
            //printf("%s DutyCycle:%i\n", "Turn on Button 1", lastDutyCycle);
            b1state = 1;

        }
    } else if (status & GPIO_PIN4) {
        if (b2state == 1 && b1state  == 0){
            // If motor is already on and running in right direction turn it off
            GPIO_setOutputLowOnPin(RED);
            lastDutyCycle = pwmConfig2.dutyCycle;
            pwmConfig.dutyCycle = 0;
            pwmConfig2.dutyCycle = 0;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
            //printf("%s DutyCycle:%i\n", "Turn off Button 2", lastDutyCycle);
            b2state = 0;
        } else if (b1state == 0 && b2state  == 0){
            // If motor is all the way off turn it on
            printf("%s\n", "Turn on Button 2");
            GPIO_setOutputHighOnPin(RED);
            pwmConfig2.dutyCycle = 0;
            pwmConfig2.dutyCycle = lastDutyCycle;
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);     //Make sure the other one is turned off
            Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);    //Turn on the correct one
            //printf("%s DutyCycle:%i\n", "Turn on Button 2", lastDutyCycle);
            b2state = 1;

        }
    }
}
