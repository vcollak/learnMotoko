//Consumer canister will call the service canister 
//getServiceCanisterName requires us to pass canister_id Text
//Example: dfx canister call consumer_canister_a getServiceCanisterName '("rrkah-fqaaa-aaaaa-aaaaq-cai")'
import Principal "mo:base/Principal";

actor consumer_canister {

    //because we're doing an inter-canister call this method cannot be a query method :(
    //more here: https://forum.dfinity.org/t/inter-canister-query-calls-community-consideration/6754/17
    public func getServiceCanisterName(canister_id: Text): async Text{

        //instantiate the service canister 
        //need to define the type as actor { method_signature_here } and assign to actor with 
        //constructor of the canister ID
        let svcCanister : actor { getCanisterName : () -> async Text; } = actor (canister_id);         
        
        //call the method for the service canister         
        await svcCanister.getCanisterName();
        
    };





}
