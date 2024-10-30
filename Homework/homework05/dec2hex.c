#include <stdio.h>
#include <stdlib.h>

void dec2hex(unsigned long long num, int digits) {
    if (digits != 8 && digits != 16) {
        digits = 8;
    }
    if (digits == 8) {
        printf("0x%08X\n", (unsigned int)num);
    } else {
        printf("0x%016llX\n", num);
    }
}

int main() {
    unsigned long long num;
    int digits = 8;
    char input[50];

    printf("Enter a base-10 number (optionally followed by 8 or 16): ");
    fgets(input, sizeof(input), stdin);

    if (sscanf(input, "%llu %d", &num, &digits) == 1) {
        digits = 8;
    }

    dec2hex(num, digits);

    return 0;
}