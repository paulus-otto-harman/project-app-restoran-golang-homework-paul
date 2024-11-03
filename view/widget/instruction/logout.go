package instruction

import (
	"context"
	"fmt"
	"homework/util"
)

type Logout struct {
	SessionId string `json:"session_id"`
}

func (logout *Logout) Instruction(ctx context.Context) {
	logout.SessionId = ctx.Value("sessionId").(string)
	util.PrintJson(logout)

	fmt.Printf("\nUpdate body.json to logout\n\n")
}
