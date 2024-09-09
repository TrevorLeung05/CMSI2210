#include <stdio.h>

int main( int argc, char * argv[] ) {
    char name[50];  

    printf("Please enter your name: "); 
    fgets(name, sizeof(name), stdin);  
    printf("\n\n   Hello, %s\n\n", name); 

    return 0; 
}