END=$1
for i in $(seq 1 $END); do
  sh run-rucio.sh $i &> log-$dest-$i-$END &
done
