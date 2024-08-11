       IDENTIFICATION DIVISION.
       PROGRAM-ID. AverageTemperatureCalculator.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TEMPERATURE-FILE ASSIGN TO 'temperature.dat'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD TEMPERATURE-FILE.
       01 TEMPERATURE-RECORD.
           05 TEMPERATURE-DATE      PIC X(10).
           05 DAILY-TEMPERATURE     PIC S9(3)V9(1).

       WORKING-STORAGE SECTION.
       01 WS-TOTAL-TEMPERATURE      PIC S9(5)V9(1) VALUE 0.
       01 WS-RECORD-COUNT           PIC 9(2) VALUE 0.
       01 WS-AVERAGE-TEMPERATURE    PIC S9(3)V9(1).
       01 WS-END-OF-FILE            PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN INPUT TEMPERATURE-FILE

           PERFORM UNTIL WS-END-OF-FILE = 'Y'
               READ TEMPERATURE-FILE INTO TEMPERATURE-RECORD
                   AT END
                       MOVE 'Y' TO WS-END-OF-FILE
                   NOT AT END
                       ADD DAILY-TEMPERATURE TO WS-TOTAL-TEMPERATURE
                       ADD 1 TO WS-RECORD-COUNT
               END-READ
           END-PERFORM

           IF WS-RECORD-COUNT > 0
               COMPUTE WS-AVERAGE-TEMPERATURE = WS-TOTAL-TEMPERATURE / WS-RECORD-COUNT
               DISPLAY 'Average Temperature for Last 10 Days: ' WS-AVERAGE-TEMPERATURE
           ELSE
               DISPLAY 'No temperature data available.'
           END-IF

           CLOSE TEMPERATURE-FILE

           STOP RUN.
