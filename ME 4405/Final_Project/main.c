/**
 * ME 4405 - Fundamentals of Mechatronics
 * Final Project- The Helping Hand
 * Author: Ashley Eggart
 * Date: 4/20/20
 * Description: Code never tested and does not run but gives rough outline
 * for some of the main aspects that need to be implemented for the final
 * project to create a hand that gives hand hugs.
 *
 */

#include "main.h"

//Declare global variables
    int i = 0;
    int j = 0;
    int N = 50;     //Number of data points to average across
    volatile float forceBuffer[50];
    int *front = forceBuffer;   //Pointer to start of buffer
    float force = 0;
    float forceV = 0;
    int Dcycle = 0;
    //Statics
    static volatile uint8_t RXData[4];
    static volatile uint32_t xferIndex;
    static volatile uint32_t numOfRecBytes;

void main(void)
{
    // Disable the Watchdog Timer
    WDT_A_holdTimer();

    //Interrupt disable master
    Interrupt_disableMaster();
    xferIndex = 0;

    //Enable ADC module
    ADC14_enableModule();

    /* Setting MCLK to REFO at 128Khz for LF mode
     * Setting SMCLK to 64Khz*///-maybe right
    CS_setReferenceOscillatorFrequency(CS_REFO_128KHZ);
    CS_initClockSignal(CS_MCLK, CS_REFOCLK_SELECT, CS_CLOCK_DIVIDER_1);
    CS_initClockSignal(CS_SMCLK, CS_REFOCLK_SELECT, CS_CLOCK_DIVIDER_2);

    /* Select Port 1 for I2C - Set Pin 6, 7 to input Primary Module Function,
     *   (UCB0SIMO/UCB0SDA, UCB0SOMI/UCB0SCL). and setting P5.5 for input mode
     *   with pull-up enabled
     */
    GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P1, GPIO_PIN6 + GPIO_PIN7, GPIO_PRIMARY_MODULE_FUNCTION);
    GPIO_setAsInputPinWithPullUpResistor(GPIO_PORT_P5, GPIO_PIN5);
    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN4,GPIO_PRIMARY_MODULE_FUNCTION);
    GPIO_setAsPeripheralModuleFunctionOutputPin(GPIO_PORT_P2, GPIO_PIN5,GPIO_PRIMARY_MODULE_FUNCTION);

    /* Initializing I2C Master to SMCLK at 100khz with no autostop */
    I2C_initMaster(EUSCI_B0_BASE, &i2cConfig);
    I2C_setSlaveAddress(EUSCI_B0_BASE,SLAVE_ADDRESS_1);

    //Set Resolution- 10 bits
    ADC14_setResolution(ADC_10BIT);

    //Set clock sources
    ADC14_initModule(ADC_CLOCKSOURCE_MCLK, ADC_PREDIVIDER_1, ADC_DIVIDER_1, ADC_TEMPSENSEMAP);

    //Configure Sampling Mode
    ADC14_configureSingleSampleMode(ADC_MEM0, false);

    /* Set in receive mode */
    I2C_setMode(EUSCI_B0_BASE, EUSCI_B_I2C_RECEIVE_MODE);

    /* Clearing interrupts for I2C and enabling the module */
    I2C_enableModule(EUSCI_B0_BASE);
    I2C_clearInterruptFlag(EUSCI_B0_BASE, EUSCI_B_I2C_RECEIVE_INTERRUPT0);
    //Set reference voltage to be 2.5 volts
    REF_A_setReferenceVoltage(REF_A_VREF2_5V);
    //Configure Conversion Memory and Voltage Range
    ADC14_configureConversionMemory(ADC_MEM0, ADC_VREFPOS_INTBUF_VREFNEG_VSS, ADC_INPUT_A0, false);
    /* Clearing/Enabling interrupts for GPIO P5.5 */
    GPIO_clearInterruptFlag(GPIO_PORT_P5, GPIO_PIN5);
    GPIO_interruptEdgeSelect(GPIO_PORT_P5, GPIO_PIN5, GPIO_HIGH_TO_LOW_TRANSITION);
    GPIO_enableInterrupt(GPIO_PORT_P5, GPIO_PIN5);
    Interrupt_enableInterrupt(INT_PORT5);
    Interrupt_enableInterrupt(INT_EUSCIB0);
    Interrupt_enableSleepOnIsrExit();
    ADC14_enableSampleTimer(ADC_MANUAL_ITERATION);
    ADC14_enableInterrupt(ADC_INT0);
    ADC14_enableConversion();

    /* Enabling master interrupts */
    Interrupt_enableMaster();

    // Sleep when not in use
    while(1){
        PCM_gotoLPM0();
    }
}

