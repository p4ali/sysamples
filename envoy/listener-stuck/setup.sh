#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ENVOY_BIN="$HOME/workspace/github.com/envoyproxy/envoy/bazel-bin/source/exe/envoy-static"

fakesds() {
  echo 'fakesds'
  nc -l -p 9903
}

fakeserver() {
  echo 'fakeserver'
  nc -l -p 9902
}


startenvoy() {
  opt="${1:-ready.yaml}"
  cp $opt listeners-test.yaml
  ${ENVOY_BIN} -c config_not_warm.yaml \
    -l trace --service-node node --service-cluster cluster
}

check() {
  echo "Check config dump...."
  curl -s 127.0.0.1:9901/config_dump | jq -r ".configs[].dynamic_active_listeners[]? | .listener.address"
}

startsetup() {
  tmux split-window 'source setup.sh && fakesds'
  tmux split-window 'source setup.sh && fakeserver'
}
