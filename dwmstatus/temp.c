#include "components.h"

#include <stdio.h>
#include <stdlib.h>

#include "utils.h"


// paths to files with temperature, maximum value of those will be taken, e.g highest across all cores
const char* temp_paths[] = {
  // Package id 0
  "/sys/class/thermal/thermal_zone10/temp",
  // Core 0
  "/sys/class/thermal/thermal_zone4/temp",
  // Core 1
  "/sys/class/thermal/thermal_zone3/temp",
  // Core 2
  "/sys/class/thermal/thermal_zone5/type",
  // Core 3
  "/sys/class/thermal/thermal_zone2/temp",
};

int
get_temp( char* dst, const char* path ) 
{
    FILE *file;

    file = fopen(path, "r");

    if (file == NULL) {
      fprintf(stderr, "File %s is NULL\n", path);
      return 1;
    }

    if (fgets(dst, 5, file) == NULL) {
      fprintf(stderr, "Reading file %s returned NULL\n", path);
      return 1;
    }
    fclose(file);

    return 0;
}


const char*
get_max_temp( void )
{
	float max_temp = 0.0f;
  
  for( int i = 0; i < sizeof( temp_paths )/sizeof( char* ); i++ ) {
    const char* path = temp_paths[i];

    char temp[ 5 ];
    if ( get_temp( temp, path ) ) return "ERR";

	  float ftemp = atof( temp );
    if ( ftemp > max_temp ) max_temp = ftemp;
  }

	return smprintf("%02.0f°C", max_temp / 100);
}
