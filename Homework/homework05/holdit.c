#include <stdio.h>
#include <conio.h>
#include <time.h>

int main(){

    printf("This program will time how long you can hold your breath. Take a deep breath, then press the 'Enter' key. When you absolutely have to exhale, press the enter key again. The duration will be displayed in minutes and seconds.");
    getchar();
    int startTime = time(NULL);

    getchar();
    int endTime = time(NULL);
    
    int timeHeld = (endTime - startTime);


    int minutes = 0;
    int seconds = 0;
    if (timeHeld > 60){
        minutes = timeHeld / 60;
        seconds = timeHeld % 60;
    }
    printf("You held your breath for %d minute(s) and %d second(s).\n", minutes, timeHeld);

    return 0;
}        