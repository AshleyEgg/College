import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class CollectionPractice2 {

    static class DobyNameComparator implements Comparator<Doberman> {

        public int compare(Doberman a, Doberman b) {
            System.out.println(a.getName()+""+ b.getName());
            return a.getName().compareTo(b.getName());
        }
    }

    public static void main(String[] args) {
        // ArrayList<String> pets = new ArrayList<>();
        // pets.add("rabbit");
        // pets.add("cat");
        // pets.add("dog");
        // String mypet = pets.get(0);
        // Collections.sort(pets);   //this would not work if String did not implement Comparable
        // System.out.println(pets);


        ArrayList<Book> books = new ArrayList<>();
        books.add(new Book());
        books.add(new Book("Moby Dick","Melville",822));
        books.add(new Book("It","King",389));
        books.add(new Book("Emma","Austen",522));
        books.add(new Book("1922","King",189));
        books.add(new Book("Silas Marner","Eliot",700));
        books.add(new Book("Emma","Aardvard",45));

        Collections.sort(books); // sorts in natural ordering - number of pages
        //this sort method actually changes the arraylist

        System.out.println(books);

        Collections.sort(books, new AuthorComparator());

        System.out.println(books);


        ArrayList<Doberman> dogs = new ArrayList<>();
        dogs.add(new Doberman());
        dogs.add(new Doberman("Blackie"));
        dogs.add(new Doberman("Sweetie"));
        dogs.add(new Doberman("Chuck"));

        //natural ordering (use compareTo)
        //Collections.sort(dogs); //Doberman does not implement comparable
        //System.out.println(dogs);

        //named comparator class
        Collections.sort(dogs, new Comparator<Doberman>() {
            public int compare(Doberman d1, Doberman d2) {
                return (d1.getName().charAt(1)) - (d2.getName().charAt(1));
            }
        });  // alphabetically
        System.out.println(dogs);

    }

}

