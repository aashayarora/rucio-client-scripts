#!/bin/bash

RANGE=$1
for i in `seq 1 $RANGE`
do
  sh run-rucio.sh $i & &> log-$i.txt
done
