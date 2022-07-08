//Consumer canister will call the service canister 
//getServiceCanisterName does not require any parameters. Instead, 
//we're importing the canister by name (which means it needs to ne defined in canister_ids.json)
//Example: dfx canister call consumer_canister_a getServiceCanisterName '("rrkah-fqaaa-aaaaa-aaaaq-cai")'

//import the canister we'll be calling
import svcCanister "canister:service_canister";

actor consumer_canister {

    //because we're doing an inter-canister call this method cannot be a query method :(
    //more here: https://forum.dfinity.org/t/inter-canister-query-calls-community-consideration/6754/17
    public func getServiceCanisterName(): async Text{
        
        //call the method for the service canister         
        await svcCanister.getCanisterName();
        
    };





}
