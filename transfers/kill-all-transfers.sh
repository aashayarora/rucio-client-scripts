for pid in $(ps aux | grep $1 | awk '{print $2}'); do
kill -9 $pid;
done
rm log-*
