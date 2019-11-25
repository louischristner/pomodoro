#!/usr/bin/perl
use warnings;

sub clear_terminal {
    system("clear");
}

sub display_time {
    my $x = $_[0];
    my $div = int($x / 60);
    my $mod = $x % 60;
    my $minutes = ($div < 10) ? "0$div" : $div;
    my $seconds = ($mod < 10) ? "0$mod" : $mod;

    print "$minutes:$seconds\n";
}

sub run {
    my $x = 0;

    while ($x < (25 * 60)) {
        clear_terminal();
        print "Pomodoro (25 minutes):\n";
        display_time($x);
        sleep(1);
        $x += 1;
    }
}

sub pause {
    my $duration = $_[0];
    my $x = 0;

    while ($x < ($duration * 60)) {
        clear_terminal();
        print "Pause (" . $duration . " minutes):\n";
        display_time($x);
        sleep(1);
        $x += 1;
    }
}

# count_run increment each time run() is called
# (used to decide between a short and a long pause)
my $count_run = 0;

while (1) {
    run();
    $count_run += 1;
    if (($count_run > 0) && ($count_run % 4 == 0)) {
        pause(15);
    } else {
        pause(5);
    }
}
