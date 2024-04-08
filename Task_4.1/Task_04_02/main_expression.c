#include <stdio.h>
#include <sys/time.h>

long long time_now()
{    
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    return current_time.tv_sec * 1000000 + current_time.tv_usec;
}


void insertion_sort_expression(int a[], size_t alen)
{	
    int j;
    int el;

    for (size_t i = 1; i < alen; i++)
    {
		j = i - 1;
		el = *(a + i);
		while (*(a + j) > el && j >= 0)
        {
			*(a + j + 1) = *(a + j);
			j--;
        }
		*(a + j + 1) = el;
    }
}


void input_arr(int a[], size_t alen)
{
    size_t count = 0;
    while (count < alen && scanf("%d", &a[count]) == 1)
        count++;
}


int main()
{
    long long start, stop;
    size_t n;
    scanf("%zu", &n);
    int a[n];

    input_arr(a, n);

    start = time_now();
    insertion_sort_expression(a, n);
    stop = time_now();

    printf("%lld\n", stop - start);
}
