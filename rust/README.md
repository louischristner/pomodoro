# Rust

Here is [Rust](https://www.rust-lang.org/).
This program was written with Rust 1.39.0.

## Run

At the repository root:
```
rustc rust/pomodoro.rs
./pomodoro
```

## Notes

- The `loop` keyword is the equivalent to `while true`.

- A function that return nothing returns in fact an empty tuple `()` (but you don't need to specify it);

- In Rust a variable (defined with `let`) is immutable by default. If you want to be able to mutate it you need to add `mut` keyword after `let`.

- In display_time() function println! forces variables to display at least two digits with `:02`.
