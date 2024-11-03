package service

import (
	"homework/model"
	"homework/repository"
)

type FoodService struct {
	Food repository.Food
}

func InitFoodService(repo repository.Food) *FoodService {
	return &FoodService{Food: repo}
}

func (repo *FoodService) Create(food model.Food) *model.Response {
	err := repo.Food.Create(&food)
	if err != nil {
		return &model.Response{StatusCode: 401, Message: "Authentication failed", Data: err.Error()}
	}
	return &model.Response{StatusCode: 200, Message: "User authenticated, Session created", Data: food}
}
