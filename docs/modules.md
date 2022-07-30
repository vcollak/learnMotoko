# Modules

Modules provide a mechanism to separate actor code into several files. [More about modules and imports from dfinity docs](https://internetcomputer.org/docs/current/developer-docs/build/languages/motoko/modules-and-imports). Also here is a [simple example](../examples/modules/).


- Q: Can I have different actors in the same project
    - Yes. Each is a separate canister. Actors can import canisters using `import XYZ "canister:XYZ"` syntax.