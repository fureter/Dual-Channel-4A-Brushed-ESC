/*
 *	File used to define channel mapping and board level mapping
 *
 */
#ifndef BOARDCONFIG_H
#define BOARDCONFIG_H
 
#include <stdint.h>
#include "stm8s.h"

#define BLUE_LED					((uint8_t)0x10)
#define LED_GPIO					GPIOB

#define GREEN_LED					((uint8_t)0x10)
#define LED_GREEN_GPIO				GPIOD

#define CH1_PIN 					((uint8_t)0x40)
#define CH2_PIN						((uint8_t)0x80)

#define DEFAULT_MIX					((uint8_t) 30)
#define DEFAULT_MIX_DIR				((uint8_t) 0)
#define DEFAULT_LVCO				((uint8_t) 0)
#define DEFAULT_FREQ_H				((uint8_t) (1599 >> 8))
#define DEFAULT_FREQ_L				((uint8_t) (1599 & 0xFF))
#define DEFAULT_DEADBAND			((uint8_t) 8)

#endif /* BOARDCONFIG_H */