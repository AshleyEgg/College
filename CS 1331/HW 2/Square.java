public class Square {
    /**
 * Represents a potential square for a game of chess
 *
 * @author aeggart6
 */

    private char file;
    private char rank;

    public Square(char file, char rank) throws InvalidSquareException {
        if(file>=96 && file<=104 && rank>=49 && rank<=56) {
            this.file = file;
            this.rank = rank;
        } else {
            String temp = file + "" + rank;
            throw new InvalidSquareException(temp);
        }

    }

    public Square(String name) throws InvalidSquareException {
        char tempFile = name.charAt(0);
        char tempRank = name.charAt(1);
        if(tempFile>=96 && tempFile<=104 && tempRank>=49 && tempRank<=56) {
            this.file = tempFile;
            this.rank = tempRank;
        } else {
            throw new InvalidSquareException(name);
        }
    }

    /**
     * Returns the string of the Square
     * @return the file and rank as a String
     */
    public String toString() {
        return String.valueOf(file) + String.valueOf(rank);
    }

    /**
     * Checks if the two squares are equal
     * @param a Square to check if equal
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

    /**
     * Converts rank into the int value for the col
     * @return the col that corresponds to the square rank
     */
    public int rankToCol() {
        int col = 0;
        switch (rank) {
        case 'a': col = 0;
            break;
        case 'b': col = 1;
            break;
        case 'c': col = 2;
            break;
        case 'd': col = 3;
            break;
        case 'e': col = 4;
            break;
        case 'f': col = 5;
            break;
        case 'g': col = 6;
            break;
        case 'h': col = 7;
            break;
        default : col = 0;
        }
        return col;
    }
    /**
     * Converts file into the int value for the row
     * @return the row that corresponds to the square file
     */
    public int fileToRow() {
         int row = 8 - Character.getNumericValue(file);
         return row;
    }

    /**
     * Converts col into the char value for the rank
     * @return the rank that corresponds to the square col
     */
    public char colToRank(int col) {
        char rank;
        switch (col) {
        case 0: rank = 'a';
            break;
        case 1: rank = 'b';
            break;
        case 2: rank = 'c';
            break;
        case 3: rank = 'd';
            break;
        case 4: rank = 'e';
            break;
        case 5: rank = 'f';
            break;
        case 6: rank = 'g';
            break;
        case 7: rank = 'h';
            break;
        default : rank = 'k';
        }
        return rank;
    }

    /**
     * Converts file into the int value for the row
     * @return the row that corresponds to the square file
     */
    public char rowToFile(int row) {
        char file = (char) (8 - row + '0');
        return file;
    }

    // /**
    //  * Converts rank into the int value for the col
    //  * @return the col that corresponds to the square rank
    //  */
    // public Square[] increaseSize(Square added) { //Adds in an element
    //     Square[] temp = new Square[this.length + 1];
    //     for (int i = 0; i < this.length; i++){
    //         temp[i] = this[i];
    //     }
    //     temp[this.length] = added;

    //     return temp;
    // }
}