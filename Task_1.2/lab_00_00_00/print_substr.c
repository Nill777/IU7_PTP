#include <string.h>
#include <stdlib.h>
#include "print_substr.h"

void print_product(product_t product)
{
    fprintf(stdout, "%s\n", product.name);
    fprintf(stdout, "%s\n", product.manufacturer);
    fprintf(stdout, "%" SCNu32, product.price);
    fprintf(stdout, "\n");
    fprintf(stdout, "%" SCNu32, product.count);
    fprintf(stdout, "\n");
}


int check_substr(char *name, char *substr)
{
    int len_substr = strlen(substr);
    int len_name = strlen(name);
    char tmp_name[MAX_LEN_NAME];

    strcpy(tmp_name, name + (len_name - len_substr));

    if (strncmp(tmp_name, substr, len_substr) != 0)
        return EXIT_FAILURE;
    else
        return EXIT_SUCCESS;
}


int print_found_prod(FILE *f, char *substr)
{
    int count = 0;
    product_t tmp_product;
    memset(&tmp_product, 0, sizeof(product_t));

    fseek(f, 0, SEEK_END);
    size_t size = ftell(f) / sizeof(product_t);
    fseek(f, 0, SEEK_SET);

    for (size_t pos = 0; pos < size; pos++)
    {
        get_product_by_pos(f, pos, &tmp_product);

        if (! check_substr(tmp_product.name, substr))
        {
            count++;
            print_product(tmp_product);
        }
    }
    if (count == 0)
        return ERROR_NOTHING_FOUND;
    else
        return EXIT_SUCCESS;
}
