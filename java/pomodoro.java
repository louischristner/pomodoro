import java.io.IOException;

class Pomodoro {
    public static void sleep(int ms) {
        try {
            Thread.sleep(ms);
        } catch(InterruptedException exception) {
            exception.printStackTrace();
        }
    }

    public static void clear_terminal() {
        try {
            new ProcessBuilder("bash", "-c", "clear").inheritIO().start().waitFor();
        } catch (IOException exception) {
            exception.printStackTrace();
        } catch (InterruptedException exception) {
            exception.printStackTrace();
        }
    }

    public static void display_time(int x) {
        int div = x / 60;
        int mod = x % 60;
        String minutes = (div < 10) ? "0" + div : Integer.toString(div);
        String seconds = (mod < 10) ? "0" + mod : Integer.toString(mod);

        System.out.println(minutes + ":" + seconds);
    }

    public static void run() {
        int x = 0;

        while (x < (25 * 60)) {
            clear_terminal();
            System.out.println("Pomodoro (25 minutes):");
            display_time(x);
            sleep(1000);
            x += 1;
        }
    }

    public static void pause(int duration) {
        int x = 0;

        while (x < (duration * 60)) {
            clear_terminal();
            System.out.println("Pause (" + duration + " minutes):");
            display_time(x);
            sleep(1000);
            x += 1;
        }
    }

    // count_run increment each time run() is called
    // (used to decide between a short and a long pause)
    public static void main(String[] args) {
        int count_run = 0;

        while (true) {
            run();
            count_run += 1;
            if ((count_run > 0) && (count_run % 4 == 0)) {
                pause(15);
            } else {
                pause(5);
            }
        }
    }
}
