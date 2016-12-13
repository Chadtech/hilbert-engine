module HandleCommands where

import qualified Data.ByteString as Byte (readFile, ByteString)
import qualified Data.ByteString.Char8 as Char
import Data.Int (Int16)
import Prelude hiding (map, foldr, writeFile, concat)
import Flow
import System.Process (callCommand)
import Data.List (map, head)
import Data.List.Split (splitOn)
import Util (say, newLine)
import Aliases 


separator :: IO ()
separator =
  putStrLn "********************"


enterCommand :: String -> IO ()
enterCommand projectName = do
  separator
  separator
  putStrLn projectName
  putStrLn "Enter Command"
  separator
  separator
  newLine


await :: Project -> IO ()
await project = do
  enterCommand (name project)
  command <- Prelude.getLine
  handleCommand project command
  await project


formatCommand :: String -> [ String ]
formatCommand =
  splitOn " "


getAudioFileName :: String -> String
getAudioFileName projectName =
  projectName ++ ".wav"


play :: String -> IO ()
play str = do
  say "playing"
  callCommand ("play " ++ str)
  newLine


build :: [ String ] -> IO ()
build commandParts = do
  putStrLn "-- BUILDING"
  say "building"
  newLine


notRecognized :: IO ()
notRecognized = do
  putStrLn "-- Not recognized"
  say "not recognized"
  newLine


handleCommand :: Project -> String -> IO ()
handleCommand project cmd =
  let parts = formatCommand cmd in
  case head parts of

    "build" -> 
      build parts

    "play" ->
      project
      |>name
      |>getAudioFileName
      |>play 

    _ ->
      notRecognized

