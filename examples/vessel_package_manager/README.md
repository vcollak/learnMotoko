# About
[Vessel](https://github.com/dfinity/vessel) is a package manager for Motoko. Below instructions show how to configure the package manager to leverage an Array module from aviate-labs including how to test it.

# Install 
Follow the install instructions in the [Vessel Github Page](https://github.com/dfinity/vessel)

# Configuration
1. In your project diectory run:
```bash
vessel init
```

2. Install the packages and make sure Main.mo will compile
```bash
$(vessel bin)/moc --check $(vessel sources) src/Array.mo
```
3. Add packages you'd like to use by editing the vessel.dhall file. Below file is generated automatically by `vessel init`. I removed the "overrides" as I'm not going to override and packages from upstream. I then added the reference to the [array](https://github.com/aviate-labs/array.mo) package from aviate-labs.
```javascript
let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.6.21-20220215/package-set.dhall sha256:b46f30e811fe5085741be01e126629c2a55d4c3d6ebf49408fb3b4a98e37589b
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let
  -- This is where you can add your own packages to the package-set
  additions =
    [
      { 
        name = "array"
        , version = "v0.2.0"
        , repo = "https://github.com/aviate-labs/array.mo"
        , dependencies = [ "base" ] : List Text
      }
    ] : List Package

in  upstream # additions 
```

4. Next, add the "array" to the `vessel.dhall` file:
```javascript
{
  dependencies = [ "base", "matchers", "array" ],
  compiler = Some "0.6.28"
}
```

5. Now you can run the vessel command to install packages again:
```bash
$(vessel bin)/moc --check $(vessel sources) src/Array.mo
```

# Testing
We created a test in test/aerrayzero.test.mo. You can execute that test to make sure the package works as expected:
```bash
$(vessel bin)/moc -r  $(vessel sources) test/arrayzero.test.mo
```

You can also execute the same command from `dfx` directory. The difference is that vessel may be using a different version of the compiler. This version comes from the compiler property in teh [vessel.dhall](vessel.dhall) file.
```bash
$(dfx cache show)/moc -r  $(vessel sources) test/arrayzero.test.mo
```

