package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	log.Print("Received request")
	target := os.Getenv("TARGET")
	if target == "" {
		target = "world"
	}

	fmt.Fprintf(w, "Hello %s!\n", target)
}

func main() {
	log.Print("Starting receiving requests")

	http.HandleFunc("/", handler)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("hello world listening to port %s", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
