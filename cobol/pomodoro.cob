       IDENTIFICATION DIVISION.
         PROGRAM-ID. pomodoro.

       DATA DIVISION.
         WORKING-STORAGE SECTION.
           77 DAT-TODAY   PIC 9(8).
           77 DAT-TODAY2  PIC 9(8).
           77 TIME-TODAY  PIC 9(8).
           77 TIME-TODAY2 PIC 9(8).
           77 WRK-ONE-DAY PIC 9(8).
           77 DELTA-TIME  PIC 9(8).

         SCREEN SECTION.
           01 display_time.
             02 BLANK SCREEN.

       PROCEDURE DIVISION.
         PERFORM sleep-1-second 3 TIMES.
         STOP RUN.

       sleep-1-second.
         DISPLAY "Si"
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
