public class Textbook extends Book {
    private String subject;

    public Textbook(String t, String a, int n, String s){
        super(t, a, n);
        setSubject(s);
    }

    public Textbook(){
        super();
        this.subject = "unknown";
    }

    public String toString(){
        return "Title: " + getTitle() + " Subject: " + this.subject;
    }

    public String getSubject() {
        return this.subject;
    }

    public void setSubject(String g) {
        this.subject = g;
    }

    @Override
    public boolean isLong() {
        return this.getNumPages() > 900;
    }
}