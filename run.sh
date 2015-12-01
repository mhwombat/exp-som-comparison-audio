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
  echo $1 $2 $3 $4 $5
  time /home/eamybut/nosync/sandboxes/exp-som-comparison-audio/bin/exp-som-comparison-audio-sos $1 $2 $3 $4 $5 > audio-$1-$2-$3-$4-$5.log 2>&1
}

runit 0.0002 0.1 0.0001 1 30
runit 0.0003 0.1 0.0001 1 30
runit 0.0004 0.1 0.0001 1 30
runit 0.0005 0.1 0.0001 1 30
runit 0.0006 0.1 0.0001 1 30
runit 0.0007 0.1 0.0001 1 30

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
# runit 0.000415 1 0.01 3
# runit 0.000415 0.8 0.01 3
# runit 0.000415 0.6 0.01 3
# runit 0.000415 0.4 0.01 3
# runit 0.000415 0.2 0.01 3
# runit 0.000415 0.1 0.01 3
# runit 0.000415 1 0.001 3
# runit 0.000415 1 0.0001 3
# runit 0.000415 1 0.0001 4
# runit 0.000415 1 0.0001 4
# runit 0.0005 1 0.1 2
# runit 0.0005 1 0.01 2
# runit 0.0006 1 0.1 2
# runit 0.0006 1 0.01 2

# runit 0.00020 1 0.001 1
# runit 0.00021 1 0.001 1
# runit 0.00022 1 0.001 1
# runit 0.00023 1 0.001 1
# runit 0.00024 1 0.001 1
# runit 0.00025 1 0.001 1
# runit 0.00026 1 0.001 1
# runit 0.00027 1 0.001 1
# runit 0.00028 1 0.001 1
# runit 0.00029 1 0.001 1
# runit 0.00030 1 0.001 1
# runit 0.00031 1 0.001 1
# runit 0.00032 1 0.001 1
# runit 0.00033 1 0.001 1
# runit 0.00034 1 0.001 1
# runit 0.00035 1 0.001 1
# runit 0.00036 1 0.001 1
# runit 0.00037 1 0.001 1
# runit 0.00038 1 0.001 1
# runit 0.00039 1 0.001 1
# runit 0.00040 1 0.001 1
# runit 0.00041 1 0.001 1
# runit 0.00042 1 0.001 1
# runit 0.00043 1 0.001 1
# runit 0.00044 1 0.001 1
# runit 0.00045 1 0.001 1
# runit 0.00046 1 0.001 1
# runit 0.00047 1 0.001 1
# runit 0.00048 1 0.001 1
# runit 0.00049 1 0.001 1
# runit 0.00050 1 0.001 1
# runit 0.00051 1 0.001 1
# runit 0.00052 1 0.001 1
# runit 0.00053 1 0.001 1
# runit 0.00054 1 0.001 1
# runit 0.00055 1 0.001 1
# runit 0.00056 1 0.001 1
# runit 0.00057 1 0.001 1
# runit 0.00058 1 0.001 1
# runit 0.00059 1 0.001 1
