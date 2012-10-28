module Main where

import Diagrams.Backend.Cairo
import Diagrams.Backend.Cairo.Internal
import Diagrams.Prelude hiding (D)
import Diagrams.Tests
import System.Directory
import Text.Html as H

main = do
   -- all output is put into the cairo directory
   createDirectoryIfMissing False prefix
   -- and run the tests to generate the cairo examples
   runTests (examples) "cairo-index.html" $ [("cairo", \ (Test nm dig) -> do
     fst $ renderDia Cairo (CairoOptions
                           (name nm)
			   (Dims 200 200)
			   PNG)
                           dig
     return
	 $ H.image ! [ src (name nm) ]
     )]
  where
     name nm = prefix ++ "/" ++ nm ++ ".png"
     prefix = "cairo"
