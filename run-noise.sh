#!/bin/bash

trainingDir=/home/eamybut/TI46/HTK_MFCC_not_endpointed/TRAIN-RAW/
testBase=/home/eamybut/TI46/NOISY_TEST

function runit {
  testDir=${testBase}/$6/
  echo $1 $2 $3 $4 $5 $6
  time (/home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos $1 $2 $3 $4 $5 $trainingDir $testDir) > audio-$1-$2-$3-$4-$5-$6.log 2>&1
}

runit 0.00018 0.1 0.001 1 159 N1_SNR-5-RAW
runit 0.00018 0.1 0.001 1 159 N1_SNR0-RAW
runit 0.00018 0.1 0.001 1 159 N1_SNR5-RAW
runit 0.00018 0.1 0.001 1 159 N1_SNR10-RAW
runit 0.00018 0.1 0.001 1 159 N1_SNR15-RAW
runit 0.00018 0.1 0.001 1 159 N1_SNR20-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR-5-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR0-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR5-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR10-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR15-RAW
runit 0.00018 0.1 0.001 1 159 N2_SNR20-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR-5-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR0-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR5-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR10-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR15-RAW
runit 0.00018 0.1 0.001 1 159 N3_SNR20-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR-5-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR0-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR5-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR10-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR15-RAW
runit 0.00018 0.1 0.001 1 159 N4_SNR20-RAW
