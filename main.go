package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World!")
}

func main() {
	http.HandleFunc("/", helloHandler)
	fmt.Println("Starting server at port 6666")
	if err := http.ListenAndServe(":6666", nil); err != nil {
		fmt.Println("Error starting server:", err)
	}
}