# MOC - the motoko compiler

It's possible to execute motoko programs without deploying to replica. To do so, simply run the moc program with handful parameters. Below executes the Main.mo motoko program.

```bash
$(dfx cache show)/moc -r Main.mo --package base $(dfx cache show)/base
```

To simplify this, you can always alias the above command such as:

```bash
alias moc="$(dfx cache show)/moc --package base $(dfx cache show)/base"
```

The resulting command would enable you to run:
```bash
moc -r Main.mo
```

`Few things to note:`

 The Command `dfx cache show` will show the path fo the current dfinity sdk directory. This directory contains the dfx command itself with all the necessary things to run a local replica. The command `$(dfx cache show)/moc` seems complicated, but all it does is prepend the dfinity cache directory to the `moc` command. Similarly, when we include the `$(dfx cache show)/base` in the moc command, all we're doing is providing the directory called `base` within the dfinity cache directory. This is where the entire base library is located.

You can also compile Motoko to run as a native binary on the operating system. To do that [check out this page](motoko-wasm.md).