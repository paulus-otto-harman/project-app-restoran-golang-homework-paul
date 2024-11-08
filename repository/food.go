package repository

import (
	"database/sql"
	"homework/model"
)

type Food struct {
	Db *sql.DB
}

func InitFoodRepo(db *sql.DB) *Food {
	return &Food{Db: db}
}

func (repo *Food) Create(food *model.Food) error {
	query := `INSERT INTO foods (name) VALUES($1) RETURNING id`

	if err := repo.Db.QueryRow(query, food.Name).Scan(&food.Id); err != nil {
		return err
	}
	return nil
}
