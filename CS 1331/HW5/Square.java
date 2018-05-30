/**
* Represents a Square on a chess board
*
* @author aeggart6
* @version 1
*/
public class Square {
    private char rank;
    private char file;
    private String name;

    /**
     * Creates a Square given 2 chars
     * @param file column of the square
     * @param rank row of the square
     */
    public Square(char file, char rank) {
        this("" + file + rank);
    }

    /**
     * Creates a Square given a name as a String
     * @param name a string of the file and rank
     */
    public Square(String name) {
        this.name = name;
        if (name != null && name.length() == 2) {
            file = name.charAt(0);
            rank = name.charAt(1);
            if (file >= 'a' && file <= 'h' && rank >= '1' && rank <= '8') {
                this.name = name;

            } else {
                throw new InvalidSquareException(name);
            }
        } else {
            throw new InvalidSquareException(name);
        }
    }

    /**
     * Accesses the Squares file
     * @return the file of the Square
     */
    public char getFile() {
        return file;
    }

    /**
     * Accesses the Squares Rank
     * @return the rank of the Square
     */
    public char getRank() {
        return rank;
    }

    /**
     * Accesses the Squares name
     * @return the name of the Square
     */
    public String toString() {
        return name;
    }

    /**
     * Overrides equals method
     * @param  o the object to compare the Square to
     * @return the file of the Square
     */
    @Override
    public boolean equals(Object o) {
        if (o instanceof Square) {
            Square that = (Square) o;
            return that.rank == rank && that.file == file;
        } else {
            return false;
        }
    }

    /**
     * Overrides the hash code
     * @return the unique hash code for the square
     */
    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + rank;
        result = 31 * result + file;
        return result;
    }
}