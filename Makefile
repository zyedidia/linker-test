all: main libadd.so

libadd.so: add.c link.ld symbols.map.txt libc.a
	clang -fuse-ld=lld -shared add.c -O2 -o $@ -nostdlib libc.a -Wl,--version-script=symbols.map.txt

main: main.c libadd.so
	clang -fuse-ld=lld main.c -o $@ -O2

clean:
	rm -f main libadd.so

.PHONY: all clean