void closeThumb(void){

    ADC14_toggleConversionTrigger();
    while(ADC14_isBusy()){
        forceV = ADC14_getResult(ADC_MEM0);  //Read the ADC value
        *(front + i) = (2.5/1023) * forceV;   //Convert voltage to force
        i++;
        if(i == N){     // If maximum number of points have been collected
            for (j = 0; j < N; j++){
                force += forceBuffer[j];
            }
            force = force/N;    //average the first N force values
            front++;            //Pop the first array value
            i--;
        }
        //Generate PWM signal to close thumb
        Dcycle = force * 100;
        pwmConfig.dutyCycle = Dcycle;
        pwmConfig2.dutyCycle = 0;
        Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
        Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);
    }
    if (force == 0.1){//If thumb is touching the hand
        for(i = 0; i < 1000; i++){}    //Delay to perform hug
        //Reverse thumb direction to release hand
        pwmConfig.dutyCycle = 0;
        pwmConfig2.dutyCycle = Dcycle;
        Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig);
        Timer_A_generatePWM(TIMER_A0_BASE, &pwmConfig2);
    }
}


/******************************************************************************
 * The USCI_B0 data ISR RX vector is used to move received data from the I2C
 * master to the MSP432 memory.
 ******************************************************************************/
void EUSCIB0_IRQHandler(void)
{
    uint_fast16_t status;

    status = I2C_getEnabledInterruptStatus(EUSCI_B0_BASE);
    I2C_clearInterruptFlag(EUSCI_B0_BASE, status);

    /* RXIFG */
    if (status & EUSCI_B_I2C_RECEIVE_INTERRUPT0)
    {
        if(xferIndex == numOfRecBytes - 2)
        {
            I2C_masterReceiveMultiByteStop(EUSCI_B0_BASE);
        }

        RXData[xferIndex++] = I2C_masterReceiveMultiByteNext(EUSCI_B0_BASE);

        /* The first byte of the transfer is how many bytes (including the
         * length byte) that the master should read */
        if(xferIndex == 1)
        {
            numOfRecBytes = RXData[0];
        }
        else if(xferIndex == numOfRecBytes)
        {
            I2C_disableInterrupt(EUSCI_B0_BASE, EUSCI_B_I2C_RECEIVE_INTERRUPT0);
            GPIO_enableInterrupt(GPIO_PORT_P5, GPIO_PIN5);
            xferIndex = 0;
            numOfRecBytes = 0;
        }
        closeThumb();
    }
}

/* ISR that handles slave initiated GPIO interrupt. In this interrupt, the
 * master will initiate the read from the slave.
 */
void PORT5_IRQHandler(void)
{
    uint_fast16_t status;

    status = GPIO_getEnabledInterruptStatus(GPIO_PORT_P5);
    GPIO_clearInterruptFlag(GPIO_PORT_P5, status);

    /* If P1.0 was interrupted, initiate an I2C read */
    if (status & GPIO_PIN5)
    {
        I2C_masterReceiveStart(EUSCI_B0_BASE);
        I2C_enableInterrupt(EUSCI_B0_BASE, EUSCI_B_I2C_RECEIVE_INTERRUPT0);
        GPIO_disableInterrupt(GPIO_PORT_P5, GPIO_PIN5);
    }
}

