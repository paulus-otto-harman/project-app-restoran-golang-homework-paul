package util

import (
	"encoding/json"
	"fmt"
	gola "github.com/paulus-otto-harman/golang-module"
	"io"
	"os"
)

func BuildJson(s interface{}, filename string) {

	file, err := os.Create(fmt.Sprintf("json/%s.json", filename))
	if err != nil {
		fmt.Println("Error creating file:", err)
		return
	}
	defer file.Close()

	encoder := json.NewEncoder(file)

	if err := encoder.Encode(&s); err != nil {
		fmt.Println("Error encoding JSON:", err)
		return
	}
}

func ReadJson(s interface{}, filename string) error {
	file, err := os.Open(fmt.Sprintf("json/%s.json", filename))

	if err != nil {
		fmt.Println("Error reading JSON file : ", err)
		return err
	}

	decoder := json.NewDecoder(file)
	err = decoder.Decode(&s)
	if err != nil && err != io.EOF {
		fmt.Println("Error decoding JSON: ", err)
		return err
	}
	return nil
}

func PrintJson(s interface{}, title ...string) {
	if len(title) != 0 {
		fmt.Println(gola.Tf(gola.Bold, title[0], gola.LightGreen))
	}
	indented, _ := json.MarshalIndent(s, "", " ")
	fmt.Println(string(indented))
}
