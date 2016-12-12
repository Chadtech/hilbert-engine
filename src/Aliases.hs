module Aliases (Project(..), Note, Voice) where

import Data.Int (Int16)


data Voice =
  Voice
  { noteMaker :: Note -> [ Int16 ]
  , lineMaker :: [ (Int, Note) ] -> (Note -> [ Int16 ]) -> [ Int16 ]
  }

data Note =
  Note
  { length :: Int 
  , volume :: Float
  , decay  :: Int
  , note   :: String
  } 

data Project = 
  Project 
  { name       :: String
  , voices     :: [ Voice ]
  , beatLength :: Int
  -- , timing     :: [ Int ]
  } 

