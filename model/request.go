package model

type Request struct {
	SessionId string      `json:"session_id"`
	Data      interface{} `json:"data"`
}
