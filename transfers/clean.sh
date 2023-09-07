#!/bin/bash

for fname in $(gfal-ls davs://xrootd-sense-ucsd-01-112.sdsc.optiputer.net:1094// | grep testDestFile); do 
  gfal-rm davs://xrootd-sense-ucsd-01-112.sdsc.optiputer.net:1094//$fname &
done
