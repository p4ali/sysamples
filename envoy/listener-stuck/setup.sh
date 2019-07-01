DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
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
  ${ENVOUY_BIN} -c /tmp/envoy/config_not_warming.yaml \
    -l trace --service-node node --service-cluster cluster
}

