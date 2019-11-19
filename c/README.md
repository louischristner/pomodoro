# C

Because C has not any dedicated website I choose somes I think are interesting if you want to discover it: the [Wikipedia page](https://en.wikipedia.org/wiki/C_(programming_language)) and [Learn-C website](https://www.learn-c.org/) which looks OK.

## Run

At the repository root:
```
gcc c/pomodoro.c
./a.out
```

## Notes

- _pause() function is written with an underscore because pause() function exists in unistd library (see #include).

- stdio library is used for printf() function, stdlib for system() and unistd for sleep().

- The main() while loop has true as condition but C has no boolean type (except if you include stdbool library which has been introduced in C99) and this 'true' has been defined by myself using #define. In C anything different than 0 or NULL is true so you can replace true by any non-zero number and it will work. I only create it as an example of what #define can be used for.
