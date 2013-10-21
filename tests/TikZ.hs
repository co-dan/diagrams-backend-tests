module Main where

import System.Directory

import Diagrams.Tests
import Diagrams.Test.TikZ

main = do
   createDirectoryIfMissing False "tikz"
   runTests (examples) "tikz-index.html" $ [tikzTester]
