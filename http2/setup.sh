startserver() {
  go get github.com/GoogleChrome/simplehttp2server
  simplehttp2server
}

sendreq() {
  for i in `seq 1 10000`
  do
    curl --insecure -I https://localhost:5000
    sleep 3
  done
}
