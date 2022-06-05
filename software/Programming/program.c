#include "program.h"
#include "../IOManager/delay.h"
#include "../IOManager/pwm.h"
#include "../IOManager/eeprom.h"
#include "stm8s.h"
#include "boardConfig.h"

uint16_t off_time = 200;
uint16_t on_time = 300;

uint16_t DELAY = 800;

// handles changing the eeprom saved settings, uses the onboard LED as a visual indicator for what settings are being changed
void reprogram(void){
	/* Reprogramable settings:
	 *
	 * 1. Mix Amount/Type: Sets the mixing type/amount. can be 10,30,50,70,100%, no mixing, or mix drives motor 1/2 and throttle drives the other.
	 * 2. Mix Direction: Sets the mixing direction, so which motor is driven by mix/throttle, or which is affected positively by the mix.
	 * 3. Low Voltage Cut Off: Sets the measured voltage for when power starts to be limited to protect the cell. Power is lowered by 50% at cut_off + 10%*cell_max. Power is lowered to 20% at cut_off.
	 * 4. Driver Frequency: Sets the peripheral frequency for the motor driver output (timer 2). This affects the efficiency of the driving circuit and changes from motor to motor based on the characteristics of the motor.
	 * 5. Mix Deadband: sets the deadband around 1500 for the mix channel, this is ignored if the mixing input is set to drive motor 1/2
	 * 6. Restart reprogramming
	 *
	 *	reprogramming cycles through each setting and flashes the LED the number of times to represent the setting. The user needs to lower throttle at the setting they want to enter that mode.
	 *	Each subsetting will flash similarly for the user to select the sub-setting. When the programming is complete, the user should maintain zero throttle to exit. Leaving throttle high will cause the
	 *	reprogramming sequence to repeat.
	 *
	 */
	 uint16_t input = 0;
	 
	 flash_led(1,on_time,off_time);
	 input = get_avg_input();
	 if(input < 1500){
		 /*
		  *	Mix Amount/Type:
		  * 1: 0%
		  * 2: 10%
		  * 3: 30%
		  *	4: 50%
		  * 5: 70%
		  * 6: 100%
		  * 7: Mix to Motor
		  *
		  */
		program_mix();
	 }
	 delay_ms(DELAY);
	 flash_led(2,on_time,off_time);
	 measure_input();
	 if(input < 1500){
		/*
		 * Mix Direction:
		 * 0: Normal
		 * 1: Reverse
		 */
		program_mix_dir();
	 }
	 delay_ms(DELAY);
	 flash_led(3,on_time,off_time);
	 input = get_avg_input();
	 if(input < 1500){
		/*
		 * Low Voltage Cutoff
		 * 0: None
		 * 1: 3.3V
		 * 2: 3.1V
		 * 3: 2.9V
		 */
		program_lvco();
	 }
	 delay_ms(DELAY);
	 flash_led(4,on_time,off_time);
	 input = get_avg_input();
	 if(input < 1500){
		 /*
		  * Driver frequency: Frequecny should generally be larger than 5/(2pi(tau)) where tau is the time constant of the motor being driven. But the higher the frequency the more losses from mosfet switching and EMI.
		  * Motor time constant ~ Motor_Inductance/Motor_Resistance
		  * 0: 10kHz
		  * 1: 20kHz
		  * 2: 5kHz
		  */
		program_drive_freq();
	 }
	 delay_ms(DELAY);
	 flash_led(5,on_time,off_time);
	 input = get_avg_input();
	 if(input < 1500){
		 /*
		  * Deadband: Sets the 'neutral' zone for the mix input. Ignored in final mixing mode
		  * 0: 5us
		  * 1: 8us
		  * 2: 10us
		  * 3: 13us
		  */
		program_deadband();
	 }
	 delay_ms(DELAY);
	 flash_led(6,on_time,off_time);
	 input = get_avg_input();
	 if(input < 1500){
		reprogram();
	 }
	return;
}

