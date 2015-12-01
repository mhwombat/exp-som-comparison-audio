------------------------------------------------------------------------
-- |
-- Module      :  Util
-- Copyright   :  (c) Amy de Buitléir 2011-2015
-- License     :  BSD-style
-- Maintainer  :  amy@nualeargais.ie
-- Stability   :  experimental
-- Portability :  portable
--
-- Utility functions that don't fit anywhere else.
--
------------------------------------------------------------------------
module Util where

import Control.Monad (forM_)
import Control.Monad.Random (evalRand, mkStdGen, Rand, RandomGen, getRandomRs)
import Data.Array.ST (runSTArray)
import Data.Function
import Data.List (maximumBy, group, sort, groupBy, sortBy)
import GHC.Arr (elems, listArray, readSTArray, thawSTArray, writeSTArray)
import Pattern
import Math.Geometry.Grid.Square
import System.Directory
import System.FilePath.Posix (takeFileName)

-- | From <http://www.haskell.org/haskellwiki/Random_shuffle>
shuffle :: RandomGen g => [a] -> Rand g [a]
shuffle xs = do
  let l = length xs
  rands <- take l `fmap` getRandomRs (0, l-1)
  let ar = runSTArray $ do
           ar' <- thawSTArray $ listArray (0, l-1) xs
           forM_ (zip [0..(l-1)] rands) $ \(i, j) -> do
               vi <- readSTArray ar' i
               vj <- readSTArray ar' j
               writeSTArray ar' j vi
               writeSTArray ar' i vj
           return ar'
  return (elems ar)

readDirAndShuffle :: FilePath -> IO [FilePath]
readDirAndShuffle d = do
  let g = mkStdGen 263167 -- seed
  files <- map (d ++) . drop 2 <$> getDirectoryContents d
  return $ evalRand (shuffle files) g

readSamples :: FilePath -> IO [(FilePath, Audio)]
readSamples dir = do
  files <- readDirAndShuffle dir
  mapM readOneSample files

readOneSample :: FilePath -> IO (FilePath, Audio)
readOneSample f = do
  img <- readAudio f 60
  return (takeFileName f, img)

putHtml :: String -> IO ()
putHtml s = putStr s 

putHtmlLn :: String -> IO ()
putHtmlLn s = putStrLn $ s ++ "<br/>"

trainingDir :: String
trainingDir = "/home/eamybut/TI46/HTK_MFCC_endpointed/TRAIN-RAW/"

testDir :: String
testDir = "/home/eamybut/TI46/HTK_MFCC_endpointed/TEST-RAW/"

type Numeral = Char

numeralStats :: [(Numeral, Bool)] -> [(String, Int, Int, Double)]
numeralStats xs = ("all",total,totalCorrect,fraction):xs'
  where xs' = map summarise . groupBy ((==) `on` fst) . sortBy (compare `on` fst) $ xs
        total = sum . map (\(_, x, _, _) -> x) $ xs'
        totalCorrect = sum . map (\(_, _, x, _) -> x) $ xs'
        fraction = fromIntegral totalCorrect / fromIntegral total

summarise :: [(Numeral, Bool)] -> (String, Int, Int, Double)
summarise xs = ([n], total, correct, fromIntegral correct / fromIntegral total)
  where correct = length $ filter snd xs
        total = length xs
        n = fst . head $ xs

mostCommon :: (Eq a, Ord a) => [a] -> a
mostCommon = fst . maximumBy (compare `on` snd) . map (\xs -> (head xs, length xs)) . group . sort

makeAnswerKey :: (Eq a, Ord a) => [(a, Numeral)] -> [(a, Numeral)]
makeAnswerKey = map (\(l,ns) -> (l, mostCommon ns))
                  . map (\xs -> (fst . head $ xs, map snd xs))
                  . groupBy ((==) `on` fst)
                  . sortBy (compare `on` fst)

countModelChanges :: (Eq a, Ord a) => [(a, Numeral)] -> [(a, Numeral)] -> (Int, Double)
countModelChanges xs ys = if length xs == length xs'
                            then (numChanges, fraction)
                            else error "length mismatch"
  where xs' = sortBy (compare `on` fst) xs
        ys' = sortBy (compare `on` fst) ys
        f (l1, n1) (l2, n2) | l1 /= l2   = error "label mismatch"
                            | n1 == n2  = 0
                            | otherwise = 1
        numChanges = sum $ zipWith f xs' ys'
        fraction = fromIntegral numChanges / fromIntegral (length xs)

safeLookup :: Eq a => a -> [(a, Numeral)] -> Numeral
safeLookup k vs = case lookup k vs of
                    Just v  -> v
                    Nothing -> 'X'

sosLearningFunction :: Double -> Double -> Double -> Int -> Double
sosLearningFunction r0 rf tf t = r0 * ((rf/r0)**a)
  where a = fromIntegral t / tf

-- somLearningFunction :: Int -> Double -> Double
-- somLearningFunction = decayingGaussian r0 rf w0 wf tf . fromIntegral

-- r0 :: Double
-- r0 = 1

-- rf :: Double
-- rf = 0.001

-- w0 :: Double
-- w0 = 3

-- wf :: Double
-- wf = 0.1

-- tf :: Double
-- tf = 1594

somGrid :: RectSquareGrid
-- somGrid = rectSquareGrid 10 10
somGrid = rectSquareGrid 32 32

sosSize :: Int
sosSize = 2000

-- threshold :: Double
-- threshold = 0.0005

