package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		hostname, _ := os.Hostname()
		allocId, _ := os.LookupEnv("NOMAD_ALLOC_INDEX")
		rw.Write([]byte("hello " + hostname + " from " + allocId))
	})
	log.Fatalln(http.ListenAndServe(":8081", http.DefaultServeMux))
}
