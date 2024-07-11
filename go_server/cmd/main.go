package main // import "hello-flutter"

import (
	"server"

	"github.com/inkeliz/gowebview"
)

func main() {
	go server.StartServer()

	winConfig := gowebview.WindowConfig{
		Title: "Hello World",
		Size:  &gowebview.Point{X: 800, Y: 600},
	}
	config := gowebview.Config{
		URL:          "http://localhost:12480/hello",
		WindowConfig: &winConfig,
	}

	w, err := gowebview.New(&config)
	if err != nil {
		panic(err)
	}
	defer w.Destroy()

	w.Run()
}
