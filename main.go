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

//func xmain() {
//	db := database.DbOpen()
//	(&view.Logout{}).Render(context.WithValue(context.Background(), "sessionId", "d80daedb-f526-49f0-891e-47ac6e2bb480"), db)
//}
