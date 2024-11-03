package log

import (
	"database/sql"
	handle "homework/handler"
	"homework/model"
	"homework/util"
)

type Logout struct {
}

func (logout *Logout) Process(db *sql.DB) *model.Response {
	request := model.Request{}
	util.ReadJson(&request, "body")
	util.PrintJson(request, "Request")
	handle.Logout(db)

	response := model.Response{}
	util.ReadJson(&response, "response")
	util.PrintJson(response, "Response")

	return &response
}
