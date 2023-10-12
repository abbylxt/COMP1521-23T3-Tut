#include <stdio.h>
#include <stdint.h>
typedef unsigned int Word;

Word reverseBits(Word w) {
    Word result = 0;
    for (int bit = 0; bit < 32; bit++) {
        Word mask = 1;
        uint32_t curr_bit = mask & w;
        result = result | (curr_bit << (31 - bit));
        result |= (curr_bit << (31 - bit));
        w = w >> 1;
    }
    return result;
}
// 0000 0000 1001 0001 1010 0010 1011 0011
// 0000 0000 0000 0000 0000 0000 0000 0001
// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0 = 0000 => 0000 = 0
    // 1 = 0001 => 1000 = 8
    // 2 = 0010 => 0100 = 4
    // 3 = 0011 => 1100 = C
    // 4 = 0100 => 0010 = 2
    // 5 = 0101 => 1010 = A
    // 6 = 0110 => 0110 = 6
    // 7 = 0111 => 1110 = E
    // assert(reverseBits(w1) == 0xE6A2C480);
    printf("0x%X\n", reverseBits(w1));
    // puts("All tests passed!");
    return 0;
}