#include <stdio.h>

void dec2bin(unsigned int num) {
   
    char binary[33] = {0};
    int index = 31; 

 
    while (index >= 0) {
        binary[index] = (num % 2) ? '1' : '0';
        num /= 2;
        index--;
    }
    printf("32-bit Binary: %s\n", binary);
}

int main() {
    unsigned int num;
    printf("Enter a base-10 number: ");
    scanf("%u", &num);
    dec2bin(num);

    return 0;
}