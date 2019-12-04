# Haskell

Here is [Haskell](https://www.haskell.org/).
This program was written using The Glorious Glasgow Haskell Compilation System, version 8.6.5.

## Run

At the repository root:
```
ghc -o pomodoro haskell/pomodoro.hs
./pomodoro
```

## Notes

- This time no `for` or `while` loop but recursive function. The infinite loop is simulated by the loop function which called itself without ending condition.

- pause and run functions have each additional definitions which are ending conditions.

- The `threadDelay` keyword come from the Control.Concurrent import.

- The `callCommand` keyword come from the System.Process import.
