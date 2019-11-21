def clear_terminal
    system("clear")
end


def display_time(x)
    div = x / 60
    mod = x % 60
    minutes = (div < 10) ? "0" + div.to_s : div.to_s
    seconds = (mod < 10) ? "0" + mod.to_s : mod.to_s

    puts minutes + ":" + seconds
end


def run
    x = 0

    while x < (25 * 60) do
        clear_terminal()
        puts "Pomodoro (25 minutes):"
        display_time(x)
        sleep(1)
        x += 1
    end
end


def pause(duration)
    x = 0

    while x < (duration * 60) do
        clear_terminal()
        puts "Pause (" + duration.to_s + " minutes):"
        display_time(x)
        sleep(1)
        x += 1
    end
end


# count_run increment each time run() is called
# (used to decide between a short and a long pause)
count_run = 0

while true do
    run()
    count_run += 1
    if (count_run > 0) and (count_run % 4 == 0)
        pause(15)
    else
        pause(5)
    end
end
