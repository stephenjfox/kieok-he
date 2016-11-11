module Main where

import           User

main :: IO ()
main = do
  putStrLn "Hello, 기억해!"
  print $ Fetch "cat"
  print $ Put "cat" "fiddle"
