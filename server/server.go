package server // import "server"

import (
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"math"
	"net/http"
	"time"
)

func RandomString(l int) string {
	buff := make([]byte, int(math.Ceil(float64(l)/1.33333333333)))
	_, err := rand.Read(buff)
	if err != nil {
		return ""
	}
	str := base64.RawURLEncoding.EncodeToString(buff)
	return str[:l] // strip 1 extra character we get from odd length results
}

func StartServer() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "It works! - %s", time.Now())
	})

	addr := "127.0.0.1:2480"

	fmt.Printf("Listening on %s\n", addr)
	http.ListenAndServe(addr, nil)
}
