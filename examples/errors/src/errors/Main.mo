import Array "mo:base/Array";
import Option "mo:base/Option";
import Result "mo:base/Result";


shared ({ caller = creator }) actor class ErrorsCanister () = {

    stable var owner : Principal = creator;
    stable var people: [Text] = ["John", "Jane"];

    //any errors our methods my poentially return
    type Errors = {
        #Unauthorized;
        #NotFound;        
    };

    //allow to rename the people in the array by supplying old name and new name
    //this demonstrates the errors to we didn't implement the actual rename
    //return a result - either #ok() or #err()
    public shared ({caller}) func renamePeople (oldName: Text, newName: Text): async Result.Result<(), Errors>{

        //make sure the caller is the owner. return error if not
        if (caller != owner){ return #err(#Unauthorized)};

        //make sure the oldName is in the array. If not, return error
        if (Option.isNull(Array.find<Text>(people, func (x){ x == oldName; }))){
            return #err(#NotFound);
        };

        //we are the owner and found the name in the array. can proceed
        return #ok();

    };

};
