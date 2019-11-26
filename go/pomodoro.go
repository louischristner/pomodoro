package main

import (
	"fmt"
	"time"
	"strconv"
	"os/exec"
	"os"
)

func clear_terminal() {
	cmd := exec.Command("clear")
	cmd.Stdout = os.Stdout
	cmd.Run()
}

func display_time(x int) {
	div := x / 60
	mod := x % 60
	var minutes, seconds string

	if div < 10 {
		minutes = "0" + strconv.Itoa(div)
	} else {
		minutes = strconv.Itoa(div)
	}

	if mod < 10 {
		seconds = "0" + strconv.Itoa(mod)
	} else {
		seconds = strconv.Itoa(mod)
	}

	fmt.Println(minutes + ":" + seconds)
}

func run() {
	x := 0

	for x < (25 * 60) {
		clear_terminal()
		fmt.Println("Pomodoro (25 minutes):")
		display_time(x)
		time.Sleep(1 * time.Second)
		x += 1
	}
}

func pause(duration int) {
	x := 0

	for x < (duration * 60) {
		clear_terminal()
		fmt.Println("Pause (" + strconv.Itoa(duration) + " minutes):")
		display_time(x)
		time.Sleep(1 * time.Second)
		x += 1
	}
}

func main() {
	count_run := 0

	for {
		run()
		count_run += 1
		if (count_run > 0) && (count_run % 4 == 0) {
			pause(15)
		} else {
			pause(5)
		}
	}
}
