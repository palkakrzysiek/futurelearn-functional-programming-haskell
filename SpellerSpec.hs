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

  describe "Speller.singleWordSpell" $ do
    it "returns an empty string for an empty input" $
      singleWordSpell "" `shouldBe` ""

    -- To be honest, one of the key reasons I picked this course is to find out why
    -- property-based testing is considered a Good Thing. I hear it constantly in the
    -- Scala word. I traced its origins back to the Haskell word. And to me it looks like
    -- duplicating the application logic in the test logic while not being able to see
    -- actual examples of what is being tested.
    it "spells out a letter for a single non-empty word" $
      forAll arbitraryPrintableString $ \word ->
        not (null word) ==> singleWordSpell word `shouldBe` head word : " is for " ++ word

  describe "Spleller.speller" $ do
    it "spells out a single word" $
      speller ["abacus"] `shouldBe` "a is for abacus"

    it "reutrns an empty string for an empty input" $
      speller [] `shouldBe` ""

    it "spells out multiple words" $
      speller ["apple", "banana", "coconut"] `shouldBe` "a is for apple, b is for banana, and c is for coconut"

    it "spells out words with non-latin characters" $
      speller ["whisky", "x-ray"] `shouldBe` "w is for whisky, and x is for x-ray"