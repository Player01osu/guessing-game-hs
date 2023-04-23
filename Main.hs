import System.Random
import Text.Read

game_loop :: Int -> String -> IO ()
game_loop answer response = do
   putStrLn response
   n <- getLine
   case readMaybe n :: Maybe Int of
      Just guess -> case compare guess answer of
            LT -> game_loop answer "Too low"
            GT -> game_loop answer "Too high"
            otherwise -> putStrLn "That's it"
      Nothing -> game_loop answer "Must be a number"

main = do
   n <- (randomIO :: IO Int)
   game_loop (mod n 100) "Guess a number between 1-100."
