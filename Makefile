

##
## ## Path
##

DESTDIR ?=
PREFIX ?= /usr
BINDIR := $(DESTDIR)$(PREFIX)/bin
MANDIR := $(DESTDIR)$(PREFIX)/man
SHAREDIR := $(DESTDIR)$(PREFIX)/share




##
## ## Default Rule
##

default: build
.PHONY: default




##
## ## Help
##

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make deb-build-essential'
	@echo
	@echo '	$$ make deb-build-dep'
	@echo
	@echo '	$$ make deb-build'
	@echo
	@echo '	$$ make srcdeb-build'
	@echo
	@echo
	@echo '	$$ make icon-archive'
	@echo '	$$ make icon-install'
	@echo
	@echo
	@echo '	$$ make util-fix-file-permissions'
	@echo '	$$ make util-update-icon-cache'
	@echo
.PHONY: help




##
## ## Dump
##

dump:
	@echo "DESTDIR=$(DESTDIR)"
	@echo "PREFIX=$(PREFIX)"
	@echo "BINDIR=$(BINDIR)"
	@echo "MANDIR=$(MANDIR)"
	@echo "SHAREDIR=$(SHAREDIR)"
.PHONY: dump




##
## ## call-by debian/rules
##

build:
	@echo "I: build..."
.PHONY: build


install:
	@echo "I: install..."
.PHONY: install


clean:
	@echo "I: clean..."
.PHONY: clean




##
## ## deb-build
##

deb-build-essential:
	sudo apt-get --yes install git devscripts equivs
.PHONY: deb-build-essential


deb-build-dep:
	sudo mk-build-deps -i -t "apt-get -y" -r
.PHONY: deb-build-dep


deb-build:
	dpkg-buildpackage -b -uc -us -tc
.PHONY: deb-build


srcdeb-build:
	dpkg-buildpackage -uc -us -tc
.PHONY: srcdeb-build




##
## ## changelog
##
## * [man 5 deb-changelog](https://manpages.debian.org/stable/dpkg-dev/deb-changelog.5.en.html)
## * [man 1 debchange](https://manpages.debian.org/stable/devscripts/debchange.1.en.html)
##

changelog-edit:
	debchange
.PHONY: changelog-edit


changelog-time:
	date -R
.PHONY: changelog-time


##
## `date -R`
##
## `date -d '2025-06-09 07:45:46' -R`
##




##
## ## icon
##

icon-archive:
	@./icon-archive.sh
.PHONY: icon-archive


icon-install:
	@./icon-install.sh
.PHONY: icon-install




##
## ## util
##

util-fix-file-permissions:
	@./util-fix-file-permissions.sh
.PHONY: util-fix-file-permissions


util-update-icon-cache:
	@./util-update-icon-cache.sh
.PHONY: util-update-icon-cache
