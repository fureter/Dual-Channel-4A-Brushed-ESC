#include "battery.h"
#include "stm8s.h"
#include <stdio.h>

uint16_t volt = 0; // Battery voltage of the last reading, scaled by 100. This is the reference voltage for the ADC periph
uint16_t lvco = 0; // low voltage cutoff value, if 0 lvco is not enabled
uint16_t V_REF = 5125;	//known voltage reference.
uint16_t n = 1024; // 10-bit ADC divisions.

uint32_t meas_coeff = 0;

/* Each overflow is equivalent to 2 milli-seconds since the timer is clocked at 500hz updates */
uint64_t tim4_overflow = 0;
/* Timer 4 is set to 12.5kHz, using an AAR of 251 make the update interval 500hz */
uint16_t ARR_4 = 251;
/* Previous time the battery voltage was measured */
uint64_t last_time = 0;
/* measurement frequency for the battery, default is 1hz and is only changeable in SW currently */
uint16_t meas_freq = 1;
/* time in ms between each measurement, meas_timing = 1000/meas_freq */
uint16_t meas_timing = 0;
/* Flag that other parts of SW can use to trigger a 1hz event, currently only used for debug */
uint8_t one_hz_true = 0;

uint8_t one_hz(){
	if(one_hz_true){
		one_hz_true = 0;
		return 1;
	}
	return 0;
}

void battery_init(){
	/* configure ADC channel 3 (PD2)  */
    ADC1->CSR |= 0x03;
    /* right-align data */
    ADC1->CR2 |= ADC1_CR2_ALIGN;
    /* wake ADC from power down */
    ADC1->CR1 |= ADC1_CR1_ADON;
	
	tim4_init();
	
	meas_coeff = ((uint32_t)V_REF/n);
	meas_timing = 1000/meas_freq;
}

void tim4_init(){
	TIM4->PSCR	= 0x00;
	TIM4->ARR	= ARR_4;
	TIM4->PSCR	= 0x07;
	
	/* Enable update interrupts */
	TIM4->IER = 0x01;
	
	TIM4->CR1	= 0x01;
}

uint64_t get_ms(){
	uint64_t tim = tim4_overflow*2;
	tim += (((uint32_t)get_tim4_cntr())*8)/1000;
	return tim;
}

void read_battery_voltage(){
	if((get_ms() - last_time) > meas_timing){
		one_hz_true = 1;
		uint8_t adc_h, adc_l;
		ADC1->CR1 |= ADC1_CR1_ADON;
		while (!(ADC1->CSR & ADC1_CSR_EOC));
		adc_l = ADC1->DRL;
		adc_h = ADC1->DRH;
		ADC1->CSR &= ~ADC1_CSR_EOC; // clear EOC flag
		uint16_t meas = ((adc_h << 8) + adc_l);
		volt = meas*meas_coeff;
		last_time = get_ms();
	}
	return;
}

void set_lvco(uint8_t val){
	switch(val){
		case 0:
			lvco = 0;
			break;
		case 1:
			lvco = 3300;
			break;
		case 2:
			lvco = 3100;
			break;
		case 3:
			lvco = 2900;
			break;
	}
	return;
	
}

uint8_t is_lvco(){
	if(lvco == 0){
		return 0;
	}else{
		if (volt < lvco){
			return 1;
		}
	}
	return 0;
}

uint8_t get_tim4_cntr(){
	return TIM4->CNTR;
}

uint16_t get_battery_voltage(){
	return volt;
}

void tim4_isr(void) __interrupt(TIM4_ISR){
	tim4_overflow += 1;
	TIM4->SR1 = 0x00;
}