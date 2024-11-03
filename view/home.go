package view

import (
	"context"
	"database/sql"
	"fmt"
	gola "github.com/paulus-otto-harman/golang-module"
	"homework/util"
)

type Home struct {
	isLogout bool
}

func (home *Home) Render(ctx context.Context, db *sql.DB) int {
	util.H1("Menu Utama")

	fmt.Println("[1] Tambah Hidangan")
	fmt.Println("[2] Buat Pesanan")
	fmt.Println("[3] Daftar Pesanan")
	fmt.Println("[4] Update Status Pesanan")
	fmt.Println("[5] Hapus Pesanan")

	fmt.Println("\n[0] Logout")

	menuItem, _ := gola.ToInt(gola.Input(gola.Args(gola.P("type", "number"), gola.P("label", fmt.Sprintf("%s :", "Pilih [1]-[4] atau [0] untuk Logout")))))
	switch menuItem {
	case 0:
		logout := Logout{}
		Render(&logout, ctx, db)
		if logout.Confirmed {
			home.isLogout = true
			return 0
		}
	case 1:

	case 2:

	case 3:
	case 9:
		home.isLogout = true
		return 0
	}
	return -1
}
