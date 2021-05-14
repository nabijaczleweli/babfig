// cc -Wall -Wextra -O3 toggle-screen-rotator.c -o ~/bin/toggle-screen-rotator

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
	chdir(getenv("HOME"));
	if(!access(".cache/no-spin-screen", F_OK))
		return unlink(".cache/no-spin-screen");
	else
		return creat(".cache/no-spin-screen", 0644) != -1;
}
