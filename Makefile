LDFLAGS := -s -w

all: fmt build

fmt:
	go fmt ./...

build:
	go build -ldflags "${LDFLAGS}" -o cf cf.go

clean:
	rm cf
