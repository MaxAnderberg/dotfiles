package main

import (
	"log"
	"net/http"
	"os"
	"simple-service/handlers"
	"time"
)

func main() {

	l := log.New(os.Stdout, "product-api", log.LstdFlags)
	hh := handlers.NewHello(l)
	gh := handlers.NewGoodBye(l)
	sm := http.NewServeMux()
	sm.Handle("/", hh) // Handle is like a end point, when end point / is fired do hh.
	sm.Handle("/goodbye", gh)

	s := &http.Server{
		Addr:         ":9090",
		Handler:      sm,
		IdleTimeout:  120 * time.Second,
		ReadTimeout:  1 * time.Second,
		WriteTimeout: 1 * time.Second,
	}

	s.ListenAndServe()
}
