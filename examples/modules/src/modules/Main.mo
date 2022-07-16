
//hello module in the same directory
import hello "hello";

//base module - debug
import Debug "mo:base/Debug";

//math module in teh utils directory
import Math "utils/math";

//natnum module - in natnum dir, but the file is lib.mo
import NatNum "natnum";

//selective inport - just importing the add method
import { add } = "utils/math";

//selectively imported subtract, but renames it to sub
import { subtract = sub } = "utils/math";


actor {

    public query func main() : async (){
        //using hello module
        Debug.print("Hello module Get Name: " # debug_show(hello.getName()));
        Debug.print("Hello module Get Age: " # debug_show(hello.getAge()));
        Debug.print("Hello module Location: " #debug_show(hello.location));       

        //using utils/math module
        Debug.print("Math module add: " # debug_show(Math.add(2,1)));
        Debug.print("Math modulesubtract" # debug_show(Math.subtract(1,2)));

        //calling add via the selective import
        Debug.print("Add: " # debug_show(add(2,2)));
        Debug.print("Sub: " # debug_show(sub(2,2)));

        Debug.print("NatNum module abs:" # debug_show(NatNum.abs(-10)));
    };


}
