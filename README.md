# Learn Motoko 

### Repository of notes to learn the Internet Computer development including 
Motoko.

# Notes
<canister_name> - replace this including<> with your canister name.


# DFX commands 

## Replica management
`dfx start --clean --background` - starts the replica with a clean state and in the background


## Deploy Commands

`dfx deploy` - deploys / re-deploys the canisters in the dfx.json

`dfx deploy <canister_name>` - deploys a speciic canister. Example: `dfx deploy hello_world` dpeloys the hello_world canister 

`dfx deploy <canister_name> --mode=reinstall` - wipes the data and dedeploys the canister

## Calling canisters

`dfx canister call <canister_name> totalSupply` - calls the totalSupply method on the canister

`dfx canister call <canister_name> balanceOf "principal \"$(dfx identity get-principal)\""` - calls the balanceOf method with an ID of the current principal. This essentially executes the dfx identity get-principal command and passed it to the canister method

`dfx canister call my-dip-nft mint "(
    principal \"$(dfx identity get-principal)\",    
    0 : nat,
    vec 
        {
            record { \"family\"; variant { TextContent = \"paint\" };};
            record { \"refinement\"; variant { NatContent = 0 : nat }};
            record { \"location\"; variant { TextContent = \"http://$(dfx canister id assets).localhost:8000/16.png\"}};
    })"` - passes a complex command 


`