#include <stdlib.h>
#include <string.h>
#include "add_entry.h"

int entry_product(product_t *product)
{
    int rc;
    rc = scanf("%s", product->name);
    rc += scanf("%s", product->manufacturer);
    rc += scanf("%" SCNu32, &(product->price));
    rc += scanf("%" SCNu32, &(product->count));

    if (rc != 4)
        return ERROR_ENTRY_PRODUCT;
    else
        return EXIT_SUCCESS;
}


void add_entry(FILE *f, product_t product)
{
    size_t pos = 0;
    product_t tmp_product;
    memset(&tmp_product, 0, sizeof(product_t));
    size_t size = file_size(f);
    int flag = 1;

    for (; (pos < size) && flag; pos++)
    {
        get_product_by_pos(f, pos, &tmp_product);
        if ((product.price > tmp_product.price) || \
            ((product.price == tmp_product.price) && (product.count > tmp_product.count)))
            flag = 0;
    }
    if (! flag)
        pos--;

    for (int i = size - 1; i >= (int)pos; i--)
    {
        get_product_by_pos(f, i, &tmp_product);
        put_product_by_pos(f, i + 1, tmp_product);
    }

    put_product_by_pos(f, pos, product);
}
