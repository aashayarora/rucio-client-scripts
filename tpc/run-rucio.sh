RANUID=`cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 20; echo;`

ID=$1
echo "$ID" "$RANUID"
FROM="davs://xrootd-sense-ucsd-01.sdsc.optiputer.net:1094//testSourceFile$ID"
TO="davs://xrootd-sense-ucsd-$2-112.sdsc.optiputer.net:1094//testDestFile$RANUID"
count=0
while [ $count -ne 1000 ]
do
  gfal-copy --just-copy --copy-mode pull -p -f $FROM $TO
  gfal-rm $TO
  count=`expr $count + 1`
  echo $count
done

