#ifndef PRINT_SUBSTR_H
#define PRINT_SUBSTR_H

#include <stdio.h>
#include "constants.h"
#include "func.h"

void print_product(product_t product);
int check_substr(char *name, char *substr);
int print_found_prod(FILE *f, char *substr);

#endif
