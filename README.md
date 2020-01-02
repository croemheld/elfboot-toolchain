# elfboot-toolchain 

An OS-specific toolchain for the [elfboot](https://github.com/croemheld/elfboot) bootloader.

### About

The toolchain generates a cross compiler to create executable code for the x86 architecture.

> Since the cross compiler is specificially designed to compile the elfboot bootloader, it does not use an external C library. Instead, we only utilize the low-level library in the GCC package.

### Prerequisites

To build GCC, the packages `bison`, `flex` and `texinfo` are required:

```shell
$ sudo apt-get install bison flex texinfo
```
