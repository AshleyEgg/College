import java.util.*;

public class HashAndLambdas {

    public static int ageCompare(Person a, Person b) {
        return a.getAge() - b.getAge();
    }
    public static void main(String[] args) {
        List<Person> people = generatePeople();
        System.out.println(people);
        Set<Person> personSet = new HashSet<>(generatePeople());

        //Below inner class was replaced with the lambda expression below
        // public int compare(Person a, Person b) {
        //     return a.getAge().compareTo(b.getName());
        // }

        //Collections.sort(people, (Person a, Person b) -> a.getAge() - b.getAge());// Must be a functional interface( inner class with one method) to be able to become a lambda expression
        // Collections.sort(people, Person::ageCompare);//This line makes use of method referencing and makes it uncessary to retype the lambda expression each time you want to sort
        // people.add(new Person("John", 10, 11));
        // Collections.sort(people, Person::ageCompare);

        System.out.println(people);

        //kind of like masks in matlab- stream
        personSet
        .stream()
        .filter(a -> a.getName() > 30)
        .filter(a -> a.getName().charAt(0) == 'A')
        .forEach(System.out::println);// method reference to the println


    public static List<Person> generatePeople() {
        List<Person> listOfPeople = new ArrayList<>();
        listOfPeople.add(new Person("Ashley", 19, 17));
        listOfPeople.add(new Person("Sophia", 18, 0));
        listOfPeople.add(new Person("Andrea", 83, 62));
        listOfPeople.add(new Person("Bryce", 20, 4));
        listOfPeople.add(new Person("Charlie", 19, 100));
        listOfPeople.add(new Person("Alex", 19, 99));
        return listOfPeople;
    }
}


//Go to winterbe.com - java 8 tutorials
//or go to oracle tutorials for lambda expressions
//
//
//
//3 kinds of method reference
//  object.instaceMethod(x)
//  someList.forEach(System.out::println);
//  Comparator<Trooper> byName = Comparator.comparing(Trooper::getName);