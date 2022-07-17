# Compiling Motoko to native binaries

To run tue motoko program exexute below command:
```bash
moc Main.mo -r
```

`Note: Above moc command is an alias created using:`
```bash
alias moc="$(dfx cache show)/moc --package base $(dfx cache show)/base"
```

The program can be compiled into a Wasm file:
```bash
moc Main.mo -c -wasi-system-api
```

The Wasm file can be compiled into a native binary using [wasmer](https://wasmer.io/). Below creates a binary called `main`. You can execute this binary natively on your operating system.
```bash
wasmer create-exe Main.wasm -o main
```



