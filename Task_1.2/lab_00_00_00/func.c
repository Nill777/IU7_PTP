#include "func.h"

size_t file_size(FILE *f)
{
    fseek(f, 0, SEEK_END);
    size_t size = ftell(f) / sizeof(product_t);
    fseek(f, 0, SEEK_SET);
    return size;
}


void get_product_by_pos(FILE *f, size_t pos, product_t *product)
{
    fseek(f, pos * sizeof(product_t), SEEK_SET);
    fread(product, sizeof(product_t), 1, f);
}


void put_product_by_pos(FILE *f, size_t pos, product_t product)
{
    fseek(f, pos * sizeof(product_t), SEEK_SET);
    fwrite(&product, sizeof(product_t), 1, f);
}
