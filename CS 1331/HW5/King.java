/**
* Represents a King and is a subclass of Piece
*
* @author aeggart6
* @version 1
*/
public class King extends Piece {

    /**
     * Creates a King based on the color
     * @param c color of the piece
     */
    public King(Color c) {
        super(c);
    }

    /**
     * Returns the algebraic name for a King
     * @return the algebraic name for a King
     */
    public String algebraicName() {
        return "K";
    }

    /**
     * Returns the FEN name for a King based on its color
     * @return the FEN notation for a King
     */
    public String fenName() {
        return getColor() == Color.WHITE ? "K" : "k";
    }

    /**
     * Creates an array of the possible Squares to move to
     * @param square the Square the Piece is at
     * @return an array of Squares that the Piece can move to
     */
    public Square[] movesFrom(Square square) {
        Square[] sq = new Square[8];
        int counter = 0;
        char rank = square.getRank();
        char file = square.getFile();
        for (int r = -1; r <= 1; r++) {
            for (int c = -1; c <= 1; c++) {
                if (r == 0 && c == 0) {
                    continue;
                }
                if (isInBoard((char) (file + c), (char) (rank + r))) {
                    sq[counter++] = new Square((char) (file + c),
                    (char) (rank + r));
                }
            }
        }

        Square[] full = new Square[counter];
        for (int i = 0; i < counter; i++) {
            full[i] = sq[i];
        }

        return full;
    }
}