local clock = os.clock

function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do end
end

function clear_terminal()
    os.execute("clear")
end

function display_time(x)
    local div = math.floor(x / 60)
    local mod = math.floor(x % 60)
    local minutes = div < 10 and "0" .. div or div
    local seconds = mod < 10 and "0" .. mod or mod

    print(minutes .. ":" .. seconds)
end

function run()
    local x = 0

    while x < 25 * 60 do
        clear_terminal()
        print("Pomodoro (25 minutes):")
        display_time(x)
        sleep(1)
        x = x + 1
    end
end

function pause(duration)
    local x = 0

    while x < duration * 60 do
        clear_terminal()
        print("Pause (" .. duration .. " minutes):")
        display_time(x)
        sleep(1)
        x = x + 1
    end
end

-- count_run increment each time run() is called
-- (used to decide between a short and a long pause)
local count_run = 0

while true do
    run()
    count_run = count_run + 1
    if count_run % 4 == 0 then
        pause(15)
    else
        pause(5)
    end
end
