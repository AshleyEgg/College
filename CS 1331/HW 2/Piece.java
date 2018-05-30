public abstract class Piece {
    private Color color;

    public Piece(Color c) { //Constructor
        this.color = c;
    }

    public Color getColor() { // Returns the piece color
        return color;
    }

    /**
     * Returns the algebraic name of the piece
     * @return "" for pawns, or one of "K", "Q", "B", "N", "R"
     */
    public abstract String algebraicName();

    /**
     * Returns the name in FEN notation of the piece
     * @return the correct FEN notation for the piece
     */
    public abstract String fenName();

    /**
     * Finds the possible squares the piece could move to
     * @return "" for pawns, or one of "K", "Q", "B", "N", "R"
     */
    public abstract Square[] movesFrom(Square square);

    public Square[] increaseSize(Square[] original, Square added) { //Adds in an element
        Square[] temp = new Square[original.length + 1];
        for (int i = 0; i < original.length; i++){
            temp[i] = original[i];
        }
        temp[original.length] = added;
        original = temp;
        return original;
    }

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

    public char rowToFile(int row) {
        char file = (char) ((8 - row) + '0');
        return file;
    }
}
