#!/bin/bash

function runit {
  echo $1 $2 $3 $4 $5
  time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos $1 $2 $3 $4 $5 > audio-$1-$2-$3-$4-$5.log 2>&1
}

runit 0.0002 0.1 0.0001 1 30
runit 0.0003 0.1 0.0001 1 30
runit 0.0004 0.1 0.0001 1 30
runit 0.0005 0.1 0.0001 1 30
runit 0.0006 0.1 0.0001 1 30
runit 0.0007 0.1 0.0001 1 30
