// Prints the square of a number

#include <stdio.h>

int main(void) {
    int x;
    int y;

    printf("Enter a number: ");
    scanf("%d", &x);

    y = x * x;

    // printing int
    printf("%d", y);
    // printing character
    printf("\n", y);

    return 0;
}