len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

filt :: (a->Bool) -> [a] -> [a]
filt pred [] = []
filt pred (x:xs)
  | pred x = x : filt pred xs
  | otherwise = filt pred xs 
