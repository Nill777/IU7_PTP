#include <stdio.h>
#include <time.h>

int main()
{
    int n;
    scanf("%d", &n);

    struct timespec tw = {n / 1000, n % 1000 * 1000000};
    struct timespec tr;

    //Структуры для сохранения определенного времени
    struct timespec mt1, mt2;  

    clock_gettime (CLOCK_REALTIME, &mt1);
    nanosleep (&tw, &tr);
    clock_gettime (CLOCK_REALTIME, &mt2);

    printf("%ld\n", (mt2.tv_sec - mt1.tv_sec) * 1000 + (mt2.tv_nsec - mt1.tv_nsec) / 1000000);
    return 0;
}