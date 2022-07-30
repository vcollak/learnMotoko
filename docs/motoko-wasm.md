You can compile Motoko program to execute locally on an operating system without deploying on IC or local replica. The process is very simple and involved using the moc compiler to first compile the Motoko program into a WASM binary and then using a tool like [wasmer](https://docs.wasmer.io/ecosystem/wasmer/usage) to compile to native binary. Here are the steps:

Let's take a sample Motoko program saved in Main.mo:

```javascript
import Debug "mo:base/Debug";


//Bar class
class Bar(){
    public let someValue: Text = "My Value";    
    public func getSomeValue(): Text{
        someValue;
    };
};

//instantiate the bar and foo classes
let bar: Bar = Bar();

//print the values
Debug.print("Printing the property: " # bar.someValue);
```

Compile it to WASM. Note, I'm using an alias for moc. [Here is how you can set that up.](moc.md)
```bash
moc Main.mo -c -wasi-system-api
```

Create an exe using [wasmer](https://wasmer.io/):
```bash 
wasmer create-exe Main.wasm -o main
```

The compilation process should result in something like this on a Mac:
```Engine: staticlib
Compiler: cranelift
Target: aarch64-apple-darwin
✔ Native executable compiled successfully to `main`.
```

You can now hopefully execute your binary. :) 

--- 

`
Note: There are limitations to what will compile. For instance, trying to 
compile any Motoko file that includes an actor will not work resulting in an error:
`
```
Main.mo:21.1-43.2: type error [M0086], async expressions are not supported
  (This is a limitation of the current version and flag -wasi-system-api.)
```