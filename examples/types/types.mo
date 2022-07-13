import Debug "mo:base/Debug";


///////////////////////////////////////////
// Classes
///////////////////////////////////////////

//Bar class
class Bar(){
    public let someValue: Text = "My Value";    
    public func getSomeValue(): Text{
        someValue;
    };
};

//Foo class
class Foo(){
    public let someValue: Text = "My Value";
    public func getSomeValue(): Text{
        someValue;
    };
};


//another way to create the classes. same as above syntactical sugar witj "class"
type Baz = {
    someValue : Text;
};
let baz = func(): Baz{
    return {
        someValue = "My Value";
    };
};

//instantiate the bar and foo classes
let bar: Bar = Bar();
let foo: Foo = Foo();

//We could also instantiate this - because of structural typing, Bar and Foo are
//exactly the same classes so we could have a type Foo and assign it to Bar
//however if the properties and functionas were not the same, this would not compile
//one exeption is if Bar had additional properties or functions not used by Foo, it would compile
//if Foo had additional properties or functions not found in Bar, it would not compaile
let bazz: Foo = Bar();

//print the values
Debug.print("Printing the property:" # bar.someValue);
Debug.print("Printing the results of func:" # foo.getSomeValue());
Debug.print("Printing the results of func:" # bazz.getSomeValue());


//-----------------------------------------------------------
//Product Types - strucures that can hold one or more values
//-----------------------------------------------------------
//tuple 
let myTuple = ("value1", "value2");
Debug.print(myTuple.0);
Debug.print(myTuple.1);

//record
let myRecord = {
    left = "vlavo";
    right = "vpravo";
};
Debug.print(myRecord.left);
Debug.print(myRecord.right);


//-----------------------------------------------------------
// variants
//-----------------------------------------------------------

//the value will be either #approve or #reject, but never both
type Vote = {
    #approve;
    #reject;
};
let myVote : Vote = #approve;
Debug.print(debug_show(myVote));


//this type will either hold #some with a parameter or #none
type Optional<A> = {
    #some: A;
    #none;
};

//some with a Nat parameter 
let myOptionalSome : Optional<Nat> = #some 10;

//none
let myOptionalNone : Optional<Nat> = #none;
Debug.print(debug_show(myOptionalSome));
Debug.print(debug_show(myOptionalNone));

//holds either #ok or #err
type Result<Ok, Err> = {
    #ok: Ok;
    #err: Err;
};

//defined this as <Nat, Text> so if it's OK need to pass Nat
//if #err, need to pass in Text
let myResult: Result<Nat, Text> = #ok 10;
let myResultE: Result<Nat, Text> = #err "some error";
Debug.print(debug_show(myResult));
Debug.print(debug_show(myResultE));


//can pass Nat that's either km or miles
type Distance = {
    #km: Nat;
    #miles: Nat;
};
let myDistanceKm: Distance = #km 10;
let myDistanceMi: Distance = #miles 5;
Debug.print(debug_show(myDistanceKm));
Debug.print(debug_show(myDistanceMi));

//url type. Why not just pass text? This requires us to be explicit 
//about using the url type
type Url = { #url: Text };
let myUrl : Url = #url "http://www.yahoo.com/";
  
//this provides an easier way to catch the fact that
//John Galt is probably not a URL.
let myUrlA : Url = #url "John Galt";

