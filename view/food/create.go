package view

import (
	"context"
	"database/sql"
	handler "homework/handler/food"
	com "homework/util"
)

type FoodCreate struct {
}

func (food *FoodCreate) Render(ctx context.Context, db *sql.DB) int {
	com.H1("Tambah Hidangan")
	if answer := com.ContinueOrExit(); answer == 0 {
		return 0
	}
	handler.AddFood(db)
	return -1
}
