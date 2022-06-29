
//importing the hello module
import hello "hello";
import Debug "mo:base/Debug";

actor {

    public query func main() : async (){

        //using the getName and getAge public methods 
        //from the hello modules
        Debug.print(debug_show(hello.getName()));
        Debug.print(debug_show(hello.getAge()));

        //priting the public variable from hello        
        Debug.print(debug_show(hello.location));
        

    };


}
