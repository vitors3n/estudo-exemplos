package main

import (
        "fmt"
        "io/ioutil"
        "os"
        "time"
)

func calc_dir_size(dir string) int64 {

        files, err := ioutil.ReadDir(dir)

        if err != nil {
                fmt.Println(err)
                return 0
        }

        var totalDirSize int64 = 0

        for _, file := range files {
                if !file.IsDir(){
                        totalDirSize += file.Size()
                        //fmt.Println(file.Name(), " - ", file.Size())
                } else {
                        var newDir = dir + "/" + file.Name()
                        //fmt.Println("Pasta: ", newDir)
                        totalDirSize += calc_dir_size(newDir)
                }
        }

        return totalDirSize
}


func main() {

        startTime := time.Now()

        var totalSize = calc_dir_size(os.Args[1])

        var total float64 = float64(totalSize)/(1024*1024*1024)

        fmt.Printf("Tamanho do Diretório: %.3f Gigabytes \n", total)

        endTime := time.Now()

        executionTime := endTime.Sub(startTime)

        fmt.Printf("Executado em %v\n", executionTime)
}
