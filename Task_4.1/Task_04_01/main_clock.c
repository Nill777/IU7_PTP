#include <sys/time.h>
#include <time.h>
#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);

    struct timespec tw = {n / 1000, n % 1000 * 1000000};
    struct timespec tr;

    clock_t start = clock();
    nanosleep (&tw, &tr);
    clock_t stop = clock();

    printf("%ld\n", stop - start / 1000000000);

    return 0;
}
