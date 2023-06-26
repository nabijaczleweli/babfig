/// cc fdinfo.c -O3 -o ~/bin/fdinfo -D_GNU_SOURCE
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
// cat /proc/3766/fdinfo/5
// pos:    0
// flags:  0104000
// mnt_id: 64
// ino:    393969
int main() {
	long long pos;
	unsigned flags = 0;
	scanf("pos:\t%lld\nflags:\t%o", &pos, &flags);
	switch(flags & O_ACCMODE) {
		case O_RDONLY:
			fputs("O_RDONLY\t", stdout);
			break;
		case O_WRONLY:
			fputs("O_WRONLY\t", stdout);
			break;
		case O_RDWR:
			fputs("O_RDWR\t", stdout);
			break;
	}
#define IF(flag)             \
	if((flags & flag) == flag) \
		fputs(#flag " ", stdout);

	IF(O_CREAT);
	IF(O_EXCL);
	IF(O_NOCTTY);
	IF(O_TRUNC);
	IF(O_APPEND);
	IF(O_NONBLOCK);
	IF(O_SYNC);
	IF(O_ASYNC);
	IF(O_LARGEFILE);
	IF(O_DIRECTORY);
	IF(O_NOFOLLOW);
	IF(O_DIRECT);
	IF(O_NOATIME);
	IF(O_PATH);
	IF(O_DSYNC);
	IF(O_TMPFILE);
	IF(O_CLOEXEC);
	putchar('\n');
}
