#ifndef BATTERY_H
#define BATTERY_H

#include "stm8s.h"
#include <stdint.h>

uint8_t one_hz();

void battery_init();

void tim4_init();

void read_battery_voltage();

uint16_t get_battery_voltage();

void set_lvco(uint8_t val);

uint8_t is_lvco();

void tim4_isr(void) __interrupt(TIM4_ISR);

uint8_t get_tim4_cntr();

uint64_t get_ms();

#endif /* BATTERY_H */