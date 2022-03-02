package main

import (
	"log"
	"net/http"
	"os"
	"simple-service/handlers"
)

func main() {

	l := log.New(os.Stdout, "product-api", log.LstdFlags)
	hh := handlers.NewHello(l)

	sm := http.NewServeMux()
	sm.Handle("/", hh) // Handle is like a router? Not sure... Need to find this out
	http.ListenAndServe(":9090", sm)

}
