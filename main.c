#include <stdio.h>
#include <dlfcn.h>
int main() {
    void *handle = dlopen("./libfoo.so", RTLD_NOW);
    printf("done dlopen\n");
    printf("loaded: %p\n", handle);
    void *sym = dlsym(handle, "add");
    printf("sym: %p\n", sym);
    int (*add)(int, int) = (int (*)(int, int)) sym;
    add(10, 20);
}
