data SimpleNum = One | Two | Many deriving Show

convert :: Int -> SimpleNum
convert 1 = One
convert 2 = Two
convert _ = Many

data CricketScore = String Int Int deriving Show

-- x = CricketScore "New Zealand" 350 4