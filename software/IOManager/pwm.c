#include "pwm.h"
#include "stm8s.h"
#include "delay.h"
#include "battery.h"
#include "boardConfig.h"
#include <stdio.h>

uint32_t F_CNT = 						150000;

uint16_t ARR_1 = 						65535;
uint16_t ARR_2 = 						799;

uint16_t pulseCH1 = 					0;
uint16_t pulseCH1_last[4] = 			{0,0,0,0};

uint16_t pulseCH2 = 					0;
uint16_t pulseCH2_last[4] = 			{0,0,0,0};

uint16_t pulseCH1Out = 					0;
uint16_t pulseCH2Out = 					0;

uint16_t PULSE_CHANGE_THRESH =			900;

uint8_t state = 						0;

uint16_t ch1_start = 					0;
uint16_t ch1_end = 						0;
uint8_t ch1_state = 					0;
uint64_t diff1 =                        0;

uint16_t ch2_start = 					0;
uint16_t ch2_end = 						0;
uint8_t ch2_state =						0;
uint64_t diff2 =                        0;

uint8_t mix = 							30;
uint8_t mix_dir = 						0;
uint8_t dead_band = 					8;
uint8_t freq_H = 						30;
uint8_t freq_L = 						30;

uint16_t max_throttle = 				2000;

/* PIN OUT
 *
 * TIM1_CH1: PC6 AF (also MOSI)								
 * TIM1_CH2: PC7 AF (also MISO)								
 * TIM2_CH1: PC5 AF (also SPI_SCK) PD4 (also UART1_CK)		
 * TIM2_CH2: PD3 (also AIN4)								
 *
 */
 
 /**
   *	Resets Timer 1 to known values
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
 void reset_timer1(){
	TIM1->CR1	= 0;
	TIM1->CR2	= 0;
	TIM1->IER	= 0;
	TIM1->ETR	= 0;
	TIM1->SMCR	= 0;
	TIM1->EGR	= 0;
	TIM1->SR2	= 0;
	TIM1->CCER1	= 0;
	TIM1->CCER2	= 0;
	TIM1->CCMR1	= 0;
	TIM1->CCMR2	= 0;
	TIM1->CCMR3	= 0;
	TIM1->CCMR4	= 0;
	TIM1->CNTRH	= 0;
	TIM1->CNTRL	= 0;
	TIM1->PSCRH	= 0;
	TIM1->PSCRL	= 0;
	TIM1->ARRH	= 0;
	TIM1->ARRL	= 0;
	TIM1->CCR1H	= 0;
	TIM1->CCR1L	= 0;
	TIM1->CCR2H	= 0;
	TIM1->CCR2L	= 0;
	TIM1->CCR3H	= 0;
	TIM1->CCR3L	= 0;
	TIM1->SR1	= 0;
 } 
 
  /**
   *	Resets Timer 2 to known values
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
 void reset_timer2(){
	TIM2->CR1	= 0;
	TIM2->IER	= 0;
	TIM2->SR2	= 0;
	TIM2->CCER1	= 0;
	TIM2->CCER2	= 0;
	TIM2->CCMR1	= 0;
	TIM2->CCMR2	= 0;
	TIM2->CCMR3	= 0;
	TIM2->CNTRH	= 0;
	TIM2->CNTRL	= 0;
	TIM2->PSCR	= 0;
	TIM2->ARRH	= 0;
	TIM2->ARRL	= 0;
	TIM2->CCR1H	= 0;
	TIM2->CCR1L	= 0;
	TIM2->CCR2H	= 0;
	TIM2->CCR2L	= 0;
	TIM2->CCR3H	= 0;
	TIM2->CCR3L	= 0;
	TIM2->SR1	= 0;
 }
 
  /**
   *	Calls timer 1 initiliziation function to configure Timer1 for PWM input
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
void PWM_input_init() {
	// configure TIM1 for PWM input on ch 1,2
	timer1_init();
}

  /**
   *	Calls timer 2 initiliziation function to configure Timer2 for PWM output
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
void PWM_output_init() {
	// configure TIM2 for PWM output on ch 1,2
	timer2_init();
}

  /**
   *	Configures Timer1 for PWM input using capture/compare on CH1 and on CH2.
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
void timer1_init(){
	
	ITC->ISPR4 |= 0x03;
	
	TIM1->CCMR1 = TIM1_CCMR_CCxS_INPUT1;
	TIM1->CCMR2 = TIM1_CCMR_CCxS_INPUT2;
	TIM1->CCMR3 = TIM1_CCMR_CCxS_INPUT1;
	TIM1->CCMR4 = TIM1_CCMR_CCxS_INPUT2;

	uint16_t div = (uint16_t)(F_CPU / F_CNT)-1;
	
	if(div == 0){
		TIM1->PSCRH 	= 0x00;
		TIM1->PSCRL 	= 0x00;
	}else{
		TIM1->PSCRH 	= (uint8_t)((div >> 8) & 0xFF);
		TIM1->PSCRL 	= (uint8_t)((div) & 0xFF);
	}
	
	TIM1->ARRH	= (uint8_t)(ARR_1 >> 8);
	TIM1->ARRL	= (uint8_t)(ARR_1 & 0xFF);
	
	TIM1->CCER1 = TIM1_CCER1_CC1E | TIM1_CCER1_CC2E | TIM1_CCER1_CC2P;
	TIM1->CCER2 = TIM1_CCER2_CC3E | TIM1_CCER2_CC4E | TIM1_CCER2_CC4P;

	TIM1->IER =  TIM1_IER_CC1IE | TIM1_IER_CC2IE | TIM1_IER_CC3IE| TIM1_IER_CC4IE;
	
	TIM1->CR1 = TIM1_CR1_CEN;
}

  /**
   *	Configures Timer2 for PWM output on CH1 and CH2, frequency is set to 10kHz by default, frequency is configurable as part of programming
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: Void
   */
