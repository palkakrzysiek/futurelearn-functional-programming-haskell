module SpellerSpec where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Speller

-- stack install hspec

-- https://stackoverflow.com/a/48906690
arbitraryPrintableString :: Gen String
arbitraryPrintableString = getPrintableString <$> arbitrary


main :: IO ()
main = hspec $ do

  let nonEmpty = \xs -> length xs > 0

  describe "Speller.singleWordSpell" $ do
    it "returns an empty string for an empty input" $ do
      singleWordSpell "" `shouldBe` ""

    it "spells out a letter for a single non-empty word" $ do
      forAll arbitraryPrintableString $ \word ->
        nonEmpty word ==> singleWordSpell word `shouldBe` head word : " is for " ++ word

  describe "Spleller.speller" $ do
    it "spells out a single word" $ do
      speller ["abacus"] `shouldBe` "a is for abacus"

    it "reutrns an empty string for an empty input" $ do
      speller [] `shouldBe` ""

    it "spells out multiple words" $ do
      speller ["apple", "banana", "coconut"] `shouldBe` "a is for apple, b is for banana, and c is for coconut"

    it "spells out words with non-latin characters" $ do
      speller ["whisky", "x-ray"] `shouldBe` "w is for whisky, and x is for x-ray"