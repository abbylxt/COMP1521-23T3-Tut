// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void) {
    printf("Enter a number: ");

    int x, y;
    scanf("%d", &x);

    if_condi:
    if (x <= SQUARE_MAX) goto else_square;

    printf("square too big for 32 bits\n");

    goto else_end;

    else_square:
    y = x * x;
    printf("%d\n", y);

    else_end:

    return 0;
}