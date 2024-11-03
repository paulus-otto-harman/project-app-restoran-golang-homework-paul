package handler

import (
	"database/sql"
	"homework/model"
	"homework/repository"
	"homework/service"
	"homework/util"
)

func Logout(db *sql.DB) {
	// input
	session := model.Session{}
	util.ReadJson(&session, "body")

	// proses
	result := service.InitAuthService(*repository.InitAuthRepo(db)).Logout(session)

	// output
	util.BuildJson(result, "response")
}
