------------------------------------------------------------------------
-- |
-- Module      :  ALife.Creatur.Wain.Audio.Pattern
-- Copyright   :  (c) Amy de Buitléir 2012-2015
-- License     :  BSD-style
-- Maintainer  :  amy@nualeargais.ie
-- Stability   :  experimental
-- Portability :  portable
--
-- Audio utilities.
--
------------------------------------------------------------------------
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeFamilies #-}
module Pattern
  (
    Audio(..),
    mkAudio,
    audioDiff,
    makeAudioSimilar,
    audioValueRange,
    randomAudio,
    readAudio,
    valid,
    invalid,
    norm,
    toRawData
  ) where

import Control.Monad.Random (Rand, RandomGen, getRandomRs)
import Data.Datamining.Pattern (adjustVector, euclideanDistanceSquared)
import Data.List (minimumBy)
import Data.Ord (comparing)
import GHC.Generics (Generic)

-- | The range within which each number of an audio sample is
--   guaranteed to fall.
audioValueRange :: (Double,Double)
audioValueRange = (-100,100)

maxAudioValueDiffSquared :: Double
maxAudioValueDiffSquared = (b-a)*(b-a)
  where (b,a) = audioValueRange

data Audio = Audio Int [Double]
  deriving (Eq, Show, Generic)

mkAudio :: [Double] -> Audio
mkAudio xs = Audio (length xs) xs

toRawData :: Audio -> [Double]
toRawData (Audio _ xs) = xs

audioDiff :: Audio -> Audio -> Double
audioDiff (Audio n xs) (Audio m ys)
    | n /= m     = error "length mismatch between audio patterns"
    | n == 0    = 0
    | otherwise = (euclideanDistanceSquared xs ys)/z
    where z = fromIntegral n * maxAudioValueDiffSquared
    -- scaled so that the difference is betwen 0 and 1.

makeAudioSimilar :: Audio -> Double -> Audio -> Audio
makeAudioSimilar (Audio n xs) r (Audio m ys) =
    if n == m
      then mkAudio $ adjustVector xs r ys
      else error "length mismatch between audio patterns"

-- Used for generating the initial brain models in the initial
-- population.
-- | Generates an audio vector of the specified length.
randomAudio :: RandomGen r => Int -> Rand r Audio
randomAudio n
  = fmap (Audio n . take n) (getRandomRs audioValueRange)

readAudio :: FilePath -> Int -> IO Audio
readAudio filePath desiredVectorCount = do
  raw <- readFile filePath
  -- Each line in the text file contains one vector
  let vectors = map stringToVector $ lines raw
  let result = selectFrames vectors desiredVectorCount
  case result of
    Left msg     -> error $ "Problem with " ++ filePath ++ ": " ++ msg
    Right sample -> return . mkAudio $ concat sample

stringToVector :: String -> [Double]
stringToVector s = map read $ words s

valid :: Audio -> Bool
valid (Audio _ xs) = all (inRange audioValueRange) xs

invalid :: Audio -> Bool
invalid = not . valid

norm :: Floating a => [a] -> a
norm xs = sqrt $ sum (map f xs)
  where f x = x*x

selectFrames :: [[Double]] -> Int -> Either String [[Double]]
selectFrames xs n
  | l < n     = stretch xs n
  | l > n     = dropSmallestChanges xs (l-n)
  | otherwise = Right xs
  where l = length xs

dropSmallestChanges :: [[Double]] -> Int -> Either String [[Double]]
dropSmallestChanges (x:xs) n = Right (x:xs')
  where xs' = map snd . dropSmallestChanges' n $ dxs
        dxs = diffs (x:xs)
dropSmallestChanges [] _ = Left "zero-length vector"

dropSmallestChanges' :: Int -> [(Double, [Double])] -> [(Double, [Double])]
dropSmallestChanges' 0 xs = xs
dropSmallestChanges' n xs = dropSmallestChanges' (n-1) xs'
  where x = minimumBy (comparing fst) xs
        xs' = dropFirstOccurrence x xs
  
  
diffs :: [[Double]] -> [(Double, [Double])]
diffs (v1:v2:vs) = (euclideanDistanceSquared v1 v2, v2) : diffs (v2:vs)
diffs [_] = []
diffs [] = []

dropFirstOccurrence :: Eq a => a -> [a] -> [a]
dropFirstOccurrence x (y:ys)
  = if y == x then ys else y : dropFirstOccurrence x ys
dropFirstOccurrence _ [] = []

inRange :: Ord c => (c, c) -> c -> Bool
inRange (a,b) c = c >= a && c <= b

stretch :: [a] -> Int -> Either String [a]
stretch xs n
  | null xs         = Left "can't stretch an empty string"
  | n < length xs   = Left "sequence too long" -- or, take n xs
  | n <= 2*length xs = Right (stretch' xs n)
  | otherwise       = stretch (double xs) n

stretch' :: [a] -> Int -> [a]
stretch' xs n = concat $ y:(map dupFirst ys)
  where dupCount = n - length xs
        (y:ys) = pieces (dupCount + 1) xs
        dupFirst (z:zs) = z:z:zs
        dupFirst [] = []

pieces :: Int -> [a] -> [[a]]
pieces n xs = if n > 0
                 then ys : (pieces (n-1) zs)
                 else []
  where (ys,zs) = splitAt k xs
        k = length xs `div` n


double :: [a] -> [a]
double [] = []
double (a:as) = a:a:double as
