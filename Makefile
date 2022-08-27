SHELL = /bin/bash
NAME = cf

BUILD_GIT_TAG=$(shell git describe --tags --abbrev=0 || echo "TagNotFound")
BUILD_GIT_COMMIT_ID=$(shell git rev-parse HEAD || echo "GitNotFound")
BUILD_DATE=$(shell date +%F)
LDFLAGS="\
-s -w \
-X main.version=$(BUILD_GIT_TAG) \
-X main.commit=$(BUILD_GIT_COMMIT_ID) \
-X main.date=$(BUILD_DATE) \
"

all: build

fmt:
	go fmt ./...

build:
	go build -ldflags ${LDFLAGS} -o ${NAME} cf.go

.PHONY: clean
clean:
	rm -fr $(NAME)
