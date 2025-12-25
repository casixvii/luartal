#include <conio.h>
#include <stdio.h>

int main() {
	int key = getch();
	fputc(key, stdout);
	fflush(stdout);
	return 0;
}
