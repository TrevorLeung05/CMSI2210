#include <stdio.h>
#include <stdlib.h>
// I added this to prevent the compiler warning
#include <ctype.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    //Open the file
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    int word_count = 0;
    int in_word = 0;
    int ch;

    //Read through the file, checking character by character
    while ((ch = fgetc(file)) != EOF) {
        //Check to see if the current character is a whitespace character
        if (isspace(ch)) {
            if (in_word) {
                //End of a word
                in_word = 0;
            }
        } else {
            if (!in_word) {
                //Start of a new word
                word_count++;
                in_word = 1;
            }
        }
    }

    //Close the file
    fclose(file);

    //Outputs the word count
    printf("Word Count: %d\n", word_count);

    return 0;
}
