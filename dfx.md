# DFX commands 

## Replica management
Starts the replica with a clean state and in the background:

```
dfx start --clean --background
```

# Managing Projects
Create a new project:
```
dfx new <canister_name>
```
> Replace <canister_name> with the name of your canister / project.


## Wallet, Ledger, Cycles, Identity Management
Find wallet balance:

```
dfx wallet --network ic balance
```

Find account id:
```
dfx ledger account-id
```

Get the principal ID:
```
dfx identity get-principal
```

Get the cycles wallet:
```
dfx identity --network ic get-wallet
```

Cycles balance:
```
dfx wallet --network ic balance
```

List controllers and custodians of the cycles wallet:
```
dfx wallet --network ic addresses
```

## Create, build and deploying canisters

Build the canister (does not deploy):
```
dfx build
```
Build and validate that canister compiles:
```
dfx build --check
```

Create a canister:
```
dfx canister create <canister_name>
```
> Replace <canister_name> with the name of your canister / project.

Install the canister:
```
dfx canister install <canister_name>
```
> Replace <canister_name> with the name of your canister / project.

Upgrade the canister (retains stable vars)
```
dfx canister install <canister_name> --mode upgrade
```
> Replace <canister_name> with the name of your canister / project.

Find ID for the candid canister:
```
dfx canister id __Candid_UI
```

Find ID for the canister called my_counter:
```
dfx canister id <canister_name>
```
> Replace <canister_name> with the name of your canister / project.


Deploys / re-deploys the canisters in the dfx.json:

```
dfx deploy
``` 

Dploys a specific canister:
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


> Note:  <canister_name> replace this including<> with your canister name.


