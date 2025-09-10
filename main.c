#include <stdio.h>
#include <dlfcn.h>
int main() {
    void *handle = dlopen("./libadd.so", RTLD_NOW);
    if (!handle) {
        printf("dlopen failed: %s\n", dlerror());
        return 0;
    }
    printf("loaded: %p\n", handle);
    void *sym = dlsym(handle, "add");
    printf("sym: %p\n", sym);
    int (*add)(int, int) = (int (*)(int, int)) sym;
    add(10, 20);
}
