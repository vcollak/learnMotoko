# Learn Motoko 

### Repository of notes to learn the Internet Computer development including 
Motoko.

# Notes
<canister_name> replace this including<> with your canister name.


# DFX commands 

## Replica management
Starts the replica with a clean state and in the background:

```
dfx start --clean --background
```


## Deploying Canisters

Deploys / re-deploys the canisters in the dfx.json:

```
dfx deploy
``` 

Dploys a speciic canister:
```
dfx deploy <canister_name>. Repalce <canister_name> with the specific canister
``` 
> Example: `dfx deploy hello_world` dpeloys the hello_world canister 


Wipes the data and dedeploys the canister:
```
dfx deploy <canister_name> --mode=reinstall
```

## Calling Canisters

Calls the totalSupply method on the canister:
```
dfx canister call <canister_name> totalSupply
```

Calls the balanceOf method with an ID of the current principal. This essentially executes the dfx identity get-principal command and passed it to the canister method:
```
dfx canister call <canister_name> balanceOf "principal \"$(dfx identity get-principal)\""
``` 

Calls canisters with more complex paramters:

```
dfx canister call <canister_name> "(
    principal \"$(dfx identity get-principal)\",
    0 : nat,
    vec {
        record { \"family\"; variant { TextContent = \"paint\" }; };
        record { \"refinement\"; variant { NatContent = 0 : nat } };
        record { \"location\"; variant { TextContent = \"http://$(dfx canister id assets).localhost:8000/16.png\" } };
    }
)"
``` 