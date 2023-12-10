// go mod init app
// go run main.go OU go build main.go
// google golang spec

package main

import "fmt"

func main() {
	fmt.Println("Hello, Gophers 😎")

	const name = "A"
	const age = 22

	fmt.Printf("%s tem %d anos. \t E os tipos são %T e %T\n", name, age, name, age)
}
