#include <stdio.h>
#include <stdlib.h>

#define HANDLER_OWERFLOW 100 
#define ERROR_INPUT_ARR 1
#define N 10
typedef int arr_t[N];


int input_arr(int *a, size_t *n)
{
    int count = 0;
    int tmp;

    while ((count < N) && (scanf("%d", &a[*n]) == 1))
    {
        *n = (*n) + 1;
        count = count + 1;
    }
    if ((count == N) && (scanf("%d", &tmp) == 1))
        return HANDLER_OWERFLOW;
    //Пустой массив
    if (*n == 0)
        return ERROR_INPUT_ARR;
        
    return EXIT_SUCCESS;
}


int bubble_sort(int *a, size_t n)
{
    for (size_t i = 0; i < n - 1; i++)
    {
        for (size_t j = 0; j < n - i - 1; j++)
        {  
            if (a[j] > a[j + 1])
            {            
                int tmp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = tmp; 
            }
        }
    }
    return 0;
}


void print_arr(int *dst, size_t dlen)
{
    for (size_t i = 0; i < dlen; i++)
        printf("%d ", dst[i]);
}


double global_var_init = 10;
double global_var;

int main(void)
{
    arr_t a;
    size_t n = 0;
    double local_var_init = 0;
    double local_var;

    printf("Введите элементы массива: ");

    int code_rn = input_arr(a, &n);

    if (code_rn == ERROR_INPUT_ARR)
    {
        printf("Некорректный ввод массива\n");
        return ERROR_INPUT_ARR;
    }

    bubble_sort(a, n);

    printf("Массив упорядоченных элементов: ");
    print_arr(a, n);
    printf("\n");
        
    return code_rn;
}
