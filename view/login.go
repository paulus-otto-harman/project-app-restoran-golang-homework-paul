package view

import (
	"context"
	"database/sql"
	"encoding/json"
	gola "github.com/paulus-otto-harman/golang-module"
	"homework/model"
	com "homework/util"
	widget "homework/view/widget/instruction"
	monitor "homework/view/widget/log"
)

type Login struct {
	IsCancelled bool
}

func (login *Login) Render(ctx context.Context, db *sql.DB) int {
	com.H1("Login")

	(&widget.Login{}).Instruction(ctx)

	if answer := com.ContinueOrExit(); answer == 0 {
		login.IsCancelled = true
		return 0
	}

	response := (&monitor.Login{}).Process(db)

	switch response.StatusCode {
	case 200:
		home := Home{}
		Render(&home, context.WithValue(ctx, "sessionId", getSessionId(response)), db)
		if !home.isLogout {
			gola.Wait("Session expired. Press Enter to login")
		}
	case 401:
		gola.Wait(gola.Tf(gola.Color, "User Not Found", gola.LightYellow))
	}

	return -1
}

func getSessionId(response *model.Response) string {
	session := model.Session{}
	sessionData, _ := json.Marshal(response.Data)
	json.Unmarshal(sessionData, &session)

	return session.Id
}
