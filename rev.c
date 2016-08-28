/*
 *  A string reverse tool
 *  input: stdin
 *  output: stdout
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int buffer[2048], ch, lines=0, i=0;
    do
    {
        ch = fgetc(stdin);
        if ((ch == '\n') || 
            (ch == EOF && i > 0) || 
            (i == (sizeof(buffer)/sizeof(*buffer)-1)))
        {
            ++lines;
            while (i != 0)
                fputc(buffer[--i], stdout);
            fputc('\n', stdout);
        }
        else
        {
            buffer[i++] = ch;
        }
    } while (ch != EOF);

    return 0;
}