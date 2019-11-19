#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define true 1
#define false 0

void clear_terminal(void)
{
    system("clear");
}

void display_time(int x)
{
    int div = x / 60;
    int mod = x % 60;
    char minutes[3] = {(div / 10) + '0', (div % 10) + '0', '\0'};
    char seconds[3] = {(mod / 10) + '0', (mod % 10) + '0', '\0'};

    printf("%s:%s\n", minutes, seconds);
}

void run(void)
{
    int x = 0;

    while (x < (25 * 60)) {
        clear_terminal();
        printf("Pomodoro (25 minutes):\n");
        display_time(x);
        sleep(1);
        x += 1;
    }
}

void _pause(int duration)
{
    int x = 0;

    while (x < (duration * 60)) {
        clear_terminal();
        printf("Pause (%d minutes):\n", duration);
        display_time(x);
        sleep(1);
        x += 1;
    }
}

int main(void)
{
    int count_run = 0;

    while (true) {
        run();
        count_run += 1;
        if ((count_run > 0) && (count_run % 4 == 0)) {
            _pause(15);
        } else {
            _pause(5);
        }
    }
    return (0);
}
