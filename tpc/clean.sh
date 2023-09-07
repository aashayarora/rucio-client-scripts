#!/bin/bash

for fname in $(gfal-ls davs://xrootd-sense-ucsd-01-112.sdsc.optiputer.net:1094//store/temp/); do 
  gfal-rm -r davs://xrootd-sense-ucsd-01.sdsc.optiputer.net:1094//store/temp/$fname &
done

