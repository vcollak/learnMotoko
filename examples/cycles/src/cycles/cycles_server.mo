//Cycles server checks if the caller sent the 
//appropriate cycles. If so, secret is returned 


import Result "mo:base/Result";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";


actor class myServer() = {

    type Errors = {        
        #Insufficient_Funds;
    };

    //how much to pay in cycles
    let price: Nat  = 1_00_000;
    
    let secret : Text = "42";

    public func getSecret(): async Result.Result<Text, Errors>{
        
        //how many cycles are sent with the message (call)
        let paid = Cycles.available();

        //if didn't pay enough, return
        if (paid < price){
            return #err(#Insufficient_Funds);
        };

        //all good. return the secret
        #ok(secret);

    };


};
