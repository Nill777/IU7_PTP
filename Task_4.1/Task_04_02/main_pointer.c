#include <stdio.h>
#include <sys/time.h>

long long time_now()
{    
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    return current_time.tv_sec * 1000000 + current_time.tv_usec;
}


void insertion_sort_pointer(int *beg, int *end)
{	
    int *count = beg + 1;
    int *cur;
    int el;

    while (count < end)
    {
        cur = count - 1;
        el = *count;
		while (*cur > el && cur >= beg)
        {
			*(cur + 1) = *cur;
			cur--;
        }
		*(cur + 1) = el;
        count++;
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

    int *beg = a;
    int *end = a + n; 

    input_arr(a, n);

    start = time_now();
    insertion_sort_pointer(beg, end);
    stop = time_now();

    printf("%lld\n", stop - start);
}
