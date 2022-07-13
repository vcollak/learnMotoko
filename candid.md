# Candid

Candid is the language that defines how to interact with the canisters. Clients and canisters to to each other using the candid language.

[Intro to Candid](https://internetcomputer.org/docs/current/developer-docs/build/languages/candid/candid-intro)

Utility called [ic-repl](https://github.com/chenyan2002/ic-repl) can enable users to send and receive candid messages using a repl command line utility. ic-repl can be used to create unit tests for ic. Here are the [examples](https://github.com/dfinity/examples/tree/master/motoko/basic_dao/tests) that show how to write shell script automated tests with is-repl. Some of the great use cases are to test that upgrades don't break stable variables.