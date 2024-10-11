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
	fmt.Println("Starting server at port 8282")
	if err := http.ListenAndServe(":8282", nil); err != nil {
		fmt.Println("Error starting server:", err)
	}
}