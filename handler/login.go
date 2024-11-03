package handler

import (
	"database/sql"
	"homework/model"
	"homework/repository"
	"homework/service"
	"homework/util"
)

func Login(db *sql.DB) {
	// input
	user := model.User{}
	util.ReadJson(&user, "body")

	// proses
	result := service.InitAuthService(*repository.InitAuthRepo(db)).Login(user)

	// output
	util.BuildJson(result, "response")
}
