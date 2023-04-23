import System.Random
import Text.Read

game_loop :: Int -> IO ()
game_loop answer = do
   n <- getLine
   case readMaybe n :: Maybe Int of
      Just guess -> case compare guess answer of
            LT -> putStrLn "Too low" >> game_loop answer
            GT -> putStrLn "Too high" >> game_loop answer
            otherwise -> putStrLn "That's it"
      Nothing -> putStrLn "Must be a number" >> game_loop answer

main = do
   n <- (randomIO :: IO Int)
   putStrLn "Guess a number between 1-100." >> game_loop (mod n 100)
