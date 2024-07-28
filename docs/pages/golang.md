# Golang

## Docs
- [rwxrob "awesome" go list](https://github.com/rwxrob/awesome-go?tab=readme-ov-file)
- [x] [How to Write Go Code](https://go.dev/doc/code)
- [ ] [Effective Go](https://go.dev/doc/effective_go)
- [ ] [Beej's Guide to Network Programming](https://beej.us/guide/bgnet/html/split/)
- [golang nuts newsgroup](https://groups.google.com/g/golang-nuts)
- [ebnf](https://pkg.go.dev/golang.org/x/exp/ebnf)

## Install
- [All releases](https://go.dev/dl/)

## go mod init
go mod init github.com/emilosman/exo-cli

## Compile and run temp executable
go run plot.go

## Build and run executalbe
- go build -o plot plot.go
- run the compiled code: ./plot

## Run all `.go` files
`go run *.go`

## Install package
go install github.com/guptarohit/asciigraph/cmd/asciigraph@latest

## GOPATH
Add to ~/.zshrc

```bash
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

## adding and removing packages
- go get github.com/nsf/termbox-go
- go get github.com/nsf/termbox-go@none

## rwxrob
- [go](./rwxrob.md#go)
- [Develop enterprise software in Go](https://skilstak.io/boost/go/)
- [Where should I learn Go?](https://www.youtube.com/watch?v=zRxa224BG80)
- [2023 Learn Go | Week 1](https://www.youtube.com/watch?v=rfspYuA-0EY)

## TJ Holowaychuk
- [gh](https://github.com/tj)

## vim
- [vim-go](https://github.com/fatih/vim-go)

## Projects
- [cobra](https://github.com/spf13/cobra)
- [gorilla websocket chat example](https://github.com/gorilla/websocket/tree/master/examples/chat)
- [html to epub](https://github.com/gonejack/html-to-epub)

## Debugging - Delve
- [Delve](https://github.com/go-delve/delve)
- [Install](https://github.com/go-delve/delve/tree/master/Documentation/installation)
- [Getting Started](https://github.com/go-delve/delve/blob/master/Documentation/cli/getting_started.md)
- dlv debug ./cmd/exo-cli/main.go

## json
- [json-iterator, jsoniter](https://github.com/json-iterator/go)
- [Consider Not Using encoding/json in Go](https://rwxrob.github.io/zet/1329/)
