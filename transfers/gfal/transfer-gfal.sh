END=$1
for i in $(seq 1 $END); do
  for dest in 01 012 017
  do
    echo $i;
    sh run-rucio.sh $i  01 &> log-$dest-$i-$END &
  done
done
