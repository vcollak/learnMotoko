import Array "mo:base/Array";
import Option "mo:base/Option";

actor {

    stable var groceryList: [Text] = [];

    //returns the list
    public query func getList(): async [Text]{
        groceryList;
    };

    //adds to the list
    //dfx canister call complex addToList "(vec { \"bread\" })"
    //dfx canister call complex addToList "(vec { \"milk\" })"
    public func addToList(newList: [Text]): async (){
    
        //Array.append will return a new list that is comprised of the old list and new list. we save that list
        //in the groceryList stable var
        //in order to get the new list and to make sure we don't duplicate entries
        //we are using array filter, which takes the newList, finds any same items in the groceryList
        //and returns only the unique items
        //TODO - change the implementation to buffer, which is faster and not deprecated
         groceryList := Array.append(groceryList, Array.filter<Text>(newList, func (x){            
            Option.isNull(Array.find<Text>(groceryList, func (y) { x == y }));
        }));

    };

    //removes from the list the items it finds on the original list
    //and the removeList
    //dfx canister call complex removeFromList "(vec { \"milk\" })"
    public func removeFromList(removeList: [Text]): async (){

         groceryList := Array.filter<Text>(groceryList, func (item){
            Option.isNull(Array.find<Text>(removeList, func (x) { x == item }));
        });

    };

    //determines is the item is present in the list
    public query func isPresent(item: Text): async Bool{
        
        //returns true if filter can find an item in the groceryList
        Option.isSome(Array.find<Text>(groceryList, func (x) { x == item}));

        
        //another, but longer way would have been to do this
        //rgis performs a switch on the array find.
        /*
        switch (Array.find<Text>(groceryList, func (x) { x == item})){
            case (?item) true;  //found a value
            case _ false;       //did not find value
        };*/  


    };

    



}
