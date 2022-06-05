#include "eeprom.h"

void eeprom_unlock() {
    FLASH->DUKR = FLASH_DUKR_KEY1;
    FLASH->DUKR = FLASH_DUKR_KEY2;
    while (!(FLASH->IAPSR & FLASH_IAPSR_DUL));
}

void option_bytes_unlock() {
    FLASH->CR2 |= FLASH_CR2_OPT;
    FLASH->NCR2 &= ~FLASH_NCR2_NOPT;
}

void eeprom_lock() {
    FLASH->IAPSR &= ~FLASH_IAPSR_DUL;
}

void eeprom_wait_busy() {
    while (!(FLASH->IAPSR & FLASH_IAPSR_EOP));
}
