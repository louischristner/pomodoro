       IDENTIFICATION DIVISION.
         PROGRAM-ID. pomodoro.

       DATA DIVISION.
         WORKING-STORAGE SECTION.
      * used by sleep-1-second paragraph
           77 DAT-TODAY    PIC 9(8).
           77 DAT-TODAY2   PIC 9(8).
           77 TIME-TODAY   PIC 9(8).
           77 TIME-TODAY2  PIC 9(8).
           77 WRK-ONE-DAY  PIC 9(8).
           77 DELTA-TIME   PIC 9(8).

           77 COUNT-RUN    PIC 9(8).
           77 X            PIC 9(4).
           77 DURATION     PIC 9(2).
           77 TIME-TO-WAIT PIC 9(4).
           77 MINUTES      PIC 9(2).
           77 SECONDS      PIC 9(2).

         SCREEN SECTION.
           01 clear-terminal.
             02 BLANK SCREEN.

           01 display-time.
             02 LINE 2 COL 1 PIC 9(2) FROM MINUTES.
             02 LINE 2 COL 3 VALUE ":".
             02 LINE 2 COL 4 PIC 9(2) FROM SECONDS.

           01 display-pause.
             02 LINE 1 COL 1 VALUE "Pause (".
             02 LINE 1 COL 8 PIC 9(2) FROM DURATION.
             02 LINE 1 COL 10 VALUE " minutes):".

       PROCEDURE DIVISION.
      * count_run increment each time run-p paragraph is called
      * (used to decide between a short and a long pause)
         MOVE 0 TO COUNT-RUN.

         PERFORM UNTIL 1 = 0
           PERFORM run-p
           ADD 1 TO COUNT-RUN
           IF COUNT-RUN > 0 AND FUNCTION MOD (COUNT-RUN 4) = 0 THEN
             MOVE 15 TO DURATION
             PERFORM pause
           ELSE
             MOVE 5 TO DURATION
             PERFORM pause
           END-IF
         END-PERFORM.
         STOP RUN.

       run-p.
         MOVE 0 TO X
         COMPUTE TIME-TO-WAIT = 25 * 60

         PERFORM UNTIL X > TIME-TO-WAIT
           DISPLAY clear-terminal
           DISPLAY "Pomodoro (25 minutes):"
           DIVIDE X BY 60 GIVING MINUTES REMAINDER SECONDS
           DISPLAY display-time
           PERFORM sleep-1-second
           ADD 1 TO X
         END-PERFORM.

       pause.
         MOVE 0 TO X
         COMPUTE TIME-TO-WAIT = DURATION * 60

         PERFORM UNTIL X > TIME-TO-WAIT
           DISPLAY clear-terminal
           DISPLAY display-pause
           DIVIDE X BY 60 GIVING MINUTES REMAINDER SECONDS
           DISPLAY display-time
           PERFORM sleep-1-second
           ADD 1 TO X
         END-PERFORM.

       sleep-1-second.
         ACCEPT DAT-TODAY FROM DATE
         ACCEPT TIME-TODAY FROM TIME
         MOVE 0 TO WRK-ONE-DAY
         MOVE 0 TO DELTA-TIME
         MOVE 0 TO DAT-TODAY2
         MOVE 0 TO TIME-TODAY2

         PERFORM UNTIL DELTA-TIME > 00000100
           ACCEPT DAT-TODAY2 FROM DATE
           IF DAT-TODAY2 > DAT-TODAY
             MOVE 24000000 TO WRK-ONE-DAY
           END-IF
           ACCEPT TIME-TODAY2 FROM TIME
           COMPUTE DELTA-TIME = (TIME-TODAY2 + WRK-ONE-DAY - TIME-TODAY)
         END-PERFORM.
