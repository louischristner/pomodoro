fun clear_terminal() {
    print("\u001Bc")
}

fun display_time(x: Int) {
    val div: Int = x / 60
    val mod: Int = x % 60
    val minutes: String = if (div < 10) "0$div" else "$div"
    val seconds: String = if (mod < 10) "0$mod" else "$mod"

    println(minutes + ":" + seconds)
}

fun run() {
    var x: Int = 0

    while (x < (25 * 60)) {
        clear_terminal()
        println("Pomodoro (25 minutes):")
        display_time(x)
        Thread.sleep(1000)
        x += 1
    }
}

fun pause(duration: Int) {
    var x: Int = 0

    while (x < (25 * 60)) {
        clear_terminal()
        println("Pause ($duration minutes):")
        display_time(x)
        Thread.sleep(1000)
        x += 1
    }
}

fun main(args: Array<String>) {
    var count_run: Int = 0

    while (true) {
        run()
        count_run += 1
        if ((count_run > 0) && (count_run % 4 == 0)) {
            pause(15)
        } else {
            pause(5)
        }
    }
}
