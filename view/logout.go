package view

import (
	"context"
	"database/sql"
	"fmt"
	gola "github.com/paulus-otto-harman/golang-module"
	com "homework/util"
	widget "homework/view/widget/instruction"
	monitor "homework/view/widget/log"
)

type Logout struct {
	IsCancelled bool `json:"-"`
	Confirmed   bool `json:"-"`
}

func (logout *Logout) Render(ctx context.Context, db *sql.DB) int {
	com.H1("Logout")

	(&widget.Logout{}).Instruction(ctx)

	fmt.Printf("\nUpdate body.json to logout. Session ID is %v\n\n", ctx.Value("sessionId"))

	if answer := com.ContinueOrReturn(); answer == 0 {
		logout.IsCancelled = true
		return 0
	}
	response := (&monitor.Logout{}).Process(db)
	switch response.StatusCode {
	case 200:
		gola.Wait("Press any key to continue")
		logout.Confirmed = true
		return 0
	case 401:
		gola.Wait(gola.Tf(gola.Color, "Logout Failed", gola.LightYellow))
	}
	return -1
}
