import java.util.Comparator;

public class PersonAgeComparator implements Comparator<Person> {

    public int compare(Person a, Person b) {
        return a.getAge()- b.getAge();
    }

}

//Comparable has a compareTo that thatonly has 1 parameter
//Comparator has a compare method that has 2 parameters