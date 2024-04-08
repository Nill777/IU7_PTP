#include <stdio.h>

struct s_
{
    char ch_var;
    int int_var;
    double double_var;
};

int main(void)
{
    struct s_ a = {3.0, 2, 1};    
    printf("%d\n", sizeof(struct s_));

    return 0;
}
