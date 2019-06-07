#!/bin/zsh
source ~/.zshrc
export GOOS=linux
rm -rf port-test
go build
docker build -t gcr.io/jianfeih-test/port-test:0601 .
docker push gcr.io/jianfeih-test/port-test:0601 
kubectl delete -f port-test.yaml
kubectl apply -f port-test.yaml
unset GOOS