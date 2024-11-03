package main

import "homework/database"

func main() {
	db := database.DbOpen()
	defer db.Close()
}
