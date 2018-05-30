public class Novel extends Book {
    private Genre genre; // Genres are now enums

    public Novel(String t, String a, int n, Genre g) { //enum in construcot
        super(t,a,n);
        setGenre(g);
    }

     public Novel() {
        super();
        this.genre = Genre.GENERAL; //Proper way to store enums

    }

    public String toString() {
        return "Title: " + getTitle() + " Genre: " + this.genre;
    }

    public Genre getGenre() {
        return this.genre;
    }

    public void setGenre(Genre g) {
        this.genre = g;
    }


}