void timer2_init(){
	
	TIM2->PSCR	= 0x00;
	TIM2->ARRH	= (uint8_t)(ARR_2 >> 8);
	TIM2->ARRL	= (uint8_t)(ARR_2 & 0xFF);
	TIM2->PSCR	= 0x00;
	
	TIM2->CCR1H	= 0x00;
	TIM2->CCR1L	= 0x00;
	
	TIM2->CCR2H	= 0x00;
	TIM2->CCR2L	= 0x00;
	
	TIM2->CCMR1	= 0x60;
	TIM2->CCMR2	= 0x60;
	
	TIM2->CCER1	= 0x11;
	TIM2->CCER2	= 0x00;
	
	TIM2->CR1	= 0x81;
}

  /**
   *	Writes the Timer CCR values for output on TIM2 for CH1 and CH2
   *
   * 	@param: data1 ccr value for PWM output CH1 on TIM2
   * 	@param: data2 ccr value for PWM output CH2 on TIM2
   *	@return: Void
   */
void PWM_set(uint16_t data1, uint16_t data2) {
	TIM2->CCR1H = (uint8_t)(data1 >> 8);
	TIM2->CCR1L = (uint8_t)(data1 & 0xFF);
	TIM2->CCR2H = (uint8_t)(data2 >> 8);
	TIM2->CCR2L = (uint8_t)(data2 & 0xFF);
	return;
}

  /**
   *	Interrupt handler for Capture/Compare on CH1 and CH2 of TIM1. Used to measure the pulse width of the throttle and mix inputs.
   *
   * 	@param: Void
   *	@return: Void
   */
void pwm_isr(void) __interrupt(TIM1_CC_ISR){
	
	if(TIM1->SR1 & TIM1_SR1_CC1IF){
	    ch1_start = get_tim1_ccr1();
	    TIM1->SR1 &= ~TIM1_SR1_CC1IF;
	}else if(TIM1->SR1 & TIM1_SR1_CC2IF){
	    ch1_end = get_tim1_ccr2();
	    TIM1->SR1 &= ~TIM1_SR1_CC2IF;
	    diff1 = ch1_end - ch1_start;
	}else if(TIM1->SR1 & TIM1_SR1_CC3IF){
	    ch2_start = get_tim1_ccr3();
	    TIM1->SR1 &= ~TIM1_SR1_CC3IF;
	}else if(TIM1->SR1 & TIM1_SR1_CC4IF){
	    ch2_end = get_tim1_ccr4();
	    TIM1->SR1 &= ~TIM1_SR1_CC4IF;
	    diff2 = ch2_end - ch2_start;
	}
}

  /**
   *	Returns the current input value for CH1
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: pulseCH1 Current input for CH1, unmixed
   */
uint16_t get_ch1(){
	return pulseCH1;
}

  /**
   *	Returns the current input value for CH2
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: pulseCH2 Current input for CH2, unmixed
   */
uint16_t get_ch2(){
	return pulseCH2;
}

  /**
   *	Returns the current input value for CH1
   *
   *	Used as part of initilization
   * 	@param: Void
   *	@return: pulseCH1 Current input for CH1, unmixed
   */
