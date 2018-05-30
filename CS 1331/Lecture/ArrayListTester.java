import java.util.ArrayList;

public class ArrayListTester {
    public static void main(String[] args) {
        ArrayList books = new ArrayList(); //array list of no type so anything can go into it
        books.add(new Book());
        books.add(new Novel());
        books.add("Hello");

        System.out.println(books);
    }

}