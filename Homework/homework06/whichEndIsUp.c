#include <stdio.h>

void checkEndianess() {
    unsigned int x = 1;
    char *c = (char*)&x;

    if (*c) {
        printf("This system is Little-Endian.\n");
    } else {
        printf("This system is Big-Endian.\n");
    }
}

int main() {
    printf("Checking the Endianness of your system...\n");
    checkEndianess();
    return 0;
}

