import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

public class CollectionTest { //Collection is an interface implemented by lists and sets and maps and queues
    public static void main(String[] args) {
        List<Integer> myList =  new ArrayList<>();
        System.out.println(myList);
        myList.add(42);
        myList.add(71);
        myList.add(42);
        myList.remove(new Integer(71));//object needs to be passed in otherwise it will try to remove the thing at the 71 place
        myList.add("Hello");
        System.out.println(myList);
        //System.out.println(myList.get(0));// unboxing extracts an element so I woud get an int not an Integer



        Box<String> myStringBox = new Box("Hello");
        System.out.println(myStringBox.getData());
    }
}
//Set, list, map are all interfaces while ArrayList, LinkedList, Hash Set are concrete objects that can be instantized
//Collection interface has add(E e), contains(object key), isEmpty(),iterator, remove(Object o)

//List
    //order is conserved and can contatin multiples of an element
//Set
    //order is random but can only contain one of each object

//ArrayList
    //dynamic array that implements list
    //ArrayList tasks = new ArrayList()
//Type Parameters
    //ArrayList<String> names = new ArrayList<>();
    //If a type is not included it will be of type object
//Generics
    //Let the user decide the type of the list based on what they input
    //List<E> myList = new ArrayList<>();
    //You can have generic generics-  uses ?
        //public static <T extends Comparable<? super T>> void sort(List<T> list)
            //sorts a list of elemet=nt type T, Type T must be Comparable, but the compare() method can be implemented in class T ro in any superclass of type T
//autoboxing and unboxing questions