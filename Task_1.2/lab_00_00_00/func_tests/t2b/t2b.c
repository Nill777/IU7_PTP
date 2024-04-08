#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "constants.h"
#include "struct_t.h"

size_t file_size(FILE *f)
{
    fseek(f, 0, SEEK_END);
    size_t size = ftell(f);
    fseek(f, 0, SEEK_SET);
    return size;
}


void put_product_by_pos(FILE *f, size_t pos, product_t product)
{
    fseek(f, pos * sizeof(product_t), SEEK_SET);
    fwrite(&product, sizeof(product_t), 1, f);
}


int read_product(FILE *f, product_t *product)
{
    int rc;
    rc = fscanf(f, "%s", product->name);
    rc += fscanf(f, "%s", product->manufacturer);
    rc += fscanf(f, "%" SCNu32, &product->price);
    rc += fscanf(f, "%" SCNu32, &product->count);

    if (rc != 4)
        return ERROR_ENTRY_PRODUCT;
    else
        return EXIT_SUCCESS;
}


void write_all(FILE *f_in, FILE *f_out)
{
    size_t size;
    size_t lines_count = 0;
    product_t tmp_product;
    memset(&tmp_product, 0, sizeof(product_t));

    while (! feof(f_in))
        if (fgetc(f_in) == '\n')
            lines_count++;
    lines_count++;

    size = lines_count / 4;
    fseek(f_in, 0, SEEK_SET);

    for (size_t pos = 0; pos < size; pos++)
    {
        read_product(f_in, &tmp_product);
        put_product_by_pos(f_out, pos, tmp_product);
    }
}


int main(int argc, char *argv[])
{
    FILE *f_in;
    FILE *f_out;
        
    if ((argc == 3))
    {
        if ((f_in = fopen(argv[1], "r")) == NULL)
            return ERROR_INVALID_FILE;
        if (file_size(f_in) == 0)
        {
            fclose(f_in);
            return ERROR_EMPTY_FILE;
        }
        if ((f_out = fopen(argv[2], "wb")) == NULL)
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
