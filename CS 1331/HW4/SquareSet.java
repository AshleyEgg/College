import java.util.Set;
import java.util.Iterator;
import java.util.Collection;
import java.util.NoSuchElementException;

public class SquareSet implements Set<Square>, Iterable<Square> {
    /**
    * Represents a set of squares for a game of chess
    *
    * @author aeggart6
    * @version 1
    */

    private Square[] elements; //Might need to be a square set
    private int lastIndex;

    private class SquareSetIterator implements Iterator<Square> {
        private int cursor = 0;

        public boolean hasNext() {
            return cursor <= lastIndex;
        }

        public Square next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            return elements[cursor++];
        }

        public void remove() {
            SquareSet.this.remove(cursor - 1);
        }
    }

    public SquareSet() { //Constructor 1- possibly not right
        this.elements = new Square[10];
        this.lastIndex = -1;
    }

    public SquareSet(Collection<Square> col) {//2nd constructor
        SquareSet set = new SquareSet();
        if (!col.isEmpty()) {
            for (Square s : col) {
                if (s != null && !contains(s)) {
                    set.add(s);
                }
            }
        }
    }

    @Override
    public boolean add(Square e){ //maybe needs work- copied from Simpkins Dynamic Array code - potentaily needs to throw/catch invalid square exception
        try {
            if (lastIndex == elements.length - 1) {
            int newCapacity = elements.length * 2;
            Square[] temp = new Square[newCapacity];
            for (int i = 0; i < elements.length; i++) {//needs to be used to replace
                temp[i] = elements[i];
            }
            elements = temp; //uses an array as the backing thing and grows it
            }
            if (!contains(e) && e.isValidSquare()) { //if element is not is the set it is added
                elements[++lastIndex] = e;
                return true;
            } else {
                return false;
            }
        } catch (NullPointerException ex) {
            return false;
        } catch (InvalidSquareException ex) {
            return false;
        }
    }

    @Override
    public boolean contains(Object key) { // should maybe work
        boolean temp = false;
        for (Square s : elements) { //for every square in elements
            if (s.equals(key)) {
                temp = true;
            }
        }
        return temp;
        //Look through the entire array to see if it is included
    }
    @Override
    public boolean containsAll(Collection<?> c) { //might work
        //if the set includes everything in c return true
        for (Square s : elements) {
             if (!c.contains(s)) {
                return false;
             }
        }
        return true;
    }


    @Override
    public boolean equals(Object other) { // Should work
        if (null == other) {
            return false;
        }
        if (this == other) {
            return true;
        }
        if (!(other instanceof SquareSet)) {
            return false;
        }
        SquareSet that = (SquareSet) other;
        return this.size() == that.size() && this.containsAll(that);
    }

    @Override
    public int hashCode() { // needs to use the recipe in the slides but works
        int result = 17;
        result = result * 31 + this.size();
        return result;
    }

    @Override
    public boolean isEmpty() { //should work
        return this.size() == 0 || elements == null;
    }

    @Override
    public Iterator<Square> iterator() { //should be correct
        return new SquareSetIterator();
    }

    @Override
    public int size() { // Should work
        return lastIndex + 1;
    }

    @Override
    public Object[] toArray() {

        return elements;
    }

    @Override
    public <T> T[] toArray(T[] array) { //maybe done right
        int size = size();
        if (array.length < size) {
            array = (T[]) new Square[size];
        } else if (array.length > size) {
            array[size] = null;
        }
        int i = 0;
        for (Square e: this) {
            array[i] = (T) e;
            i++;
        }
        return array;
    }

    @Override
    public boolean addAll(Collection<? extends Square> c) { //extra credit
        return false; // stubbed
    }

    @Override
    public boolean remove(Object o) {
        return false; // stubbed
    }

    @Override
    public void clear() { //Below should all be good
        throw new UnsupportedOperationException();

    }
    @Override
    public boolean removeAll(Collection<?> c) {
        throw new UnsupportedOperationException();
    }
    @Override
    public boolean retainAll(Collection<?> c) {
        throw new UnsupportedOperationException();
    }

}