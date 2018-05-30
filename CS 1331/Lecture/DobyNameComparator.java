import java.util.Comparator;

public class DobyNameComparator implements Comparator<Doberman> { // Notice this is different than comparable- Comparable uses natural order while comperator allows you to write your own

    public int compare(Doberman a, Doberman b) {
        System.out.println(a.getName()+""+ b.getName());
        return a.getName().compareTo(b.getName());
    }
}