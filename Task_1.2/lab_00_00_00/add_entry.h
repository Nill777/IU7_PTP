#ifndef ADD_ENTRY_H
#define ADD_ENTRY_H

#include <stdio.h>
#include "constants.h"
#include "struct_t.h"
#include "func.h"

int entry_product(product_t *product);
void add_entry(FILE *f, product_t product);

#endif
