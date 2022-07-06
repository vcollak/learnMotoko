import Debug "mo:base/Debug";
import Array "mo:base/Array";

actor {

  //mutable Nat
  var size : Nat = 42 ;
  
  //mutable array with initial size of 42 and value of 3 for each element
  let x : [var Nat] = Array.init<Nat>(size, 3);

  //mutate the zero array value
  x[0] := 10;
    
  public query func printArrays(): async (){    
    Debug.print(debug_show("Array:") # debug_show(x));    
  }



};
