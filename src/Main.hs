module Main where

import           User
import System.Environment (getArgs)


main :: IO ()
main = do
  putStrLn "Hello, 기억해!"
  getArgs >>= parseInputArguments >>= print
