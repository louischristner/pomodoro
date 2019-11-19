import datetime
import time
import os



def clear_terminal():
    os.system('clear')


def display_time(x: int):
    div: int = int(x / 60)
    mod: int = int(x % 60)
    minutes: str = ("0" + str(div), str(div))[div > 10]
    seconds: str = ("0" + str(mod), str(mod))[mod > 10]

    print(minutes + ":" + seconds)


def run():
    x: int = 0

    while x < (25 * 60):
        clear_terminal()
        print("Pomodoro (25 minutes):")
        display_time(x)
        time.sleep(1)
        x += 1


def pause(duration: int):
    x: int = 0

    while x < (duration * 60):
        clear_terminal()
        print("Pause (" + str(duration) + " minutes):")
        display_time(x)
        time.sleep(1)
        x += 1


# count_run increment each time run() is called
# (used to decide between a short and a long pause)
count_run: int = 0

while True:
    run()
    count_run += 1
    if (count_run > 0) & (count_run % 4 == 0):
        pause(15)
    else:
        pause(5)
