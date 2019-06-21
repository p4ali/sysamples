# Networking Tools

## nc server and client

```bash
# list
nc -l 8080

# separate window, type something
nc 8080
```

port scanning

```bash
# server
nc -l 8080
# client
nc -zv 127.0.0.1 8080
nc -zv 127.0.0.1 8081 # failed.
```

[More examples](https://kapeli.com/cheat_sheets/Netcat.docset/Contents/Resources/Documents/index)

## tcpdump

- [hackertarget, tcpdump example](https://hackertarget.com/tcpdump-examples/)
