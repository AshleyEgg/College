import java.util.Iterator;//Comparator and Iterator need to be imported everythign else is in lang package
import java.util.NoSuchElementException;

public class Classroom implements Iterable<Person>{//Iterator for person
    private Person[] allPeople;
    private int size;

    public Classroom(Person[] people) {
        this.allPeople = people;
    }

    public void countSize() {
        int count = 0;
        for (Person p : allPeople) {
            if (p != null) {
                count++;
            }
        }
    }

    private class PeopleIterator implements Iterator<Person> { // inner class

        private int cursor = 0;

        public boolean hasNext() {
            return cursor < size;
        }

        public Person next() {
            if (!hasNext()) {
                throw new NoSuchElementException("Nothing is there");
            }
            return allPeople[cursor++];
        }
    }

    public Iterator<Person> iterator() {
        return new PeopleIterator;
    }


    public static void main(String[] args) {
        Person[] people = {new Person("Harsh", 21, 50),
        new Person("Karen", 20, 25),
        new Person("Farhan", 21, 100),
        new Person("Dragon", 19, 25), null, null};

        Classroom firstPeriod = new Classroom(people);

        for (Person p : firstPeriod) {
            System.out.println(p);
        }
    }

}