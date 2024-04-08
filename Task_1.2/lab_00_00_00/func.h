#ifndef FUNC_H
#define FUNC_H

#include <stdio.h>
#include "struct_t.h"

size_t file_size(FILE *f);
void get_product_by_pos(FILE *f, size_t pos, product_t *product);
void put_product_by_pos(FILE *f, size_t pos, product_t product);

#endif
