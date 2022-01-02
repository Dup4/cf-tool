LDFLAGS := -s -w

all: fmt build

fmt:
	go fmt ./...

build:
	go build -trimpath -ldflags "${LDFLAGS}" -o cf cf.go

clean:
	rm cf
