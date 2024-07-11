package main // import "libserver"

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
