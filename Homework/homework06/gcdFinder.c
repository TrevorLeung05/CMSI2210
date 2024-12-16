#include <stdio.h>
#include <assert.h>

// Declaration of the assembly function
extern long find_gcd(long num1, long num2);

int main() {
    long num1 = 3113041662;
    long num2 = 11570925;
    long gcd = find_gcd(num1, num2);

    printf("The GCD of %ld and %ld is %ld\n", num1, num2, gcd);

    // Test cases using assert
//    assert(find_gcd(3113041662, 11570925) == 1);
    assert(find_gcd(3113041662, 11570925) == 462837);
    assert(find_gcd(48, 18) == 6);
    assert(find_gcd(56, 98) == 14);
    assert(find_gcd(101, 103) == 1);

    printf("All tests passed!\n");

    return 0;
}
