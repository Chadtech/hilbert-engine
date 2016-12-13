module Util where

import System.Process (readProcess)


say :: String -> IO String
say str = do
  -- content <- readProcess "osascript -e" [ "\"set volume 2\"" ] ""
  -- putStrLn ("WHAT " ++ content)
  readProcess "say" [ str ] ""
  -- readProcess "osascript" [ "-e", "\"set volume 5\"" ] ""



newLine :: IO ()
newLine =
  putStrLn ""