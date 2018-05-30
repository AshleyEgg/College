/**
* Represents a Rook and is a subclass of Piece
*
* @author aeggart6
* @version 1
*/
public class Rook extends Piece {

    /**
     * Creates a Rook based on the color
     * @param c color of the piece
     */
    public Rook(Color c) {
        super(c);
    }

    /**
     * Returns the algebraic name for the Piece
     * @return the algebraic name for a Rook
     */
    public String algebraicName() {
        return "R";
    }

    /**
     * Returns the FEN name for a Rook based on its color
     * @return the FEN notation for a Rook
     */
    public String fenName() {
        return getColor() == Color.WHITE ? "R" : "r";
    }

    /**
     * Creates an array of the possible Squares to move to
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
            if (isInBoard(files[0], rank)) {
                sq[counter++] = new Square(files[0], rank);
            }
            if (isInBoard(files[1], rank)) {
                sq[counter++] = new Square(files[1], rank);
            }
            if (isInBoard(file, ranks[0])) {
                sq[counter++] = new Square(file, ranks[0]);
            }
            if (isInBoard(file, ranks[1])) {
                sq[counter++] = new Square(file, ranks[1]);
            }
        }

        Square[] full = new Square[counter];
        for (int i = 0; i < counter; i++) {
            full[i] = sq[i];
        }

        return full;
    }
}