#include <stdio.h>
#include <stdlib.h>

void printTable(int N) {
    printf("     |");
    for (int i = 1; i <= N; i++) {
        printf("%5d", i);
    }
    printf("\n");

    printf("-----");
    for (int i = 1; i <= N; i++) {
        printf("-----");
    }
    printf("\n");

    for (int i = 1; i <= 10; i++) {
        printf("%5d|", i);
        for (int j = 1; j <= N; j++) {
            printf("%5d", i * j);
        }
        printf("\n");

    }
}

int main(int argc, char *argv[]) {
    int N = atoi(argv[1]);
    printTable(N);
    return 0;
}