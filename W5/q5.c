#include <stdio.h>
#include <stdint.h>

// Printer flags as #defines
// Whether the printer is out of ink
#define NO_INK (0x1)       // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2)       // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4) // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8)  // 0b 0000 1000
// Start print/scan
#define START (0x10)       // 0b 0001 0000

// The printer
uint8_t printerControl = 0; // 0b 0000 0000

void checkInk(void);               // Question A
void replaceInk(void);             // Question B
void useColourAndSelectScan(void); // Question C
void toggleMode(void);             // Question D
void start(void);                  // Question E