module Util where

import System.Process (callCommand)


say :: String -> IO ()
say str = do
  callCommand "osascript -e \"set volume 2\" "
  callCommand ("say " ++ str)
  callCommand "osascript -e \"set volume 4\" "

  -- putStrLn ("WHAT " ++ content)
  -- readProcess "osascript" [ "-e", "\"set volume 5\"" ] ""



newLine :: IO ()
newLine =
  putStrLn ""