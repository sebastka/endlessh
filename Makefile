.POSIX:
CC       = cc
CFLAGS   = -std=c99 -Wall -Wextra -Wno-missing-field-initializers -Os
CPPFLAGS =
LDFLAGS  = -ggdb3
LDLIBS   =
PREFIX   = /usr/local

all: endlessh

endlessh: endlessh.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ endlessh.c $(LDLIBS)

install: endlessh
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 endlessh $(DESTDIR)$(PREFIX)/bin/
	install -d $(DESTDIR)$(PREFIX)/man/man1
	install -m 644 endlessh.1 $(DESTDIR)$(PREFIX)/man/man1/
	install -d $(PREFIX)/etc/endlessh
	install -m 644 util/smf/endlessh.conf $(PREFIX)/etc/endlessh

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/endlessh $(DESTDIR)$(PREFIX)/man/man1/endlessh.1 $(PREFIX)/etc/endlessh

clean:
	rm -rf endlessh
