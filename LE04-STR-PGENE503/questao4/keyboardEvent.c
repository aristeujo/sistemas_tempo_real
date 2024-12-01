#include <termios.h>
#include <unistd.h>
#include <stdlib.h>

struct termios original_termios;

void restore_terminal() {
    tcsetattr(STDIN_FILENO, TCSANOW, &original_termios);
}

void setup_terminal() {
    struct termios new_termios;

    tcgetattr(STDIN_FILENO, &original_termios);

    new_termios = original_termios;
    new_termios.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &new_termios);

    atexit(restore_terminal);
}
