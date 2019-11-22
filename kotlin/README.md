# Kotlin

Here is [Kotlin](https://kotlinlang.org/).
Kotlin is designed to inter-operate fully with Java (it is supported by the JVM) but can also compiles to JavaScript or native code.
Kotlin is also object-oriented and functional.

## Run

At the repository root:
```
kotlinc kotlin/pomodoro.kt -include-runtime -d pomodoro.jar
java -jar pomodoro.jar
```

## Notes

- Thread.sleep() method comes from Java libraries.

- clear_terminal function doesn't call any bash command. It print an ANSI sequence the terminal translate to "clear the screen".

- In Kotlin `if` is an expression. It allows us to do this : `if (x > y) x else y`. This replace the ternary operator.

- Variables can be mutable (read-write) or non-mutable(read-only). A mutable variable will be prefixed by `var` keyword; a non-mutable variable will be prefixed by `val` keyword.
