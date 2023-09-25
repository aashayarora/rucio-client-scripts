#!/bin/bash

for fname in $(gfal-ls davs://xrootd-sense-ucsd-01-112.sdsc.optiputer.net:1094/); do 
  gfal-rm -r davs://xrootd-sense-ucsd-01-112.sdsc.optiputer.net:1094//$fname &
done

for fname in $(gfal-ls davs://xrootd-sense-ucsd-02-112.sdsc.optiputer.net:1094/); do 
  gfal-rm -r davs://xrootd-sense-ucsd-02-112.sdsc.optiputer.net:1094//$fname &
done
