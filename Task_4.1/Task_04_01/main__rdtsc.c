#include <stdio.h>
#include <time.h>
#include <x86intrin.h>

int main()
{
    int n;
    scanf("%d", &n);

    struct timespec tw = {n / 1000, n % 1000 * 1000000};
    struct timespec tr;

    long long start, stop;

    start = __rdtsc();
    nanosleep(&tw, &tr);
    stop = __rdtsc();

    printf("%lld\n", (stop - start) / 1000000);

    return 0;
}
