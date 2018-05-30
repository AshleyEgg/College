/**
* Represents a Bishop and is a subclass of Piece
*
* @author aeggart6
* @version 1
*/
public class Bishop extends Piece {
    /**
     * Creates a Bishop based on the color
     * @param c color of the piece
     */
    public Bishop(Color c) {
        super(c);
    }

    /**
     * Returns the algebraic name for a Bishop
     * @return the algebraic name for a Bishop
     */
    public String algebraicName() {
        return "B";
    }

    /**
     * Returns the FEN name for a bishop based on its color
     * @return the FEN notation for a bishop
     */
    public String fenName() {
        return getColor() == Color.WHITE ? "B" : "b";
    }

    /**
     * Creates an Array containing the possible Squares to move to
     * @param square the Square the Piece is at
     * @return an array of Squares that the Piece can move to
     */
    public Square[] movesFrom(Square square) {
        Square[] sq = new Square[27];
        int counter = 0;
        char rank = square.getRank();
        char file = square.getFile();
        for (int i = 1; i <= 8; i++) {
            char[] ranks = new char[]{(char) (rank + i), (char) (rank - i)};
            char[] files = new char[]{(char) (file + i), (char) (file - i)};
            if (isInBoard(files[0], ranks[0])) {
                sq[counter++] = new Square(files[0], ranks[0]);
            }
            if (isInBoard(files[1], ranks[0])) {
                sq[counter++] = new Square(files[1], ranks[0]);
            }
            if (isInBoard(files[0], ranks[1])) {
                sq[counter++] = new Square(files[0], ranks[1]);
            }
            if (isInBoard(files[1], ranks[1])) {
                sq[counter++] = new Square(files[1], ranks[1]);
            }
        }

        Square[] full = new Square[counter];
        for (int i = 0; i < counter; i++) {
            full[i] = sq[i];
        }

        return full;
    }

}