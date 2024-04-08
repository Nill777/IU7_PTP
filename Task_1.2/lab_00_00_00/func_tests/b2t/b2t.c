#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "constants.h"
#include "struct_t.h"

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


void write_product(FILE *f, product_t product)
{
    fprintf(f, "%s\n", product.name);
    fprintf(f, "%s\n", product.manufacturer);
    fprintf(f, "%" SCNu32, product.price);
    fprintf(f, "\n");
    fprintf(f, "%" SCNu32, product.count);
    fprintf(f, "\n");
}


void write_all(FILE *f_in, FILE *f_out)
{
    product_t tmp_product;
    memset(&tmp_product, 0, sizeof(product_t));
    size_t size = file_size(f_in);

    for (size_t pos = 0; pos < size; pos++)
    {
        get_product_by_pos(f_in, pos, &tmp_product);
        write_product(f_out, tmp_product);
    }
}


int main(int argc, char *argv[])
{
    FILE *f_in;
    FILE *f_out;
        
    if ((argc == 3))
    {
        if ((f_in = fopen(argv[1], "rb")) == NULL)
            return ERROR_INVALID_FILE;
        if (file_size(f_in) == 0)
        {
            fclose(f_in);
            return ERROR_EMPTY_FILE;
        }
        if ((f_out = fopen(argv[2], "w")) == NULL)
        {
            fclose(f_in);
            return ERROR_INVALID_FILE;
        }

        write_all(f_in, f_out);

        fclose(f_in);
        fclose(f_out);

        return EXIT_SUCCESS;
    }
    
    return ERROR_FLAG;
}
