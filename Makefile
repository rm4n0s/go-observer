.PHONY: all deps linter test cover

all: linter test cover

deps:
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.56.2

linter:
	golangci-lint run

test:
	go test -v -race -cpu=1,2,4 -coverprofile=coverage.txt -covermode=atomic

cover:
	go tool cover -html=coverage.txt -o coverage.html
