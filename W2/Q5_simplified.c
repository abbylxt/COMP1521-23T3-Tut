// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void) {
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= SQUARE_MAX) goto else1;
    printf("square too big for 32 bits\n");

    goto end;
    else1:
    y = x * x;

    // printing int
    printf("%d", y);
    // printing character
    printf("\n", y);

    end: 

    return 0;
}