void write_motors(){
	uint16_t ch1 = 0;
	uint16_t mult = 100;
	if(is_lvco()){
		mult = 50;
	}
	if(pulseCH1Out > 1050){
		ch1 = (uint16_t)((((uint64_t)pulseCH1Out-1000)*ARR_2)/1000);
	}else if(pulseCH1Out > 2000){
		ch1 = ARR_2;
	}
	ch1 = ((uint32_t)ch1*mult)/100;
	
	uint16_t ch2 = 0;
	if(pulseCH2Out > 1000){
		ch2 = (uint16_t)((((uint64_t)pulseCH2Out-1000)*ARR_2)/1000);
	}else if(pulseCH2Out > 2000){
		ch2 = ARR_2;
	}
	ch2 = ((uint32_t)ch2*mult)/100;
	
	PWM_set(ch1,ch2);
}


void mix_channels(){
	if (mix == 0){
		pulseCH1Out = pulseCH1;
		pulseCH2Out = pulseCH1;
	}else if (mix > 100){
		if(mix_dir == 0){
			pulseCH1Out = pulseCH1;
			pulseCH2Out = pulseCH2;
		}else{
			pulseCH1Out = pulseCH2;
			pulseCH2Out = pulseCH1;
		}
	}else{
		int16_t dir = ((int16_t)pulseCH2 - 1500);
		dir = (((int32_t)dir*mix)/100);
		
		if(mix_dir == 0){
			pulseCH1Out = pulseCH1 + dir;
			pulseCH2Out = pulseCH1 - dir;
		}else{
			pulseCH1Out = pulseCH1 - dir;
			pulseCH2Out = pulseCH1 + dir;
		}
	}
	
}

uint16_t get_tim1_cntr(){
	uint16_t tmp = TIM1->CNTRH << 8;
	tmp |= TIM1->CNTRL;
	return tmp;
}

uint16_t get_tim1_ccr1(){
	uint16_t tmp = TIM1->CCR1H << 8;
	tmp |= TIM1->CCR1L;
	return tmp;
}

uint16_t get_tim1_ccr2(){
	uint16_t tmp = TIM1->CCR2H << 8;
	tmp |= TIM1->CCR2L;
	return tmp;
}

uint16_t get_tim1_ccr3(){
	uint16_t tmp = TIM1->CCR3H << 8;
	tmp |= TIM1->CCR3L;
	return tmp;
}

uint16_t get_tim1_ccr4(){
    uint16_t tmp = TIM1->CCR4H << 8;
    tmp |= TIM1->CCR4L;
    return tmp;
}

void measure_input(){
	uint16_t pulseCH1_tmp = (uint16_t)((diff1*1000000)/F_CNT);
	pulseCH1 += pulseCH1_tmp/4 - pulseCH1_last[3]/4;
	shift_CH1_last(pulseCH1_tmp);

	uint16_t pulseCH2_tmp = (uint16_t)((diff2*1000000)/F_CNT);

	if(pulseCH2_tmp > 1500){
	    if(pulseCH2_tmp - 1500 < dead_band){
	        pulseCH2_tmp = 1500;
	    }
	}else{
	    if(1500 - pulseCH2_tmp < dead_band){
	        pulseCH2_tmp = 1500;
	    }
	}

	pulseCH2 += pulseCH2_tmp/4 - pulseCH2_last[3]/4;
	shift_CH2_last(pulseCH2_tmp);
}

void set_max_input(uint16_t throttle){
	if(throttle > 1800){
		max_throttle = throttle;
	}
	return;
}

void set_mix_amount(uint8_t val){
	mix = val;
}

void set_mix_dir(uint8_t val){
	mix_dir = val;
}

void set_freq(uint8_t val_h, uint8_t val_l){
	ARR_2 = ((uint16_t)val_h << 8) + val_l;
	TIM2->ARRH	= val_h;
	TIM2->ARRL	= val_l;
}

void set_dead_band(uint8_t val){
	switch(val){
		case 0:
			dead_band = 18;
			break;
		case 1:
			dead_band = 22;
			break;
		case 2:
			dead_band = 28;
			break;
		case 3:
			dead_band = 35;
			break;
	}
	return;
}

void shift_CH1_last(uint16_t new_val){
	pulseCH1_last[3] = pulseCH1_last[2];
	pulseCH1_last[2] = pulseCH1_last[1];
	pulseCH1_last[1] = pulseCH1_last[0];
	pulseCH1_last[0] = new_val;
}

void shift_CH2_last(uint16_t new_val){
	pulseCH2_last[3] = pulseCH2_last[2];
	pulseCH2_last[2] = pulseCH2_last[1];
	pulseCH2_last[1] = pulseCH2_last[0];
	pulseCH2_last[0] = new_val;
}

