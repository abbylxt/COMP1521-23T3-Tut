// Prints the square of a number

#include <stdio.h>

int main(void) {
    printf("Enter a number: ");

    int x;
    scanf("%d", &x);

    int y = x * x;

    printf("%d", y);
    printf("\n");

    return 0;
}