package main

import (
    "context"
    "fmt"
    "os"
    "time"
)

func pathExists(path string, timeout time.Duration) bool {
    ctx, cancel := context.WithTimeout(context.Background(), timeout)
    defer cancel()

    ch := make(chan bool, 1)
    go func() {
        _, err := os.Stat(path)
        ch <- err == nil
    }()

    select {
    case <-ctx.Done():
        return false
    case exists := <-ch:
        return exists
    }
}

func main() {
    path := "/caminho/para/verificar"
    timeout := 4 * time.Second

    if pathExists(path, timeout) {
        fmt.Printf("%s está acessível\n", path)
    } else {
        fmt.Printf("%s não está acessível\n", path)
    }
}
