import Text.ParserCombinators.Parsec

yinYang :: Parser String

yinYang = try (string "yin") <|> string "yang"

-- yinYang = string "yin" <|> string "yang"
-- parseTest yinYang "yang"
-- unexpected "a"
-- expecting "yin"