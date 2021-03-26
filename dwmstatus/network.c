#include "components.h"

#include <net/if.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <linux/types.h>
#include <stdlib.h>
#include <errno.h>

#include "wireless.h"

#define INTERFACE_NAME "wlan0"
#define NETWORK_PATH "/sys/class/net/wlan0"

static const bool
get_network_interface_state( void ) 
{
    const char* path = NETWORK_PATH "/operstate";

    FILE *file;

    file = fopen(path, "r");

    if (file == NULL) {
      fprintf(stderr, "File %s is NULL\n", path);
      return false;
    }

    char buf[4 + 1];
    if ( fgets( buf, sizeof( buf ), file ) == NULL ) {
      fprintf( stderr, "Reading file %s returned NULL\n", path );
      return false;
    }
    fclose( file );

    buf[strcspn(buf, "\n")] = '\0';

    return strcmp( buf, "up" ) == 0;
}



int
get_network_essid( char* dst, int skfd ) 
{
  struct iwreq wrq;

  strncpy( wrq.ifr_name, INTERFACE_NAME, sizeof(INTERFACE_NAME)/sizeof(char) );
  wrq.u.essid.pointer = (caddr_t) dst;
  wrq.u.essid.length = IW_ESSID_MAX_SIZE + 1;
  wrq.u.essid.flags = 0;

  return ioctl( skfd, SIOCGIWESSID, &wrq );
}

int
get_network_status( char* dst, int skfd ) 
{
  const bool is_up = get_network_interface_state();

  char essid[ IW_ESSID_MAX_SIZE ];
  memset( essid, 0, sizeof( essid ) );
  if ( get_network_essid( essid, skfd ) ) return 1;

  if (!is_up) {
    dst = "Offline";
    return 0;
  }

  sprintf( dst, "%s", essid );

  return 0;
}
