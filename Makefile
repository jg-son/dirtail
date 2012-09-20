
DESTDIR ?= /usr/local

.PHONY: install man doc clean

%.1: %
	pod2man $< $@

%.html: %.md
	Markdown.pl README.md > README.html

all: man

man: dirtail.1

doc: README.html

install: all
	install -m 755 dirtail $(DESTDIR)/bin/dirtail
	install -m 644 dirtail.1 $(DESTDIR)/man/dirtail.1

clean:
	-rm dirtail.1
	-rm README.html
