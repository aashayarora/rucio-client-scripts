for pid in $(ps aux | grep run-rucio | awk '{print $2}'); do
kill -9 $pid;
done
for pid in $(ps aux | grep gfal-copy | awk '{print $2}'); do
kill -9 $pid;
done
