# fpm-pattern
Test implementation of the command execution pattern used in fpm. 

Can be built and run with [fpm](https://github.com/fortran-lang/fpm) with:

```shell
fpm run -- test
```

This toy code implements a command execution with two test commands: `test` 
and `copy`. Each command just prints a line to confirm which command has been called. 
