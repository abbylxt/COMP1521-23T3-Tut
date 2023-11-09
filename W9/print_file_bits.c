// read 32-byte hexadecimal numbers from a file
// and print low (least significant) byte
// as a signed decimal number (-128..127)

#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        return 1;
    }


    FILE *stream = fopen(argv[1], "r");
    if (stream == NULL) {
        perror(argv[1]);
        return 1;
    }

    int32_t number;
    while (fscanf(stream, "%x", &number) == 1) { 

        // convert low byte to a signed number
        int32_t low_byte = number & 0xff; // mask is 0b1111 1111
        
        // Check if the leftmost bit 
        // (the one that represents sign) is 1 or 0. 
        // If statement will execute if result is 0b1000 0000, ie. not 0. 
        if (low_byte & (1 << 7)) {
            // Adds 3 bytes (24 bits) of 1s in front of the low byte
            // to SIGN EXTEND 8 bit Twos Complement to 32 bit Twos Complement, 
            // because it needs signed number representation!
            low_byte = 0xffffff00 | low_byte;
        } 

        // EXAMPLE
        // Lowest byte: 1010 0000 (if signed, the leftmost bit is 1 so it is negative).
        // Extended to 32 bit signed twos complement: 1111 1111 1111 1111 1111 1111 1010 0000
        // However, if 1010 0000 was unsigned 
        // Extended to unsigned 32 bit number:        0000 0000 0000 0000 0000 0000 1010 0000 
        // These are similar! Just flipped.

        printf("%d\n", low_byte);
    }
    fclose(stream);

    return 0;
}