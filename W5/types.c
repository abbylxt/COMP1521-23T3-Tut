#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(void) {
    // // 1234
    // int dec = 1234; // = 1234
    // // hex counting: 0 1 2 ... 9 A B C D E F
    // int hex = 0x1234; // = 4660
    // // oct counting: 0 1 2 ... 8
    // int oct = 01234; // = 668
    // // binary = 0 1
    // int binary = 0b1010; // 10 (not portable) (not recommend to use in your code)

    // 127
    int dec = 127; 
    // hex counting: 0 1 2 ... 9 A B C D E F
    int hex = 0x7F; // 0x70 = 7 * 16^1  = 112
                    // 0x0F = 15 * 16^0 = 15
                    // 
                    // 112 + 15 = 127
    // oct counting: 0 1 2 ... 8
    int oct = 0177; // 0100  = 1 * (8 ^ 2) = 64
                    // 0070  = 7 * (8 ^ 1) = 56
                    // 0007  = 7 * (8 ^ 0) = 7
    int binary = 0b01111111; // 2 (not portable) (do not to use in your code)
                         //        =  1 * 2^5 = 64
                         // 63
                         // 0b1000 =  * 2^3 = 
                         // 0b0100 =  * 2^2 = 
                         // 0b0010 =  * 2^1 = 
                         // 0b0001 =  * 2^0 = 
                         // total =  = 
                         // 0x7 = 7 = 0111
                         // 0xF = 15 = 1111
                         // 0111 1111


    printf("%d\n", dec);
    printf("%d\n", hex);
    printf("%d\n", oct);
    printf("%d\n", binary);
    printf("0x%03X, 0%o\n", hex, oct);
    printf("0x%03x, 0%o\n", hex, oct);


    return EXIT_SUCCESS;
}