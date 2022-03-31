CC = x86_64-w64-mingw32-gcc
LD = x86_64-w64-mingw32-ld
WASMTIME_DIR = wasmtime-v0.35.1-x86_64-mingw-c-api
CFLAGS = -I$(WASMTIME_DIR)/include -DWASM_API_EXTERN=
LDFLAGS = -L$(WASMTIME_DIR)/lib -luserenv -lole32 -lntdll -lws2_32 -lkernel32 -lbcrypt

wasmplay: ./out/dynamic/wasmplay ./out/dynamic/wasmtime.dll
wasmplay-static: ./out/static/wasmplay

.PHONY: clean
clean:
	rm -rf ./out

./out/dynamic/wasmplay: main.c
	mkdir -p ./out/dynamic
	$(CC) $(CFLAGS) main.c -lwasmtime -o $@ $(LDFLAGS)

./out/dynamic/wasmtime.dll: $(WASMTIME_DIR)/lib/wasmtime.dll
	mkdir -p ./out/dynamic
	cp $^ $@

./out/static/wasmplay: main.c
	mkdir -p ./out/static
	$(CC) $(CFLAGS) main.c -static -lwasmtime -o $@ $(LDFLAGS)
