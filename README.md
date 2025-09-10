# Motivation

For better tooling integration, we want LFI-compiled libraries to be loaded by the host dynamic linker, rather than manually loaded by the LFI runtime. The main benefit is that the host dynamic linker automatically registers the library's debug information with debuggers.

# Issues

The LFI-compiled library must statically contain all of its dependencies (including libc). Normally we achieve this by compiling the library into a static-pie executable. However, a static-pie executable cannot be loaded by the host dynamic linker, since it only allows loading shared objects [1]. There the sandbox must be a shared object with all dependencies statically linked.

The shared object must also have proper protections on segments (no writable+executable segments) and must have a sufficiently large (80KiB) guard segment at the start, and a segment at the end that reserves all remaining memory up to the 4GiB end of the sandbox, ensuring that `mmap` does not use the sandbox heap for other purposes (e.g., the host memory allocator). These regions should be loaded with `PROT_NONE` protections.

[1] https://stackoverflow.com/questions/59074126/loading-executable-or-executing-a-library

# Commands

Run `make` to build `libadd.so` (example `add` function statically linked with `libc.a`), and `main`, which is a program that uses dlopen to open the add library and call the add function. Currently, if `libc.a` is statically linked into the `.so` this combination of commands causes `dlopen` to crash. The crash seems unrelated to whether or not a linkerscript is used.
