// When this canister is called the first time, it will place the 
// caller of the canister in the creator var, which will in turn 
// be saved in the admins list

//this demonstrates how to check is the user us aithorized
//but instead of using assert() to throw an error, we're using a Result
//this is a preffered way to return errors

import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Option "mo:base/Option";
import Result "mo:base/Result";

shared ({ caller = creator }) actor class AuthCanister () = {

    //holds list of principals who can admin the canister 
    stable var admins : [Principal] = [creator];

    //error type
    type Errors = {
        #Unauthorized;
    };

    //list principals who are admins
    public query func getAdmins(): async [Principal]{
        admins;
    };

    //true if the principal is admin. we use this to assert
    //in protected methods
    private func isUnathorized(principal: Principal): Bool {

        //find the principal in the admins list
        //return true if found and false if not
        switch (Array.find<Principal>(admins, func (x) { x == principal})){
            case (?a) false;
            case _ true;
        };      
    };

    //add the list of principals to admins
    //dfx canister call multi_admin addAdmins "(vec { principal \"$principal\"; })";
    //  WHERE: $principal is the principal of admin we're adding
    public shared ({caller}) func addAdmins(newAdmins: [Principal]): async Result.Result<(), Errors>{
        
        //make sure the user is admin
        if (isUnathorized(caller)){ return #err(#Unauthorized) };
        
        //filter out admins who are already in the list (so we don't add them twice)
        //
        admins := Array.append(admins, Array.filter<Principal>(newAdmins, func (x){            
            Option.isNull(Array.find<Principal>(admins, func (y) { x == y }));
        }));

        //able to add an admin
        #ok();
        

    };

    //remove the list of principals from admins
    //dfx canister call multi_admin removeAdmins "(vec { principal \"$principal\"; })";
    public shared ({caller}) func removeAdmins(removals: [Principal]): async Result.Result<(), Errors>{
        
        //make sure the user is admin
        if (isUnathorized(caller)){ return #err(#Unauthorized) };
        
        admins := Array.filter<Principal>(admins, func (admin){
            Option.isNull(Array.find<Principal>(removals, func (x) { x == admin }));
        });

        #ok();
        
    };


    //show a secret, but only to an owner
    public shared query ({caller})func getSecret(): async Result.Result<Text, Errors>{
        
        //only let the admins call this canister. if the 
        //caller is not on the admin list,  this will fail         
        if (isUnathorized(caller)){ return #err(#Unauthorized) };

        //return the secret that only owner (the creator of the canister can call
        #ok("The Ultimate Answer to Life, The Universe and Everything is...42!");

    };


};
