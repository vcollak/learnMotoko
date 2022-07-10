//calls another canister to get secret
//must send som cycles with each call

import Result "mo:base/Result";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

//pass the server canister ID when this canister is deployed
shared ({caller = creator}) actor class myClient((serverCanister : Principal) ) = {

    type Errors = {        
        #Insufficient_Funds;
    };

    //send this many cycles
    let price: Nat  = 1_00_100;
    

    public func getSecret(): async Result.Result<Text, Errors>{
    
        //instantiare another canister. we captured this when the canister was initially deployed
        let server : actor { getSecret : () -> async Result.Result<Text, Errors>; } = actor(Principal.toText(serverCanister));
        
        //add the cycles to the message
        Cycles.add(price);

        //call the other canister
        let secret = await server.getSecret();
        //Debug.print("Unused balance: " # Nat.toText(Cycles.refunded()));

        secret;

    };
};
