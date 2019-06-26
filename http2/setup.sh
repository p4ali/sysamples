startserver() {
  go get github.com/GoogleChrome/simplehttp2server
  simplehttp2server
}

sendreq() {
  mkdir -p $HOME/tmp
  export SSLKEYLOGFILE="$HOME/tmp/ssl-key-log.txt"
  curl --http2 --insecure -I https://localhost:5000
  sleep 3
}

capture() {
  sudo tshark -i lo -f "port 5000" -w - > ~/tmp/tshark.pcap
}
