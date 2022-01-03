LDFLAGS := -s -w -X 'main.version=v0.0.0'

all: fmt build

fmt:
	go fmt ./...

build:
	go build -ldflags "${LDFLAGS}" -o cf cf.go

clean:
	rm cf
