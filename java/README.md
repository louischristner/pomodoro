# Java

Here is [Java](https://www.java.com/en/download/faq/develop.xml).
This program was written with openjdk 13.0.1.

## Run

At the repository root:
```
javac java/pomodoro.java && mv java/Pomodoro.class .
java Pomodoro
```

## Notes

- Every time you make an operation that can fail (return an exception) you must handle all of the exceptions that can be returned. You do that with try - catch blocks.

- In Java you can convert int to String in many ways : with String.valueOf() method, with Integer.toString() method or simply by concatenating an empty String with the integer.

- The sleep method only exists to clarify the code.
