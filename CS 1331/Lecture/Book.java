public class Book implements Comparable<Book> {

   //instance variables (attributes)
    private String title;
    private String author;
    private int numpages;

    public static int bookCount = 0;

    public Book(String title, String author, int numpages) { //(constructor)
        this.title = title;
        this.author = author;
        this.numpages = numpages; // this denotes this particular instance
        bookCount++;
    }

    public Book() {
        this.title = "Unknown";
        this.author = "Anonymous";
        this.numpages = 0;
        bookCount++;
    }

    public String toString() {
        return this.title + " written by " + this.author;
    }

    public boolean isLong() {
        return this.numpages >  300;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String t) {
        this.title = t;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String a) {
        this.author = a;
    }

    public int getNumPages() {
        return numpages;
    }

    @Override
    public boolean equals(Object other) {
        if (other == null) { return false; }
        if (other == this) { return true; }
        if (!(other instanceof Book)) { return false; }
        Book that = (Book) other;
        return this.title.equals(that.title) && this.author.equals(that.author);
    }

    public int compareTo(Book other) {
        return (this.numpages - ((Book)other).numpages);
    }



}