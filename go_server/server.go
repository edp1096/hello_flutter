package server // import "server"

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"time"
)

// windows : .
// android : /data/user/0/com.dream_world.hello_flutter/app_flutter
var pkgRoot string = "."

func StartServer() {
	http.HandleFunc("/setpath", func(w http.ResponseWriter, r *http.Request) {
		internalPath := r.URL.Query().Get("internalPath")

		pkgRoot = internalPath
		fmt.Println(internalPath)

		if pkgRoot == "" {
			pkgRoot = "."
		}

		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "It works! - %s", time.Now())
	})

	http.HandleFunc("/save", func(w http.ResponseWriter, r *http.Request) {
		// 파일 생성
		file, err := os.Create(pkgRoot + "/sample.txt")
		if err != nil {
			fmt.Println("file creation:", err)
			return
		}
		defer file.Close()

		// 파일에 데이터 쓰기
		data := "Hello, Go 언어!"
		_, err = file.Write([]byte(data))
		if err != nil {
			fmt.Println("file writing:", err)
			return
		}

		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Done"))
	})

	http.HandleFunc("/load", func(w http.ResponseWriter, r *http.Request) {
		// 파일 열기
		file, err := os.Open(pkgRoot + "/sample.txt")
		if err != nil {
			fmt.Println("file open:", err)
			return
		}
		defer file.Close()

		// 파일 읽기
		data, err := io.ReadAll(file)
		if err != nil {
			fmt.Println("file read:", err)
			return
		}

		w.WriteHeader(http.StatusOK)
		w.Write([]byte(data))
	})

	http.HandleFunc("/list", func(w http.ResponseWriter, r *http.Request) {
		files, err := os.ReadDir(pkgRoot + "/")
		if err != nil {
			fmt.Println("list dir:", err)
			// return
		}

		data := "./\n"
		for _, file := range files {
			data += file.Name() + "\n"
		}

		w.WriteHeader(http.StatusOK)
		w.Write([]byte(data))
	})

	content := `
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	Hello client!

	<button onclick="alert('Hello world!')">Hello</button>
	<button onclick="save()">Save</button>
	<button onclick="load()">Load</button>
	<button onclick="list()">List</button>
</body>

<script>

function getQueryParam(uri, param) {
    const url = new URL(uri);
    const params = new URLSearchParams(url.search);
    return params.get(param);
}

const dir = getQueryParam(window.location.href, "dir")

async function save() {
	const r = await fetch("/save")
	if (r.ok) {
		alert("Done.")
	}
}

async function load() {
	const r = await fetch("/load")
	if (r.ok) {
		const response = await r.text()
		alert(response)
	}
}

async function list() {
	const r = await fetch("/list")
	if (r.ok) {
		const response = await r.text()
		alert(response)
	}
}
</script>
</html>`
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, content)
	})

	// addr := ":12480"
	addr := "127.0.0.1:12480"

	fmt.Printf("Listening on %s\n", addr)
	http.ListenAndServe(addr, nil)
}
