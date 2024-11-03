package log

import (
	"database/sql"
	gola "github.com/paulus-otto-harman/golang-module"
	handle "homework/handler"
	"homework/model"
	"homework/util"
)

type Login struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func (login *Login) Process(db *sql.DB) *model.Response {
	request := Login{}
	util.ReadJson(&request, "body")
	util.PrintJson(request, "Request")
	handle.Login(db)
	response := model.Response{}
	util.ReadJson(&response, "response")
	util.PrintJson(response, "Response")

	if response.StatusCode == 200 {
		gola.Wait("Press any key to continue")
	}

	return &response
}
