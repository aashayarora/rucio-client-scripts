#!/bin/bash

export KUBECONFIG='/home/users/aaarora/.kube/config.dev'
SOURCE_POD=$(kubectl get pods -n osg-gil | grep '02-400' | awk '{print $1}')

echo Using $SOURCE_POD as Source

for n_streams in 100 50; do #20 10 5; do
  echo RUNNING $n_streams TRANSFERS WITH 0ms DELAY $(date)
  ./gfal.sh $n_streams &
  sleep 120
  echo KILLING TRANSFERS $(date)
  ./kill.sh >> kills.log
  ./clean.sh >> clean.log
  sleep 180
done

#for delay in 10 60 120; do
#  echo ADDING ${delay}ms of Latency
#  kubectl exec $SOURCE_POD -- tc qdisc del dev net1 root
#  kubectl exec $SOURCE_POD -- tc qdisc add dev net1 root netem delay ${delay}ms
#  kubectl exec $SOURCE_POD -- tc qdisc show dev net1
#  for n_streams in 100 50 20 10 5; do
#    echo RUNNING $n_streams TRANSFERS WITH ${delay}ms DELAY $(date)
#    ./gfal.sh $n_streams &
#    sleep 180
#    echo KILLING TRANSFERS $(date)
#    ./kill.sh >> kills.log
#    ./clean.sh >> clean.log
#    sleep 120
#  done
#done
