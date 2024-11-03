package handler

import (
	"database/sql"
	"encoding/json"
	"homework/model"
	"homework/repository"
	"homework/service"
	"homework/util"
)

func AddFood(db *sql.DB) {
	// input
	request := model.Request{}
	util.ReadJson(&request, "body")

	// proses
	food := model.Food{}
	requestData, _ := json.Marshal(request.Data)
	json.Unmarshal(requestData, &food)

	result := service.InitFoodService(*repository.InitFoodRepo(db)).Create(food)

	// output
	util.BuildJson(result, "response")
}
