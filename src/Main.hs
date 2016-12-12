module Main where

import qualified Data.ByteString as Byte (readFile, ByteString)
import qualified Data.ByteString.Char8 as Char
import Data.Int (Int16)
import Prelude hiding (map, foldr, writeFile, concat)
import Flow
import System.Process (readProcess)
import Data.List (map)
import Aliases 


say :: String -> IO String
say str = do
  readProcess "say" [ str ] ""


main :: IO ()
main = do
  projectData <- Byte.readFile projectFile
  let projectLines = loadProject projectData
  await dummyProjet


await :: Project -> IO ()
await project = do
  putStrLn "**************"
  putStrLn "Enter Command"
  putStrLn "**************"
  putStrLn ""
  command <- Prelude.getLine

  handleCommand project command
  await project


play :: String -> IO ()
play str = do
  _ <- say "playing"
  _ <- readProcess "play" [ str ] ""
  putStrLn ""

build :: IO ()
build = do
  putStrLn "-- BUILDING"
  _ <- say "building"
  putStrLn ""


notRecognized :: IO ()
notRecognized = do
  putStrLn "-- Not recognized"
  _ <- say "not recognized"
  putStrLn ""


handleCommand :: Project -> String -> IO ()
handleCommand project cmd =
  case cmd of
    "build" -> 
      build
    "play" ->
      play "doink"
    _ ->
      notRecognized


dummyProjet :: Project
dummyProjet =
  Project 
  { name       = "Calvin-Piece-0"
  , voices     = [] 
  , beatLength = 5000
  }


loadProject :: Byte.ByteString -> [ Byte.ByteString ]
loadProject projectData = 
  projectData
  |>Char.split '\n'
  

scoreRoot :: String
scoreRoot =
  "./score"

projectFile :: String
projectFile = 
  "./project.project"

askForChar :: String -> IO ()
askForChar "" = askForChar " [ none ] "
askForChar str = do
  let msg = "Enter String (prev : " ++ str ++ ") :"
  putStrLn msg
  enteredChar <- Prelude.getLine
  askForChar enteredChar