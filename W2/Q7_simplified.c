// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    // int x = 24;

    // while (x < 42) {
    //     printf("%d\n", x);
    //     x += 3;
    // }

    int x = 24;

loop:
    if (x >= 42) goto loop_end;
    
    printf("%d\n", x);
    x = x + 3;

    goto loop;

loop_end:


    return 0;
}