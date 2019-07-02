#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ENVOY_BIN="$HOME/workspace/github.com/envoyproxy/envoy/bazel-bin/source/exe/envoy-static"

#copyconfig() {
  #rm -rf /tmp/envoy
  #mkdir -p /tmp/envoy
  #ln ./config_not_warm.yaml /tmp/envoy/config_not_warming.yaml
  #ln ./listeners-1-ready.yaml /tmp/envoy/
  #ln ./listeners-2-sds.yaml /tmp/envoy/
  ## ln $DIR/listen /tmp/envoy/listeners_not_warming.yaml
#}

fakeserver() {
  nc -l -p 9903
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
