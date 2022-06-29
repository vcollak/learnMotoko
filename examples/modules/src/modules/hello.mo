module {
    
    //private variable
    let name : Text = "John";
    let age : Nat  = 25;

    //public variable 
    public let location : Text = "Houston";

    
    //return the name
    public func getName() : Text{
        return name;
    };

    //return the age
    public func getAge() : Nat{
        return age;
    };

}