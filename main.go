package main

import (
	"homework/app"
	"homework/config"
	"sync"
)

func main() {
	wg := sync.WaitGroup{}

	wg.Add(1)
	go app.Container(&wg, config.SessionTimeout)
	wg.Wait()
}
