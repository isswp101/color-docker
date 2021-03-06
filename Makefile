.PHONY: build lint clean
.SILENT: build lint clean

GO=$(shell which go)
BIN=$(CURDIR)/bin
APP=dco

build:
	GOOS=darwin GOARCH=amd64 $(GO) build -o $(BIN)/$(APP)-darwin-amd64 && \
	GOOS=linux GOARCH=amd64 $(GO) build -o $(BIN)/$(APP)-linux-amd64

lint:
	docker run --rm \
		-w /app \
		-v $(shell pwd):/app \
		golangci/golangci-lint golangci-lint run

clean:
	rm -f $(BIN)/$(APP)-*
