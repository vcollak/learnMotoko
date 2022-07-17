import Debug "mo:base/Debug";

//Bar class
class Bar(){
    public let someValue: Text = "My Value";    
    public func getSomeValue(): Text{
        someValue;
    };
};

//instantiate the bar and foo classes
let bar: Bar = Bar();

//print the values
Debug.print("Printing the property: " # bar.someValue);


