#include "init.h"
#include "boardConfig.h"
#include "../IOManager/pwm.h"
#include "../IOManager/delay.h"
#include "../IOManager/eeprom.h"
#include "../IOManager/battery.h"
#include "../Programming/program.h"
#include "stm8s.h"

uint8_t reprogram_count = 20;

void init_gpio(){
	GPIOA->ODR = 0x00;
	GPIOB->ODR = 0x00;
	GPIOC->ODR = 0x00;
	GPIOD->ODR = 0x00;
	
	GPIOA->DDR = 0xEF;
	GPIOA->CR1 = 0xFF;
	
	GPIOB->DDR = 0xFF;
	GPIOB->CR1 = 0xFF;
	
	GPIOC->DDR = 0x37;//0x3F;
	GPIOC->CR1 = 0xFF;
	
	GPIOD->DDR = 0xFD;
	GPIOD->CR1 = 0xFF;
	
	GPIOB->ODR = 0x10;
	GPIOD->ODR = 0x10;

}

void init_sys_clk(){
	CLK->ICKR = 0;                       //  Reset the Internal Clock Register.
    CLK->ICKR |= CLK_ICKR_HSIEN;  		 //  Enable the HSI.
    CLK->ECKR = 0;                       //  Disable the external clock.
    while ((CLK->ICKR & CLK_ICKR_HSIRDY) == 0);//  Wait for the HSI to be ready for use.
    CLK->CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
    CLK->PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
    CLK->PCKENR2 = 0xff;                 //  Ditto.
    CLK->CCOR = 0;                       //  Turn off CCO.
    CLK->HSITRIMR = 0;                   //  Turn off any HSIU trimming.
    CLK->SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
    CLK->SWR = 0xe1;                     //  Use HSI as the clock source.
    CLK->SWCR = 0;                       //  Reset the clock switch control register.
    CLK->SWCR |= CLK_SWCR_SWEN;   		 //  Enable switching.
    while ((CLK->SWCR & CLK_SWCR_SWBSY) != 0);      //  Pause while the clock switch is busy.
}

void strobe_leds(){
    for(int i = 0; i < 1000; i++){
        delay_ms(100);
        LED_GPIO->ODR ^= BLUE_LED;
        LED_GREEN_GPIO->ODR ^= GREEN_LED;
    }
}

void init(){
	init_sys_clk();
	init_gpio();
	reset_timer1();
	reset_timer2();
	PWM_input_init();
	enable_interrupts();
	start_up_sequence();
	load_settings_from_eeprom();
	while(get_ch1() > 1050){
		measure_input();
	}
	battery_init();
	PWM_output_init();
}

void start_up_sequence(){
	while(get_ch1() == 0){
		measure_input();
	}
	delay_ms(500);
	uint16_t input = 0;
	input = get_avg_input();
	if(input < 1200){
		return;
	}else{
		input = get_avg_input();
		uint8_t count = 0;
		uint16_t throttle = input;
		// check that throttle is above 20% for 2 seconds with 100ms intervals
		while(count < reprogram_count+1){
			input = get_avg_input();
			// delay for 100ms
			delay_ms(100);
			// increment the counter
			count++;
			// get the current throttle input value
			uint16_t tmp_throttle = input;
			// If the throttle value is larger than the largest recorded, then record the new max
			if(tmp_throttle > throttle){
				throttle = tmp_throttle;
			}
			// If throttle goes below the 20% threshold, then leave the loop and save off the max throttle value as the max input range
			if(tmp_throttle < 1200){
				break;
			}
		}
		// if we never reached the 2 second count then we save off the max throttle and leave
		if(count < reprogram_count){
			set_max_input(throttle);
			return;
		}else{
			// otherwise we save the max throttle, then go to reprogramming
			reprogram();
			set_max_input(throttle);		
			return;
		}
	}
}

void load_settings_from_eeprom(){
	if(SAVED == SAVED_KEY){
		set_mix_amount(MIX_AMOUNT);
		set_mix_dir(MIX_DIR);
		set_lvco(LOW_VOLT_THRESH);
		set_freq(DRIVE_FREQ_H, DRIVE_FREQ_L);
		set_dead_band(DEAD_BAND);
	}else{
		write_to_eeprom(&SAVED, SAVED_KEY);
		write_to_eeprom(&MIX_AMOUNT, DEFAULT_MIX);
		write_to_eeprom(&MIX_DIR, DEFAULT_MIX_DIR);
		write_to_eeprom(&LOW_VOLT_THRESH, DEFAULT_LVCO);
		write_to_eeprom(&DRIVE_FREQ_H, DEFAULT_FREQ_H);
		write_to_eeprom(&DRIVE_FREQ_L, DEFAULT_FREQ_L);
		write_to_eeprom(&DEAD_BAND, DEFAULT_DEADBAND);
		load_settings_from_eeprom();
	}
	return;
}
