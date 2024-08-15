# Golang

## Docs
- [rwxrob "awesome" go list](https://github.com/rwxrob/awesome-go?tab=readme-ov-file)
- [x] [How to Write Go Code](https://go.dev/doc/code)
- [ ] [Effective Go](https://go.dev/doc/effective_go)
- [ ] [Go 101](https://go101.org/article/101.html)
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

## rwxrob enterprise Go tip
- learn go
- make api integration to prove you know what you are doing in gin or other middleware
- learn apigee, so you can write enterprise API integrations
- and go modernize whatever companies APIs
- biggest demand for Go is to modernize enterprise solutions that already exist
- and to put 1-2-10 or 20 REST api endpoints in place of older systems
- so they can modernize apps that use those systems so they can cycle them out
- "80K lines of Perl code that has to go" - they can't get rid of it until we abstract the enterprise integration layer with an API
- that is where the work is in backend development if you want to learn Go
- that's the sweetspot that pays well
- you are technically a developer even though you are doing operatinos
- web dev is not as important as knowing how to modernize enterprise systems and keep them working, keeping up to date or make new ones
- "boring is good" in enterprise

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

## GCP - Google Cloud Client Libraries for Go
- [gh](https://github.com/googleapis/google-cloud-go)
- [docs](https://pkg.go.dev/cloud.google.com/go)
