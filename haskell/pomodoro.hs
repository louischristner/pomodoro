module Main where

import Control.Concurrent
import System.Process


clear_terminal :: IO ()
clear_terminal = callCommand "clear"


display_time :: Integer -> String
display_time x =
  let
    mdiv = x `div` 60
    mmod = x `mod` 60
    minutes = if mdiv < 10 then "0" ++ show mdiv else show mdiv
    seconds = if mmod < 10 then "0" ++ show mmod else show mmod
  in
    minutes ++ ":" ++ seconds


run :: Integer -> IO ()
run 1500 = return ()
run x =
  do
    clear_terminal
    putStrLn "Pomodoro (25 minutes):"
    putStrLn (display_time x)
    threadDelay 1000000
    run (x + 1)


pause :: Integer -> Integer -> IO ()
pause 5 300 = return ()
pause 15 900 = return ()
pause duration x =
  do
    clear_terminal
    putStrLn ("Pause (" ++ show duration ++ " minutes):")
    putStrLn (display_time x)
    threadDelay 1000000
    pause duration (x + 1)


loop :: Integer -> IO Integer
loop count =
  do
    run 0
    if count `mod` 4 == 0
      then pause 15 0
      else pause 5 0
    loop (count + 1)


main :: IO Integer
main =
  do
    loop 1
