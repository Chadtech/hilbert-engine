module Main where

import qualified Data.ByteString as Byte (readFile, ByteString)
import qualified Data.ByteString.Char8 as Char
import Data.Int (Int16)
import Prelude hiding (map, foldr, writeFile, concat)
import Flow
import Data.List (map)
import Aliases 
import HandleCommands (await)
import Util (say, newLine)


main :: IO ()
main = do
  projectData <- Byte.readFile projectFile
  let projectLines = loadProject projectData
  ready
  await dummyProjet


ready :: IO ()
ready = do
  _ <- say "ready"
  newLine
  putStrLn "Ready"
  newLine


dummyProjet :: Project
dummyProjet =
  Project 
  { name       = "alternation-piece-11"
  , voices     = [] 
  , beatLength = 5000
  }


loadProject :: Byte.ByteString -> [ String ]
loadProject projectData = 
  projectData
  |>Char.split '\n'
  |>map Char.unpack
  

scoreRoot :: String
scoreRoot =
  "./score"


projectFile :: String
projectFile = 
  "./project.project"
