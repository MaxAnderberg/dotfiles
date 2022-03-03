package handlers

import (
	"log"
	"net/http"
)

type Products struct {
	l *log.Logger
}

// This idomatic way is just a constructor pattern for Golang. It's important that we learn this and can work with it.
func NewProducts(l *log.Logger) *Products {
	return &Products{
		l: l,
	}
}

func (p *Products) ServeHTTP(rw http.ResponseWriter, r *http.Request) {
	rw.Write([]byte("Hello products"))
}
