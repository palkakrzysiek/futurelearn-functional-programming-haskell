module Speller where

import Data.List

singleWordSpell :: [Char] -> [Char]
singleWordSpell [] = []
-- more pattern matching http://learnyouahaskell.com/syntax-in-functions
-- similar to Scala, by the way :)
singleWordSpell word@(firstLetter:_) = firstLetter : " is for " ++ word

speller :: [[Char]] -> [Char]
-- Such a common functionality must have been already implemented.
-- It looks better than explict foldR IMHO
speller = intercalate ", " . map singleWordSpell
