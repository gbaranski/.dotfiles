#include <unistd.h>
#include <stdio.h>
#include <X11/Xlib.h>
#include <sys/socket.h>
#include <string.h>

#include "utils.h"
#include "components.h"

void
setstatus(char *str, Display *dpy)
{
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

int
iw_sockets_open(void)
{
  static const int families[] = {
    AF_INET, AF_IPX, AF_AX25, AF_APPLETALK
  };
  unsigned int	i;
  int		sock;

  /*
   * Now pick any (exisiting) useful socket family for generic queries
   * Note : don't open all the socket, only returns when one matches,
   * all protocols might not be valid.
   * Workaround by Jim Kaba <jkaba@sarnoff.com>
   * Note : in 99% of the case, we will just open the inet_sock.
   * The remaining 1% case are not fully correct...
   */

  /* Try all families we support */
  for(i = 0; i < sizeof(families)/sizeof(int); ++i)
    {
      /* Try to open the socket, if success returns it */
      sock = socket(families[i], SOCK_DGRAM, 0);
      if(sock >= 0)
	return sock;
  }

  return -1;
}

int
main(void)
{
  Display *dpy = XOpenDisplay(NULL);

	if (dpy == NULL) {
		fprintf(stderr, "dwmstatus: cannot open display.\n");
		return 1;
	}

  int skfd;
  if (( skfd = iw_sockets_open() ) < 0) {
    fprintf(stderr, "fail opening socket");
  }

	for (;;sleep(1)) {

    char time[256];
    get_time(time);

    const char* tmax = get_max_temp();
    const uint32_t ram_used = get_used_ram_mb();
    const uint8_t battery_level = get_battery_level();
    const char* battery_state = get_battery_state();
    char network_status[200];
    if ( get_network_status( network_status, skfd ) ) strcpy( network_status, "ERR_NET" );

		char* status = smprintf("Tmax:%s | W: %s | %s %u% | %zuMB | %s",
				tmax, 
        network_status,
        battery_state,
        battery_level,
        ram_used,
				time
        );

		setstatus(status, dpy);
	}
  close(skfd);
	XCloseDisplay(dpy);

	return 0;
}

