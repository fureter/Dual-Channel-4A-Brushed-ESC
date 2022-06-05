#ifndef PWM_H
#define PWM_H

#include "stm8s.h"
#include <stdint.h>

void reset_timer1();

void reset_timer2();

void PWM_input_init();

void PWM_output_init();

void timer1_init();

void timer2_init();

uint16_t get_ch1();

uint16_t get_ch2();

void write_motors();

void mix_channels();

void measure_input();

uint16_t get_tim1_cntr();

uint16_t get_tim1_ccr1();

uint16_t get_tim1_ccr2();

uint16_t get_tim1_ccr3();

uint16_t get_tim1_ccr4();

void PWM_set(uint16_t data1, uint16_t data2);

void pwm_isr(void) __interrupt(TIM1_CC_ISR);

void set_max_input(uint16_t throttle);

void set_mix_amount(uint8_t val);

void set_mix_dir(uint8_t val);

void set_freq(uint8_t val_h, uint8_t val_l);

void set_dead_band(uint8_t val);

void shift_CH1_last(uint16_t new_val);

void shift_CH2_last(uint16_t new_val);

#endif /* PWM_H */

