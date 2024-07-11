package server // import "server"

import (
	"fmt"
	"net/http"
	"time"
)

func StartServer() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "It works! - %s", time.Now())
	})

	content := `
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	Hello client!
</body>
</html>`
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, content)
	})

	// addr := ":2480"
	addr := "127.0.0.1:2480"

	fmt.Printf("Listening on %s\n", addr)
	http.ListenAndServe(addr, nil)
}
