package model

type Session struct {
	Id   string `json:"session_id"`
	User User   `json:"-"`
}
