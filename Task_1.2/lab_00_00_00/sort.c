#include <stdlib.h>
#include <string.h>
#include "sort.h"

void fcpy(FILE *f_in, FILE *f_out)
{
    size_t size = file_size(f_in);
    product_t tmp_product;

    for (size_t i = 0; i < size; i++)
    {
        get_product_by_pos(f_in, i, &tmp_product);
        put_product_by_pos(f_out, i, tmp_product);
    }
}

void sort(FILE *f)
{
    product_t el_i, el_j, tmp;
    memset(&el_i, 0, sizeof(product_t));
    memset(&el_j, 0, sizeof(product_t));
    memset(&tmp, 0, sizeof(product_t));
    size_t size = file_size(f);

    int j;
    for (size_t i = 1; i < size; i++)
    {
        j = i - 1;
        get_product_by_pos(f, i, &el_i);
        get_product_by_pos(f, j, &el_j);
        while (((el_j.price < el_i.price) || ((el_j.price == el_i.price) && \
            (el_j.count < el_i.count))) && j >= 0)
        {
            get_product_by_pos(f, j, &tmp);
            put_product_by_pos(f, j + 1, tmp);
            j--;
            get_product_by_pos(f, j, &el_j);
        }
        put_product_by_pos(f, j + 1, el_i);
    }
}
