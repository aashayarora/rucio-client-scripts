RANUID=`cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 20; echo;`

ID=$1
echo "$ID" "$RANUID"
FROM="davs://origin-018.t2-sense.ultralight.org:1094//store/data/Run2018A/EGamma/MINIAOD/UL2018_MiniAODv2-v1/170000/testSourceFile$ID.root"
TO="davs://xrootd-sense-ucsd-redirector-111.sdsc.optiputer.net:1094//temp/store/data/Run2018A/EGamma/MINIAOD/UL2018_MiniAODv2-v1/170000/testDestFile$ID.root"
count=0
while [ $count -ne 1000 ]
do
  gfal-copy --just-copy --copy-mode pull -p -f $FROM $TO
  count=`expr $count + 1`
  echo $count
done
