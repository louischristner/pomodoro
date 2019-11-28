use std::{thread, time, process};

const ONE_SEC: time::Duration = time::Duration::from_secs(1);

fn clear_terminal() {
    process::Command::new("clear").status().expect("can't clear screen");
}

fn display_time(x: i16) {
    let minutes: i16 = x / 60;
    let seconds: i16 = x % 60;

    println!("{:02}:{:02}", minutes, seconds);
}

fn run() {
    let mut x: i16 = 0;

    while x < (25 * 60) {
        clear_terminal();
        println!("Pomodoro (25 minutes):");
        display_time(x);
        thread::sleep(ONE_SEC);
        x += 1;
    }
}

fn pause(duration: i16) {
    let mut x: i16 = 0;

    while x < (duration * 60) {
        clear_terminal();
        println!("Pause ({} minutes):", duration);
        display_time(x);
        thread::sleep(ONE_SEC);
        x += 1;
    }
}

fn main() {
    let mut count_run: i32 = 0;

    loop {
        run();
        count_run += 1;
        if count_run > 0 && count_run % 4 == 0 {
            pause(15);
        } else {
            pause(5);
        }
    }
}
