/// Requires libicu-dev
/// cc ą.c -O3 -o ~/bin/ą $(pkg-config --cflags --libs icu-uc) -D_GNU_SOURCE
#include <unicode/uchar.h>
#include <stdio.h>
#include <wchar.h>
#include <string.h>
#include <locale.h>
int main() {
	setlocale(LC_ALL, "");
	for(wint_t c; (c = fgetwc(stdin)) != WEOF; ) {
		if(c == L'\n')
			continue;

		char name[4096];
		UErrorCode err;
		if(!u_charName(c, U_UNICODE_CHAR_NAME, name, sizeof(name), &err))
			strcpy(name, "(no name)");

		fprintf(stdout, "%lc\t(U+%04X, UTF-8 ", c, c);
		uint32_t uc = c;
		if(uc <= 0x7F) {
			fprintf(stdout, "%02x", uc);
		} else if(uc <= 0x7FF) {
			fprintf(stdout, "%02x ", 0b11000000 | ((uc & 0b11111000000) >> 6));
			fprintf(stdout, "%02x",  0b10000000 | ((uc & 0b00000111111) >> 0));
		} else if(uc <= 0xFFFF) {
			fprintf(stdout, "%02x ", 0b11100000 | ((uc & 0b1111000000000000) >> 12));
			fprintf(stdout, "%02x ", 0b10000000 | ((uc & 0b0000111111000000) >> 6));
			fprintf(stdout, "%02x",  0b10000000 | ((uc & 0b0000000000111111) >> 0));
		} else if(uc <= 0x10FFFF) {
			fprintf(stdout, "%02x ", 0b11110000 | ((uc & 0b111000000000000000000) >> 18));
			fprintf(stdout, "%02x ", 0b10000000 | ((uc & 0b000111111000000000000) >> 12));
			fprintf(stdout, "%02x ", 0b10000000 | ((uc & 0b000000000111111000000) >> 6));
			fprintf(stdout, "%02x",  0b10000000 | ((uc & 0b000000000000000111111) >> 0));
		} else
			fputs("too big!", stdout);
		fprintf(stdout, "\t): %s\n", name);
	}
}
