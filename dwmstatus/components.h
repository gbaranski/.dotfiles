#pragma once

#include "stdint.h"

int
get_temp( char* dst, const char* path );

const char*
get_max_temp( void );

const uint32_t
get_used_ram_mb(void);


int
get_time( char* dst );

const uint32_t
get_used_ram_mb( void );

const uint8_t
get_battery_level( void );


const char*
get_battery_state( void );

int
get_network_status( char* dst, int skfd );
