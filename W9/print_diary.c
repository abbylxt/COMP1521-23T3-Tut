// prints out contents of $HOME/.diary

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(void) {
    // Create path $HOME/.diary
    char *home_path = getenv("HOME");

    if (home_path == NULL) {
        home_path = ".";
    }

    const char *diary_path = ".diary";

    int path_length = strlen(home_path) + strlen(diary_path) + 2;

    char *path = malloc(sizeof(char) * path_length);

    snprintf(path, path_length, "%s/%s", home_path, diary_path);

    // printf("%s\n", path);
    // Open $HOME/.diary 
    FILE *in = fopen(path, "r");

    if (in == NULL) {
        perror(path);
        return 1;
    }

    // Read and print from the file
    int letter;
    while ((letter = fgetc(in)) != EOF) {
        fputc(letter, stdout);
    }

    free(path);
    fclose(in);
}