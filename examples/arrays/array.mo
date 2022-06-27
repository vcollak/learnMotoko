import Debug "mo:base/Debug";
import Array "mo:base/Array";

actor {

  //create immutable array 1
  let array1 : [Nat] = [1, 2, 3, 4, 6, 7, 8] ;

  //create immutable array 2 from the array 1 using Array.tabluate. If the array position is 2 or 5,
  //we change the entry. Otherwise, we keep the same entry.
  let array2 : [Nat] = Array.tabulate<Nat>(array1.size(), func(i:Nat) : Nat {
        array1[i];
  });

  public query func printArrays(): async (){
    
    Debug.print(debug_show("Array 1:") # debug_show(array1));
    Debug.print(debug_show("Array 2:") # debug_show(array2));

  }



};
