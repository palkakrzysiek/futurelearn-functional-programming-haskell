-- Q3
(\x -> (\y -> y x)) "x" (\y -> y)
(\ x y -> y x) "x" (\y -> y)
(\ x y -> y x) "x" (id)
(\ x -> id x) "x"
id "x"
"x"

-- Q4
(\x -> (\y -> x y)) "x" 
(\ x y -> x y) "x" -- type error, String is not a function

-- Q5
(\x f -> f x) 4 (\x -> x*x) 
(\f -> f 4) (\x -> x*x)
(\x -> x * x) 4
16