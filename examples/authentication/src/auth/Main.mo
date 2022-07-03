import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Bool "mo:base/Bool";

actor Self {

    //checks if the user is an anonynmous web user
    public  shared query ({caller}) func isAnonymous(): async Bool{

        //this is always the identity of an anonymous web user
        let notAuthUser : Text = "2vxsx-fae";

        //return true if principal of caller matches proncipal of anonymous users
        if ( Principal.toText(caller) == notAuthUser){
            return true;
        }else{
            return false;
        }
    };

    //return the canister ID
    public query func getCanisterID() : async Principal{
        return Principal.fromActor(Self)
    }
       
    


}
