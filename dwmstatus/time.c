#include "components.h"

#include <stdio.h>
#include <time.h>

int
get_time( char* dst ) 
{
	time_t rawtime = time( NULL );

  if ( rawtime == -1 ) {
    fprintf( stderr, "The time() function failed" );
    return 1;
  }

	struct tm *ptm = localtime(&rawtime);

  if ( ptm == NULL ) {
    fprintf( stderr, "The localtime() function failed" );
    return 1;
  }

  strftime( dst, 256, "%a %d %b %H:%M:%S", ptm );

  return 0;
}
