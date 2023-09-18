// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    int x = 24;

    // while (x < 42) {
    //     printf("%d\n", x);
    //     x += 3;
    // }

    while_condition:
    if (x >= 42) goto end;
    printf("%d\n", x);
    x += 3;
    goto while_condition:

    end:

    return 0;
}