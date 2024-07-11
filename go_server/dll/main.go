package main // import "go-server"

import "C"

import (
	"server"
)

// //export ExecuteServer
// func ExecuteServer() {
// 	server.StartServer()
// }

func init() {
	// ExecuteServer()
	server.StartServer()
}

func main() {}
