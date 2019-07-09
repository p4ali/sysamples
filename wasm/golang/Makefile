serve: hello.wasm
	goexec 'http.ListenAndServe(":8080", http.FileServer(http.Dir(".")))'

hello.wasm: hello.go
	GOOS=js GOARCH=wasm go build -o hello.wasm

clean:
	rm -rf *.wasm
