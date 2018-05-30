import java.util.ArrayList;
import java.util.Collections;

public class CollectionPractice {
    public static void main(String[] args){
        ArrayList<String> pets = new ArrayList<>(); // raw type
        pets.add("rabbit");
        pets.add("cat");
        pets.add("dog");
        String mypet = pets.get(0);
        Collections.sort(pets);
        System.out.println(pets);

        ArrayList<Book> books = new ArrayList<>();
        books.add(new Book());
        books.add(new Book("Moby Dick", "Melville",822));
        books.add(new Book("It", "King", 389));
        books.add(new Book("Emma", "Austen",522));
        books.add(new Book("1922","King",189));
        books.add(new Book("Silas Marner", "Eliot", 700));

        Collections.sort(books);// sorts in natural ordereing - num of pages
        //this sort method actually changes the array list
        System.out.println(books);

        Collections.sort(books, new AuthorComparator());


        ArrayList<Doberman> dogs = new ArrayList<>();
        dogs.add(new Doberman());
        dogs.add(new Doberman("Blackie"));
        dogs.add(new Doberman("Sweetie"));

        Collections.sort(dogs);
    }
}


//Check out anonymous inner class by looking at Simpkins SortTroopers.java
    //buiilds a method in the middle of the class