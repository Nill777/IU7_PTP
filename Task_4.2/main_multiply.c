#include <stdio.h>
#include <sys/time.h>
#include <math.h>

#ifndef N
#error
#endif

typedef double matrix_t[N][N];

long long time_now()
{    
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    return current_time.tv_sec * 1000 + current_time.tv_usec / 1000;
}


void init(matrix_t a, size_t asize)
{
    for (size_t i = 0; i < asize; i++)
        for (size_t j = 0; j < asize; j++)
            a[i][j] = sin(i + j + cos(i)); 
}


void multiplication(matrix_t a, matrix_t b, matrix_t c, size_t size)
{
    for (size_t i = 0; i < size; i++)
        for (size_t j = 0; j < size; j++)
        {
            double buf = 0.0;
            for (size_t k = 0; k < size; k++)
                buf += a[i][k] * b[j][k];
            c[i][j] = buf;
        }
}


int main()
{
    long long start, stop;
    matrix_t a, b ,c;

    init(a, N);
    init(b, N);  

    start = time_now();
    multiplication(a, b, c, N);
    stop = time_now();

    printf("%lld\n", stop - start);

    a[0][0] = a[0][1];
    a[0][1] = a[1][1];
    b[0][0] = b[0][1];
    b[0][1] = b[1][1];
    c[0][0] = c[0][1];
    c[0][1] = c[1][1]; 
}
