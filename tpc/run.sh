#!/bin/bash

for n_streams in 100 50 20 10 1; do
  sh ./gfal.sh $n_streams &
  sleep 300
  sh kill.sh
  sleep 60
  sh clean.sh
done
