#ifndef INIT_H
#define INIT_H

void init_gpio();

void init_sys_clk();

void init();

void start_up_sequence();

void load_settings_from_eeprom();

#endif /* INIT_H */