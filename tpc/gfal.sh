START=$1
END=$2
for i in $(seq $START $END); do
  sh run-rucio.sh $i $3 &> logs/log-$i-$END &
done
#for i in $(seq $((END/4+1)) $((END/2))); do
#  sh run-rucio.sh $i 02 &> logs/log-$i-$END &
#done
#for i in $(seq $((END/2+1)) $((3*END/4))); do
#  sh run-rucio.sh $i 03 &> logs/log-$i-$END &
#done
#for i in $(seq $((3*END/4+1)) $END); do
#  sh run-rucio.sh $i 04 &> logs/log-$i-$END &
#done
