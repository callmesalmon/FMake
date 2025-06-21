.PHONY: install remove

SRC="fmake.go"
BIN="/usr/local/bin/fmake"

all: install doc

install:
	go build -o ${BIN} ${SRC}

doc:
	cd man && sudo rtfm

remove:
	go clean
	rm ${BIN}
