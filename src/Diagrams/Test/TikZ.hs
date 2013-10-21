module Diagrams.Test.TikZ (tikzTester) where

import Diagrams.Backend.TikZ
import Diagrams.Prelude hiding ((<.>))
import Diagrams.Tests
import System.FilePath ((</>), (<.>))
import System.Process
import Text.Html as H hiding ((</>))

tikzTester :: (String, Test -> IO Html)
tikzTester =
  ( "tikz"
  , \ (Test nm dig) -> do
      renderTikZ (name nm "tex") (Dims 8 8) previewSurface dig
      rawSystem "pdflatex" ["--output-directory" , "tikz", name nm "tex"]
      rawSystem "convert" [name nm "pdf", name nm "png"]
      return $ H.image ! [ src (name nm "png") ]
  )
 where
  name nm ext = prefix </> nm <.> ext
  prefix = "tikz"
