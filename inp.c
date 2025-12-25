#include <conio.h>
#include <stdio.h>
#include <windows.h>

int main() {
    int timeout_ms = 100; // this WILL murder someone's hard drive. But smooth game
v    int key = 0;

    for (int i = 0; i < timeout_ms / 5; i++) {
        if (_kbhit()) {
            key = getch();
            break;
        }
        Sleep(5);
    }

    if (key == 0) {
        key = 'g';
    }

    putchar(key);
    fflush(stdout);
    return 0;
}
