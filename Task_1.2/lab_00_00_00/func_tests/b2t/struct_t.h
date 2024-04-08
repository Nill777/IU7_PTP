#ifndef STRUCT_H
#define STRUCT_H

#include <inttypes.h>
#include "constants.h"

typedef struct
{
    char name[MAX_LEN_NAME];
    char manufacturer[MAX_LEN_MANUFACTURER];
    uint32_t price;
    uint32_t count;
} product_t;

#endif
