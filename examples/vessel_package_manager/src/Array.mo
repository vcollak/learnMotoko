import Nat "mo:base/Nat";
import Array "mo:array/Array"; //import the Array module from the array package
import Copy "mo:array/Copy"; //import the Copy module from the array package

module {

    public func containsZero(xs: [Nat]): Bool{
        Array.contains<Nat>(xs, 0, Nat.equal);
    };

}
