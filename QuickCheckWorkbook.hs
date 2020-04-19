import Test.QuickCheck
quickCheck ((\n->(abs(n) == n))::Int->Bool)
-- fixed
quickCheck ((\n->(abs(n) == n) || (0-abs(n) ==n))::Int->Bool)

import Data.List
quickCheck ((\l->((minimum l) == (sort l)!!0))::[Int]->Bool)
-- with empty lists
quickCheck ((\l->(if l==[] then True else (minimum l) == (sort l)!!0))::[Int]->Bool)

-- check for Strings
verboseCheck ((\l->(if l==[] then True else (minimum l) == (sort l)!!0))::[Char]->Bool)