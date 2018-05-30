import java.util.Collections;
import java.util.ArrayList;
import java.util.Comparator;

public class Person implements Comparable<Person>{//Parameterize it if you know what you are comparing it to- Comparable is in lang package so nothing needs to be imported
    private String name;
    private int age;
    private int favoriteNum;

    public Person(String name, int age, int favoriteNum) {
        this.name = name;
        this.age = age;
        this.favoriteNum = favoriteNum;
    }

    public int CompareTo(Person other) { //returns 0 if things are the same, 1 if something is greater or bigger than, -1 if smaller than: Numbers can be anything you want as long as one is pos and one is neg and one is 0
        //This works but is long
        // if (favoriteNum > other.getFavoriteNum()) {
        //     return 1;
        // } else if (favoriteNum < other.getFavoriteNum()) {
        //     return -1;
        // } else {
        //     return 0;
        // }
        return favoriteNum - other.getFavoriteNum(); // this works the best and is the most concide in this case
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public int getFavoriteNum() {
        return favoriteNum;
    }

    public String toString() {
        return name + " who is " + age + " years old. Favorite Num = " + favoriteNum;
    }

    public boolean equals(Object other) {
        if (this == other) return true;
        if (other == null) return false;
        if (!(other instanceOf Person)) return false;
        Person that = (Person) other;
        return this.getFavoriteNum() == that.getFavoriteNum();
    }

    public int hashCode() {
        int result = 17;
        result = result * 31 + this.age;
        result = result * 31 + this.favoriteNum;
        result = result * 31 + this.name.hashcode();
        return result;
    }

    public Comparator<Person> getNameComparator() {
        return new PersonNameComparator();
    }
    public class PersonNameComparator implements Comparator<Person> {
        public int compare(Person a, Person b) {
            return a.getName().compareTo(b.getName());
        }
    }



    public static void main(String[] args) {
        Person a = new Person("Harsh", 21, 50);
        Person b = new Person("Karen", 20, 25);
        Person c = new Person("Farhan", 21, 100);
        Person d = new Person("Dragon", 19, 25);
        //System.out.println(a.compareTo(b));//a is bigger than b because a positive num is returned
        //System.out.println(b.compareTo(a);//b is smaller than a because a negative num is returned
        ArrayList<Person> personList = new ArrayList<Person>;

        personList.add(a);
        personList.add(b);
        personList.add(c);
        personList.add(d);
        System.out.println(personList);

        // class PersonNameComparator implements Comparator<Person> { // Inner class- could be seperate but just needed in this method- or could be outside the main method

        // public int compare(Person a, Person b) {
        //     return a.getAge().compareTo(b.getAge());// you can easily compare Strings usilg their built in compareTo method
        //     }

        // }

        Collections.sort(personList, new Comparator<Person>(){//Option 3 is an anonymous inner classand can not be referenced and can only be used exactly once and each time it is used you need to rewrite it
            public int compare(Person a, Person b) {
                return a.getName().compareTo(b.getName())
            }
        });

        //Collections.sort(personList);//Sort requires compareTo method - sorted using compare
        //Collections.sort(personList, new PersonAgeComparator()); //sorts using comparator
        //Collections.sort(personList, a.getNameComparator()); // sorts using inner class comparator
        System.out.print(personList);


    }
}

// public static <T extends Comparable<? super T>> void sort(List<T> list)

// T extends Comparable:
// T is a generic type who must extend/implement Comparable OR inherit the compareTo method from one of its superclasses

// Comparable<? super T>:
// The parameterized type of Comparable must be a super class of T or be T itself

// Animal implements Comparable<Car>

// Mammal extends Animal

//     Animals can get compared to cars but mammals can not be
//     Mammals can be compared to Animals and other mammals



//Compare vs Comparator
//  Compare allows you to