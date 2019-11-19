function clear_terminal()
    Base.run(`clear`)
end


function displayTime(x::Int64)
    div = floor(Int64, x / 60)
    mod = floor(Int64, x % 60)
    minutes::String = (div < 10) ? string("0", string(div)) : string(div)
    seconds::String = (mod < 10) ? string("0", string(mod)) : string(mod)

    println(minutes, ":", seconds)
end


function run()
    x::Int64 = 0

    while x < (25 * 60)
        clear_terminal()
        println("Pomodor (25 minutes):")
        displayTime(x)
        sleep(1)
        x += 1
    end
end


function pause(duration::Int64)
    x::Int64 = 0

    while x < (duration * 60)
        clear_terminal()
        println("Pause (", string(duration), " minutes):")
        displayTime(x)
        sleep(1)
        x += 1
    end
end


# count_run increment each time run() is called
# (used to decide between a short and a long pause)
function main()
    count_run::Int64 = 0

    while true
        run()
        count_run += 1
        if (count_run > 0) && (count_run % 4 == 0)
            pause(15)
        else
            pause(5)
        end
    end
end


main() # call main function (See julia/README.md)
