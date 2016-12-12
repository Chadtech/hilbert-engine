module HandleCommands where

import qualified Data.ByteString as Byte (readFile, ByteString)
import qualified Data.ByteString.Char8 as Char
import Data.Int (Int16)
import Prelude hiding (map, foldr, writeFile, concat)
import Flow
import System.Process (readProcess)
import Data.List (map, head)
import Data.List.Split (splitOn)
import Aliases 


say :: String -> IO String
say str = do
  readProcess "say" [ str ] ""


newLine :: IO ()
newLine =
  putStrLn ""


await :: Project -> IO ()
await project = do
  putStrLn "**************"
  putStrLn "Enter Command"
  putStrLn "**************"
  newLine
  command <- Prelude.getLine

  handleCommand project command

  await project


formatCommand :: String -> [ String ]
formatCommand =
  splitOn " "


play :: String -> IO ()
play str = do
  _ <- say "playing"
  _ <- readProcess "play" [ str ] ""
  newLine


build :: IO ()
build = do
  putStrLn "-- BUILDING"
  _ <- say "building"
  newLine


notRecognized :: IO ()
notRecognized = do
  putStrLn "-- Not recognized"
  _ <- say "not recognized"
  newLine


handleCommand :: Project -> String -> IO ()
handleCommand project cmd =
  let parts = formatCommand cmd in
  case head parts of
    "build" -> 
      build
    "play" ->
      play "alternation-piece-11.wav"
    _ ->
      notRecognized

