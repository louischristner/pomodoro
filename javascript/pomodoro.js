function sleep(ms) {
    current_date = Date.parse(new Date())

    while (Date.parse(new Date()) < (current_date + ms));
}

function clear_terminal() {
    console.clear()
}

function display_time(x) {
    var div = Math.floor(x / 60)
    var mod = Math.floor(x % 60)
    var minutes = (div < 10) ? ("0" + div) : (div)
    var seconds = (mod < 10) ? ("0" + mod) : (mod)

    console.log(minutes + ":" + seconds)
}

function run() {
    var x = 0

    while (x < (25 * 60)) {
        clear_terminal()
        console.log("Pomodoro (25 minutes):")
        display_time(x)
        sleep(1000)
        x += 1
    }
}

function pause(duration) {
    var x = 0

    while (x < (duration * 60)) {
        clear_terminal()
        console.log("Pause (" + duration + " minutes):")
        display_time(x)
        sleep(1000)
        x += 1
    }
}

// count_run increment each time run() is called
// (used to decide between a short and a long pause)
var count_run = 0

while (true) {
    run()
    count_run += 1
    if ((count_run > 0) && (count_run % 4 == 0)) {
        pause(15)
    } else {
        pause(5)
    }
}
