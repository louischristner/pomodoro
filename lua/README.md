# Lua

Here is [Lua](https://www.lua.org/).
This program was written with Lua 5.3.5.

## Run

At the repository root:
```
lua lua/pomodoro.lua
```

## Notes

- Lua has not any `sleep` or `wait` function, but there are some different ways to do one (C sleep call, libraries, ...). I decided to create this `sleep` function for two reasons: it doesn't need any extern library and it understand SIGINT signal (C sleep call doesn't).

- In `display_time`, the and-or statement used for minutes and seconds is an equivalent to ternary operator.