-- make people noble
mknoble :: Bool -> String -> String
-- mknoble female name = (if female then "Dame " else "Sir ")
--                         ++ name
mknoble True name = "Dame " ++ name
mknoble False name = "Sir " ++ name