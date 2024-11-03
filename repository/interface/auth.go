package repository_interface

import "homework/model"

type Authentication interface {
	Authenticate(user *model.User) (*model.Session, error)
	Logout(session *model.Session) (int, error)
}
