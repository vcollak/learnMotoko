
# Mutability

`
You can find [more on mutability here](https://internetcomputer.org/docs/current/developer-docs/build/languages/motoko/mutable-state) from IC documentation. 
`

Below shows how various variable declarations affect mutability of variables:
```javascript
    //declares a mutable Int with var
    var number : Int = 10;  
    
    //no issues reassigning mutable values
    number := number  + 10;

    //declares an immutable Int with let
    let imutableNumber : Int = 0;
 
    //because immutableNumber was declared with let, below will 
    //fail to compile. Cannot re-assign ummutable values
    imutableNumber := imutableNumber + 10;

    //declare immutable array
    var immutableArray : [Int] = [1,2,3];
    
    //even though immutableArray is declared with var, it's still immutable because the type and values are immutable
    //below will fail
     immutableArray[0] := 0;

    //but, if we declare like this, it will be mutable
    //notice we added var in front of Int and in front of the values
    var immutableArrayI : [var Int] = [var 1,2,3];
    immutableArrayI[0] := 0;

```

### Immutable Arrays
This code shows how to [copy an array by using Array.tabulate](examples/arrays/array.mo):
```javascript
//create immutable array 1
  let array1 : [Nat] = [1, 2, 3, 4, 6, 7, 8] ;

  //create immutable array 2 from the array 1 using Array.tabluate. If the array position is 2 or 5,
  //we change the entry. Otherwise, we keep the same entry.
  let array2 : [Nat] = Array.tabulate<Nat>(array1.size(), func(i:Nat) : Nat {
        array1[i];
  });

```

This code [copies one array to another using Array.tabulate](examples/arrays/array.mo), but changes the entries in the process. Both cases show a creation of immutable arrays:
```javascript
//create array 1
  let array1 : [Nat] = [1, 2, 3, 4, 6, 7, 8] ;

  //create array 2 from the array 1 using Array.tabluate. If the array position is 2 or 5,
  //we change the entry. Otherwise, we keep the same entry.
  let array2 : [Nat] = Array.tabulate<Nat>(array1.size(), func(i:Nat) : Nat {
      
      
      if ( i == 2 or i == 5 ) {     // change 3rd and 6th entries
        array1[i] * i     
      } 
      else {                        // no change to other entries
        array1[i] 
      } 
    }) ;
```

### Mutable Arrays
[Create mutable array](examples/arrays/mutableArray1.mo) and change it:
```javascript
 //mutable Nat
  var size : Nat = 42 ;
  
  //mutable array with initial size of 42 and value of 3 for each element
  let x : [var Nat] = Array.init<Nat>(size, 3);

  //mutate the zero array value
  x[0] := 10;


```