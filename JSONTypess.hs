module JSONTypes (
        JValue(..),
        mkJPair,
        mkJObj
         )
    where

import Data.Map hiding ( map )

type JMap = Data.Map.Map String JValue
data JValue = JString String
            | JNumber Integer
            | JObject JMap
            | JArray [JValue]
            | JBool Bool
            | JNull 
    deriving (Show)

mkJPair k v = JObject (Data.Map.singleton k v)

mkJObj :: [JValue] -> JValue
mkJObj j_vals = 
    let
        list_of_maps = map (\(JObject pair) -> pair) j_vals
        combined_map = Data.Map.unions list_of_maps
    in
        JObject combined_map

json_parser :: Parser JValue
json_parser = do
        whiteSpace
        j_top <- ( json_array_parser <|> json_obj_parser)
        return j_top

json_array_parser :: Parser JValue
json_array_parser = do    
    j_vals <- brackets $ commaSep json_value_parser 
    return $ JArray j_vals

json_bool_parser = do
    bstr <- ( symbol "true" <|> symbol "false" )
    let
        bval = if bstr == "true" then True else False
    return $ JBool bval

json_value_parser = 
    json_array_parser <|> 
    json_obj_parser <|> 
    json_string_parser <|> 
    json_number_parser <|> 
    json_bool_parser <|> 
    json_null_parser
    
json_pair_parser = do
    k <- stringLiteral
    colon
    v <- json_value_parser
    return $ mkJPair k v 

-- The JSON object is a list of key-value pairs that can be accessed through the key. The Haskell equivalent is provided by Data.Map and implemented as a type alias JMap.
json_obj_parser :: Parser JValue
json_obj_parser = do
    j_vals <- braces $ commaSep json_pair_parser -- a list of pairs
    return $ mkJObj j_vals
