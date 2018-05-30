import java.util.Comparator;

public class AuthorComparator implements Comparator<Book> { // Notice this is different than comparable- Comparable uses natural order while comperator allows you to write your own

    public int compare(Book a, Book b) {
        return a.getAuthor().compareTo(b.getAuthor());
    }
}