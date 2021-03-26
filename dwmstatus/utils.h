#pragma once

#include <stdlib.h>

#define LEN(x) (sizeof (x) / sizeof *(x))

char *
smprintf(char *fmt, ...);

int
pscanf(const char *path, const char *fmt, ...);
