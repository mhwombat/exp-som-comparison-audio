#!/bin/bash
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.0005 > audio-0005.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000475 > audio-000475.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.00045 > audio-00045.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000425 > audio-000425.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.0004 > audio-0004.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000375 > audio-000375.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.00035 > audio-00035.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000325 > audio-000325.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.0003 > audio-0003.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000275 > audio-000275.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.00025 > audio-00025.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000225 > audio-000225.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.0002 > audio-0002.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.00021 > audio-00021.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000175 > audio-000175.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.00015 > audio-00015.log 2>&1
# time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos 0.000125 > audio-000125.log 2>&1

function runit {
  echo $1 $2 $3 $4
  time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos $1 $2 $3 $4 > audio-$1-$2-$3-$4.log 2>&1
}

# runit 0.000405 1 0.1
# runit 0.00041 1 0.1
# runit 0.000415 1 0.1
# runit 0.000415 1 0.1 2
# runit 0.000415 1 0.1 4
# runit 0.00042 1 0.1
# runit 0.00043 1 0.1
# runit 0.00044 1 0.1

# runit 0.000425 1 0.1
# runit 0.000425 1 0.01
# runit 0.000425 1 0.001
# runit 0.000425 1 0.0001


# runit 0.0003 1 0.01 2
# runit 0.0004 1 0.1 2
# runit 0.0004 1 0.01 2
# runit 0.000415 1 0.01 2
# runit 0.000415 1 0.1 2
# runit 0.0005 1 0.1 2
# runit 0.0005 1 0.01 2
# runit 0.0006 1 0.1 2
# runit 0.0006 1 0.01 2

runit 3.0 1 0.001 1
runit 3.0 1 0.01 1
runit 3.0 1 0.1 1

runit 3.1 1 0.001 1
runit 3.1 1 0.01 1
runit 3.1 1 0.1 1

runit 3.2 1 0.001 1
runit 3.2 1 0.01 1
runit 3.2 1 0.1 1

runit 3.3 1 0.001 1
runit 3.3 1 0.01 1
runit 3.3 1 0.1 1

runit 3.4 1 0.001 1
runit 3.4 1 0.01 1
runit 3.4 1 0.1 1

runit 3.5 1 0.001 1
runit 3.5 1 0.01 1
runit 3.5 1 0.1 1

runit 3.6 1 0.001 1
runit 3.6 1 0.01 1
runit 3.6 1 0.1 1

runit 3.7 1 0.001 1
runit 3.7 1 0.01 1
runit 3.7 1 0.1 1

runit 3.8 1 0.001 1
runit 3.8 1 0.01 1
runit 3.8 1 0.1 1

runit 3.9 1 0.001 1
runit 3.9 1 0.01 1
runit 3.9 1 0.1 1

runit 4.0 1 0.001 1
runit 4.0 1 0.01 1
runit 4.0 1 0.1 1

runit 4.1 1 0.001 1
runit 4.1 1 0.01 1
runit 4.1 1 0.1 1

runit 4.2 1 0.001 1
runit 4.2 1 0.01 1
runit 4.2 1 0.1 1

runit 4.3 1 0.001 1
runit 4.3 1 0.01 1
runit 4.3 1 0.1 1

runit 4.4 1 0.001 1
runit 4.4 1 0.01 1
runit 4.4 1 0.1 1

runit 4.5 1 0.001 1
runit 4.5 1 0.01 1
runit 4.5 1 0.1 1

runit 4.6 1 0.001 1
runit 4.6 1 0.01 1
runit 4.6 1 0.1 1

runit 4.7 1 0.001 1
runit 4.7 1 0.01 1
runit 4.7 1 0.1 1

runit 4.8 1 0.001 1
runit 4.8 1 0.01 1
runit 4.8 1 0.1 1

runit 4.9 1 0.001 1
runit 4.9 1 0.01 1
runit 4.9 1 0.1 1

runit 5.0 1 0.001 1
runit 5.0 1 0.01 1
runit 5.0 1 0.1 1

runit 5.1 1 0.001 1
runit 5.1 1 0.01 1
runit 5.1 1 0.1 1

runit 5.2 1 0.001 1
runit 5.2 1 0.01 1
runit 5.2 1 0.1 1

runit 5.3 1 0.001 1
runit 5.3 1 0.01 1
runit 5.3 1 0.1 1

runit 5.4 1 0.001 1
runit 5.4 1 0.01 1
runit 5.4 1 0.1 1

runit 5.5 1 0.001 1
runit 5.5 1 0.01 1
runit 5.5 1 0.1 1

runit 5.6 1 0.001 1
runit 5.6 1 0.01 1
runit 5.6 1 0.1 1

runit 5.7 1 0.001 1
runit 5.7 1 0.01 1
runit 5.7 1 0.1 1

runit 5.8 1 0.001 1
runit 5.8 1 0.01 1
runit 5.8 1 0.1 1

runit 5.9 1 0.001 1
runit 5.9 1 0.01 1
runit 5.9 1 0.1 1