void program_mix(void){
	flash_led(10,100,100);
	flash_led_alt(1,500,100);
	delay_ms(DELAY);
	flash_led_alt(1,on_time,off_time);
	uint16_t input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 0);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(2,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 10);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(3,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 30);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(4,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 50);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(5,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 70);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(6,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 100);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(7,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_AMOUNT, 200);
		flash_led_alt(10,100,100);
		return;
	}
	return;
}

void program_mix_dir(void){
	flash_led(10,100,100);
	flash_led_alt(2,500,100);
	delay_ms(DELAY);
	flash_led_alt(1,on_time,off_time);
	uint16_t input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_DIR, 0);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(2,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&MIX_DIR, 1);
		flash_led_alt(10,100,100);
		return;
	}
	return;
}

void program_lvco(void){
	flash_led(10,100,100);
	flash_led_alt(3,500,100);
	delay_ms(DELAY);
	flash_led_alt(1,on_time,off_time);
	uint16_t input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&LOW_VOLT_THRESH, 0);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(2,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&LOW_VOLT_THRESH, 1);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(3,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&LOW_VOLT_THRESH, 2);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(4,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&LOW_VOLT_THRESH, 3);
		flash_led_alt(10,100,100);
		return;
	}
	return;
}

void program_drive_freq(void){
	flash_led(10,100,100);
	flash_led_alt(4,500,100);
	delay_ms(DELAY);
	flash_led_alt(1,on_time,off_time);
	uint16_t input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DRIVE_FREQ_H, (1599 >> 8));
		write_to_eeprom(&DRIVE_FREQ_L, (1599 & 0xFF));
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(2,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DRIVE_FREQ_H, (799 >> 8));
		write_to_eeprom(&DRIVE_FREQ_L, (799 & 0xFF));
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(3,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DRIVE_FREQ_H, (3199 >> 8));
		write_to_eeprom(&DRIVE_FREQ_L, (3199 & 0xFF));
		flash_led_alt(10,100,100);
		return;
	}
	return;
}

void program_deadband(void){
	flash_led(10,100,100);
	flash_led_alt(5,500,100);
	delay_ms(DELAY);
	flash_led_alt(1,on_time,off_time);
	uint16_t input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DEAD_BAND, 0);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(2,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DEAD_BAND, 1);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(3,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DEAD_BAND, 2);
		flash_led_alt(10,100,100);
		return;
	}
	delay_ms(DELAY);
	flash_led_alt(4,on_time,off_time);
	input = get_avg_input();
	if(input < 1500){
		write_to_eeprom(&DEAD_BAND, 3);
		flash_led_alt(10,100,100);
		return;
	}
	return;
}

uint16_t get_avg_input(void){
	 uint16_t tmp = 0;
	 
	 measure_input();
	 measure_input();
	 measure_input();
	 measure_input();
	 tmp = get_ch1();
	 delay_ms(100);
	 measure_input();
	 return (tmp+get_ch1())/2;
}

void flash_led(uint8_t number, uint16_t time_on, uint16_t time_off){
	LED_GPIO->ODR = BLUE_LED;
	delay_ms(time_off);
	for(uint8_t i = 0; i < number; i++){
		LED_GPIO->ODR = 0x00;
		delay_ms(time_on);
		LED_GPIO->ODR = BLUE_LED;
		delay_ms(time_off);
	}
}

void flash_led_alt(uint8_t number, uint16_t time_on, uint16_t time_off){
    LED_GREEN_GPIO->ODR = GREEN_LED;
    delay_ms(time_off);
    for(uint8_t i = 0; i < number; i++){
        LED_GREEN_GPIO->ODR = 0x00;
        delay_ms(time_on);
        LED_GREEN_GPIO->ODR = GREEN_LED;
        delay_ms(time_off);
    }
}

void write_to_eeprom(uint8_t *addr, uint8_t val){
	eeprom_unlock();
	*addr = val;
	eeprom_lock();
}