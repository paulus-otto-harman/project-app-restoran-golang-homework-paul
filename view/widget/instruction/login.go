package instruction

import (
	"context"
	"fmt"
	"homework/util"
)

type Login struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func (login *Login) Instruction(ctx context.Context) {
	util.PrintJson(login)
	fmt.Printf("\nUpdate body.json to login\n\n")
}
