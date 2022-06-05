#define STM8S003 (1)
#include "boardConfig.h"
#include "stm8s.h"
#include "IOManager/delay.h"
#include "InitManager/init.h"
#include "IOManager/pwm.h"
#include "IOManager/battery.h"


int main(){
	init();
	while(1){
		measure_input();
		mix_channels();
		write_motors();
		read_battery_voltage();
		if(is_lvco()){
		    LED_GREEN_GPIO->ODR = 0x00;
		}
		else{
		    LED_GREEN_GPIO->ODR = GREEN_LED;
		}
	}
	return 1;
}