#include <stdio.h>
#include <assert.h>
#include "makeNBOC.c"

int main() {
    uint32_t num = 0x12345678;
    uint32_t nbo_num = make_nbo(num);

    printf("Original number: 0x%x\n", num);
    printf("Network Byte Order: 0x%x\n", nbo_num);

    // Test cases using assert
    assert(make_nbo(0x12345678) == htonl(0x12345678));
    assert(make_nbo(0x87654321) == htonl(0x87654321));

    printf("All tests passed!\n");

    return 0;
}