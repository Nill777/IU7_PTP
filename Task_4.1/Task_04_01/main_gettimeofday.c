#include <stdio.h>
#include <sys/time.h>
#include <time.h>

int main()
{
    int n;
    scanf("%d", &n);

    struct timespec tw = {n / 1000, n % 1000 * 1000000};
    struct timespec tr;
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    long long start = current_time.tv_sec * 1000 + current_time.tv_usec / 1000;
    nanosleep (&tw, &tr);
    gettimeofday(&current_time, NULL);
    long long stop = current_time.tv_sec * 1000 + current_time.tv_usec / 1000;

    printf("%lld\n", stop - start);

    return 0;
}