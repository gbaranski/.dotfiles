#include "components.h"
#include "utils.h"

const uint32_t
get_used_ram_mb( void )
{
  uintmax_t total, free, buffers, cached, avail;
  if (pscanf("/proc/meminfo",
             "MemTotal: %ju kB\n"
             "MemFree: %ju kB\n"
             "MemAvailable: %ju kB\n"
             "Buffers: %ju kB\n"
             "Cached: %ju kB\n",
             &total, &free, &avail, &buffers, &cached) != 5) { return 0; }

  return (total - free - buffers - cached) / 1024;
}

