#include "components.h"
#include "utils.h"

#include <stdio.h>
#include <string.h>

#include <limits.h>
#include <stdint.h>
#include <unistd.h>

#define BAT_PATH "/sys/class/power_supply/BAT0"

const uint8_t
get_battery_level( void ) 
{
    const char* path = BAT_PATH "/capacity";

    FILE *file;

    file = fopen(path, "r");

    if (file == NULL) {
      fprintf(stderr, "File %s is NULL\n", path);
      return 1;
    }

    char buf[4];
    if (fgets(buf, sizeof(buf), file) == NULL) {
      fprintf(stderr, "Reading file %s returned NULL\n", path);
      return 1;
    }
    fclose(file);
    return atoi(buf);
}


const char*
get_battery_state( void ) 
{
    const char* path = BAT_PATH "/status";

    FILE *file;

    file = fopen(path, "r");

    if (file == NULL) {
      fprintf(stderr, "File %s is NULL\n", path);
      return "ERR_BAT";
    }

    char buf[40];
    if (fgets(buf, sizeof(buf), file) == NULL) {
      fprintf(stderr, "Reading file %s returned NULL\n", path);
      return "ERR_BAT";
    }
    fclose(file);

    buf[strcspn(buf, "\n")] = '\0';

    if      ( strcmp( buf, "Full" )        == 0 ) return "FULL";
    else if ( strcmp( buf, "Charging" )    == 0 ) return "CHR";
    else if ( strcmp( buf, "Discharging" ) == 0 ) return "BAT";
    else                                          return "UNK";
}
