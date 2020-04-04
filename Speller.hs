module Speller where

singleWordSpell :: String -> String
singleWordSpell [] = []
-- more pattern matching http://learnyouahaskell.com/syntax-in-functions
-- similar to Scala, by the way :)
singleWordSpell word@(firstLetter:_) = firstLetter : " is for " ++ word

combine :: [a] -> [a] -> [[a]] -> [a]
combine middle last [] = [] 
combine middle last [x] = x
combine middle last [x1, x2] =  x1 ++ last ++ x2
combine middle last (x : xs) =  x ++ middle ++ combine middle last xs

speller :: [String] -> String
speller = combine ", " ", and " . map singleWordSpell
