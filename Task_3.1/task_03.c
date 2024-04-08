#include <stdio.h>

int div(int a, int b);

int main(void)
{
    int a = 5, b = 2;

    printf("%d div %d = %d\n", a, b, div(a, b));

    a = 10;
    b = 0;

    printf("%d div %d = %d\n", a, b, div(a, b));

    return 0;
}

int div(int a, int b)
{
    if (b == 0)
        return 1;
        
    return a / b;
}
