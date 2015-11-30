------------------------------------------------------------------------
-- |
-- Module      :  SOSMain
-- Copyright   :  (c) Amy de Buitléir 2015
-- License     :  BSD-style
-- Maintainer  :  amy@nualeargais.ie
-- Stability   :  experimental
-- Portability :  portable
--
-- Learning demo.
--
------------------------------------------------------------------------
module Main where

import Pattern
import Control.Monad (foldM)
import Data.Datamining.Clustering.SOS
import Data.Word(Word16)
import Util
import System.Environment (getArgs)

type Label = Word16
type ClassifierType = SOS Int Double Label Audio

testClassifier :: Double -> Double -> Double -> Double -> ClassifierType 
testClassifier threshold r0 rf tf = makeSOS (sosLearningFunction r0 rf tf) sosSize threshold False audioDiff makeAudioSimilar

trainOne :: (ClassifierType, [(Label,Numeral)], [(Label, Numeral)]) -> (FilePath, Audio) -> IO (ClassifierType, [(Label, Numeral)], [(Label, Numeral)])
trainOne (c, modelCreationData, stats) (f, p) = do
  let c' = train c p
  let (bmu, _, _, _)  = classify c' p
  let numeral = f !! 1
  putStrLn $ f ++ "," ++ numeral : "," ++ show bmu
  let modelCreationData' = case lookup bmu modelCreationData of
                             Just _  -> modelCreationData
                             Nothing -> (bmu, numeral):modelCreationData
  return (c', modelCreationData', (bmu, numeral):stats)

testOne :: [(Label, Numeral)] -> ClassifierType -> [(Numeral, Bool)] -> (FilePath, Audio) -> IO [(Numeral, Bool)]
testOne key c stats (f, p) = do
  let (bmu, _, _, _)  = classify c p
  let numeral = f !! 1
  let answer = safeLookup bmu key
  let correct = answer == numeral
  putStrLn $ f ++ "," ++ numeral : "," ++ show bmu ++ "," ++ show answer ++ "," ++ show correct
  return $ (numeral, correct):stats

main :: IO ()
main = do
  args <- getArgs
  let threshold  = read $ args !! 0
  let r0  = read $ args !! 1
  let rf  = read $ args !! 2
  let passes  = read $ args !! 3
  putStrLn "====="
  putStrLn "Training"
  putStrLn "====="
  trainingSamples <- concat . replicate passes <$> readSamples trainingDir
  putStrLn "filename,numeral,label"
  let tf = fromIntegral (1594 * passes)
  (trainedClassifier, modelCreationData, stats) <- foldM trainOne (testClassifier threshold r0 rf tf, [], []) trainingSamples
  let answers = makeAnswerKey stats
  putStrLn ""
  putStrLn "====="
  putStrLn "Answer Key"
  putStrLn "====="
  mapM_ (putStrLn . show) answers
  testSamples <- readSamples testDir
  putStrLn ""
  putStrLn "====="
  putStrLn "Testing"
  putStrLn "====="
  putStrLn "filename,numeral,label,answer,correct"
  stats2 <- foldM (testOne answers trainedClassifier) [] testSamples
  putStrLn ""
  putStrLn "====="
  putStrLn "Summary"
  putStrLn "====="
  putStrLn $ "threshold=" ++ show threshold
  putStrLn $ "r0=" ++ show r0
  putStrLn $ "rf=" ++ show rf
  putStrLn $ "number of models created: " ++ show (numModels trainedClassifier)
  let (numModelsChanged, fractionModelsChanged) = countModelChanges modelCreationData answers
  putStrLn $ "number of models changed: " ++ show numModelsChanged
  putStrLn $ "fraction models changed: " ++ show fractionModelsChanged
  putStrLn ""
  putStrLn "numeral,count,correct,accuracy"
  let stats3 = numeralStats stats2
  mapM_ (putStrLn . show) stats3
