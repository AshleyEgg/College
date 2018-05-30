import java.util.Comparator;

public class PersonNameComparator implements Comparator<Person> {

    public int compare(Person a, Person b) {
        return a.getAge().compareTo(b.getAge());// you can easily compare Strings usilg their built in compareTo method
    }

}

// javac *.java compiles everything