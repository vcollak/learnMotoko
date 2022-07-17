
//import the Array module from ../src
import Array "../src/Array";

let xs: [Nat] = [1,2,3];
assert(Array.containsZero(xs) == false);
assert(Array.containsZero([0]) == true);