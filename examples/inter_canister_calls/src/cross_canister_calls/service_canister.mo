

actor service_canister {

    let canisterName : Text = "Service Canister";

    //returns the statuc canister name
    public query func getCanisterName() : async Text{
        canisterName;
    }



}
