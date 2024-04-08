#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "constants.h"
#include "struct_t.h"
#include "func.h"
#include "add_entry.h"
#include "sort.h"
#include "print_substr.h"

int main(int argc, char *argv[])
{
    FILE *f;
    FILE *f_in;
    FILE *f_out;
    int rc;

    if (argc != 3 && argc != 4)
        return ERROR_COUNT_ARGS;
        
    if ((argc == 4) && (strncmp(argv[1], "sb", 2) == 0))
    {
        if ((f_in = fopen(argv[2], "rb")) == NULL)
        {
            printf("Некорректный исходный файл\n");
            return ERROR_INVALID_FILE;
        }
        if (file_size(f_in) == 0)
        {
            printf("Пустой исходный файл\n");
            fclose(f_in);
            return ERROR_EMPTY_FILE;
        }

        if ((f_out = fopen(argv[3], "wb+")) == NULL)
        {
            printf("Некорректный выходной файл\n");
            fclose(f_in);
            return ERROR_INVALID_FILE;
        }

        fcpy(f_in, f_out);
        sort(f_out);

        fclose(f_in);
        fclose(f_out);

        return EXIT_SUCCESS;
    }
    else if ((argc == 4) && (strncmp(argv[1], "fb", 2) == 0))
    {
        if ((f = fopen(argv[2], "rb")) == NULL)
        {
            printf("Некорректный исходный файл\n");
            return ERROR_INVALID_FILE;
        }
        if (file_size(f) == 0)
        {
            printf("Пустой исходный файл\n");
            fclose(f);
            return ERROR_EMPTY_FILE;
        }
        if ((rc = print_found_prod(f, argv[3])) != EXIT_SUCCESS)
            return rc;

        fclose(f);

        return EXIT_SUCCESS;
    }
    else if ((argc == 3) && ((strncmp(argv[1], "ab", 2) == 0)))
    {
        product_t product;
        memset(&product, 0, sizeof(product_t));
        if ((f = fopen(argv[2], "rb+")) == NULL)
        {
            printf("Некорректный исходный файл\n");
            return ERROR_INVALID_FILE;
        }

        if ((rc = entry_product(&product)) != EXIT_SUCCESS)
            return rc;

        add_entry(f, product);

        fclose(f);

        return EXIT_SUCCESS;
    }
    
    return ERROR_FLAG;
}
