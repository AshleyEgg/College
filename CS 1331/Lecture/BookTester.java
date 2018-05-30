public class BookTester {

    public static void main (String[] args) {
        Book book1 = new Novel("1984", "Orwell", 274, Genre.SCIFI);
        Book book2 = new Novel("It", "King", 429, Genre.HORROR);
        Book book3 = new Textbook();
        Book book4 = new Textbook();
        Book book5 = new Novel();

        //System.out.println(book1); // toString from Novel
        //System.out.println(book2); // toString from Book

        Book[] books = new Book[5];
        books[0] = book1;
        books[1] = book2;
        books[2] = book3;
        books[3] = book4;
        books[4] = book5;

        System.out.println(book4.equals(book5));

        for (Book b: books) {
            System.out.println(b);

        }

    }
}