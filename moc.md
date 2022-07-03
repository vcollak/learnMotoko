# MOC - the motoko compiler

It's possible to execute motoko programs without deploying to replica. To do so, simply run the moc program with handful paramters. Below compiles and executes the Main.mo motoko program.

```bash
moc -r Main.mo --package base $(dfx cache show)/base
```