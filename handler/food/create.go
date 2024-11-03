package food

import (
	"database/sql"
	"homework/model"
	"homework/repository"
	"homework/service"
	"homework/util"
)

func Login(db *sql.DB) {
	// input
	request := model.Request{}
	util.ReadJson(&request, "body")

	// proses
	result := service.InitFoodService(*repository.InitFoodRepo(db)).Create(*request.Data.(*model.Food))

	// output
	util.BuildJson(result, "response")
}
