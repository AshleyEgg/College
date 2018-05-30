public class Square {
    /**
    * Represents a potential square for a game of chess
    *
    * @author aeggart6
    * @version 2
    */

    private char file;
    private char rank;

    /**
     * Creates a Square with the required parameters
     * @param file the piece column
     * @param rank the piece row
     */
    public Square(char file, char rank) throws InvalidSquareException {
        if (file >= 97 && file <= 104 && rank >= 49 && rank <= 56) {
            this.file = file;
            this.rank = rank;
        } else {
            String temp = file + "" + rank;
            throw new InvalidSquareException(temp);
        }
    }

    /**
     * Creates a Square with the required parameters
     * @param name the file and rank concatinated as a String
     */
    public Square(String name) throws InvalidSquareException {
        char tempF = name.charAt(0);
        char tempR = name.charAt(1);
        if (tempF >= 97 && tempF <= 104 && tempR >= 49 && tempR <= 56) {
            this.file = tempF;
            this.rank = tempR;
        } else {
            throw new InvalidSquareException(name);
        }
    }

    /**
     * Returns the string of the Square
     * @return the file and rank as a String
     */
    public String toString() {
        return (file + "" + rank);
    }

    /**
     * Checks if the two squares are equal
     * @param other a Square to check if equal
     * @return ture if the squares have the same rank and file
     */
    @Override
    public boolean equals(Object other) {
        if (null == other) {
            return false;
        }
        if (this == other) {
            return true;
        }
        if (!(other instanceof Square)) {
            return false;
        }
        Square that = (Square) other;
        return this.file == that.file && rank == that.rank;
    }
    /**
     * Returns the file for the square
     * @return the file for the square
     */
    public char getFile() {
        return file;
    }
    /**
     * Returns the rank for the square
     * @return the rank for the square
     */
    public char getRank() {
        return rank;
    }

    @Override
    public int hashCode() {
        int result = 17;
        result += 31 * (int) rank;
        result += 31 * (int) file;
        return result;
    }

    /**
     * Tests if an input square is a valid square
     * @return true if it is a valid square
     */
    public boolean isValidSquare() throws InvalidSquareException {
        char tempF = this.getFile();
        char tempR = this.getRank();
        if (tempF >= 97 && tempF <= 104 && tempR >= 49 && tempR <= 56) {
            return true;
        } else {
            throw new InvalidSquareException(tempF + "" + tempR);
        }
    }



}