#include <stdio.h>

int main(void)
{
    int el = 1;
    int a[2][3][4]; 
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 3; j++)
            for (int k = 0; k < 4; k++)
            {
                a[i][j][k] = el;
                el++;
            }

    return 0;
}
