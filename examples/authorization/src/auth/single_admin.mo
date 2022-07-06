// When this canister is called the first time, it will place the 
// caller of the canister in the creator var, which will in turn 
// be saved in the owner stable variable. 

import Debug "mo:base/Debug";

shared ({ caller = creator }) actor class AuthCanister () = {

    stable var owner : Principal = creator;

    //show principal of the owner of the canister 
    public query func getOwner(): async Principal{
        return owner;        
    };

    //show a secret, but only to an owner
    public shared query ({caller})func getSecret(): async Text{
        
        //only let the owner call this canister. if the 
        //calle is not the owner, this will fail
        assert(caller == owner);

        //return the secret that only owner (the creator of the canister can call
        "The Ultimate Answer to Life, The Universe and Everything is...42!";

    };

    //set the single new owner
    //call this method with:
    //  dfx canister call access-control-basic setOwner "principal \"<PRINCIPAL_ID>\""
    //      WHERE: <PRINCIPAL_ID> is the principal id of the new owner
    //      EXAMPLE: dfx canister call authorization setOwner "principal \"3qoyk-yveul-vgrfr-2jfhw-hyzia-pgkii-2unx5-ak7lf-aeq4p-qadha-wqe\""
    public shared ({caller}) func setOwner (newOwner : Principal) : async (){
        
        //make sure the owner is the old owner
        assert(caller == owner);

        //set the new owner
        owner := newOwner;
    }

};
