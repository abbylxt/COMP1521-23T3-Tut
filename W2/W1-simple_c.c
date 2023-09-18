// Prints the square of a number

#include <stdio.h>

int main(void) {
    int x;
    int y;

    printf("Enter a number: ");
    scanf("%d", &x);

    y = x * x;

    // printf("%d\n", y);
    printf("%d", y);
    printf("\n");

    return 0;
}