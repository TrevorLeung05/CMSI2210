#include <stdio.h>
#include <stdint.h>
#include <arpa/inet.h>

// Function to determine if the system is little-endian or big-endian
int is_little_endian() {
    uint32_t x = 1;
    return *((uint8_t*)&x);
}

// Function to convert a number to Network Byte Order if necessary
uint32_t make_nbo(uint32_t num) {
    if (is_little_endian()) {
        return htonl(num);
    }
    return num;
}