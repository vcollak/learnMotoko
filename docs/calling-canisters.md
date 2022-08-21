# Calling Canisters

There are several ways call canister methods and pass parameters. One of the easy ways is to leverage the `dfx` command. Bellow shows how to pass parameters to methods using various types.

```javascript
    //dfx canister call method_params helloWorld
    public query func helloWorld() : async Text{
        "hello world";
    };

    //dfx canister call method_params helloName '("The Dude")'
    public query func helloName(name: Text) : async Text{
        name;
    };

    //dfx canister call method_params helloNat '(42)'
    public query func helloNat(number: Nat): async Nat{
        number;
    };

    //dfx canister call method_params helloOptNat '(opt 42)'
    public query func helloOptNat(number: ?Nat) : async ?Nat{
        number;
    };

    //dfx canister call method_params helloVecNat '(vec {42; 43; 45})'
    public query func helloVecNat(number: [Nat]): async [Nat]{
        number;
    };

    //dfx canister call method_params helloPrincipal '(principal "uxb53-nveul-vgrfr-2jfhw-hyzia-pgkii-2unx5-ak7lf-aeq4p-qggda-wqe")'
    public query func helloPrincipal (principal: Principal): async Principal{
        principal;
    };

    //dfx canister call method_params helloVecOptNat '(vec {opt 10})'
    public query func helloVecOptNat(numbers: [?Nat]): async [?Nat]{
        numbers;
    };


```