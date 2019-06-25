# HTTP2 Playground

## Wireshark for HTTP2

Follow https://wiki.wireshark.org/HTTP2 to get some sense first.

- Start with http1.x, upgrade to 2.
- Different stream id, frame type, WINDOW_UPDATE, SETTINGS, HEADERS, etc.

## Basics, frame, stream, message

Observe frame, stream, message.

```bash
source setup.sh
install
curl --insecure -I https://localhost:5000
```

TODO: pcap is done, sshkellogfile is done, applied, not transformed to http2 protocol...
