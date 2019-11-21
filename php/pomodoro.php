<?php

function clear_terminal(): void
{
    system('clear');
}

function display_time(int $x): void
{
    $div = round($x / 60);
    $mod = round($x % 60);
    $minutes = ($div < 10) ? "0$div" : "$div";
    $seconds = ($mod < 10) ? "0$mod" : "$mod";

    echo("$minutes:$seconds\n");
}

function run(): void
{
    $x = 0;

    while ($x < (25 * 60)) {
        clear_terminal();
        echo("Pomodoro (25 minutes):\n");
        display_time($x);
        sleep(1);
        $x += 1;
    }
}

function pause(int $duration): void
{
    $x = 0;

    while ($x < ($duration * 60)) {
        clear_terminal();
        echo("Pause ($duration minutes):\n");
        display_time($x);
        sleep(1);
        $x += 1;
    }
}

// count_run increment each time run() is called
// (used to decide between a short and a long pause)
$count_run = 0;

while (true) {
    run();
    $count_run += 1;
    if (($count_run > 0) && ($count_run % 4 == 0)) {
        pause(15);
    } else {
        pause(5);
    }
}
