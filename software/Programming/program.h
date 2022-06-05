#include <stdint.h>

#ifndef PROGRAM_H
#define PROGRAM_H

void reprogram(void);

void program_mix(void);

void program_mix_dir(void);

void program_lvco(void);

void program_drive_freq(void);

void program_deadband(void);

void flash_led(uint8_t number, uint16_t time_on, uint16_t time_off);

void flash_led_alt(uint8_t number, uint16_t time_on, uint16_t time_off);

uint16_t get_avg_input(void);

void write_to_eeprom(volatile uint8_t * addr, uint8_t val);

#endif /* PROGRAM_H */