package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		hostname, _ := os.Hostname()
		rw.Write([]byte(hostname))
	})
	log.Fatalln(http.ListenAndServe(":8081", http.DefaultServeMux))
}
