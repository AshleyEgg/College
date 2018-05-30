/**
* Represents a Pawn and is a subclass of Piece
*
* @author aeggart6
* @version 1
*/
public class Pawn extends Piece {

    /**
     * Creates a Pawn based on the color
     * @param c color of the piece
     */
    public Pawn(Color c) {
        super(c);
    }

    /**
     * Returns the algebraic name for the Piece
     * @return the algebraic name for a Pawn
     */
    public String algebraicName() {
        return "";
    }

    /**
     * Returns the FEN name for a Pawn based on its color
     * @return the FEN notation for a Pawn
     */
    public String fenName() {
        return getColor() == Color.WHITE ? "P" : "p";
    }

    /**
     * Creates an array of the possible Squares to move to
     * @param square the Square the Piece is at
     * @return an array of Squares that the Piece can move to
     */
    public Square[] movesFrom(Square square) {
        char rank = square.getRank();
        char file = square.getFile();
        if (getColor() == Color.WHITE) {
            if (rank == '8') {
                return new Square[0];
            } else if (rank == '2') {
                return new Square[]{new Square(file, '4'),
                    new Square(file, '3')};
            } else {
                return new Square[]{new Square(file, (char) (rank + 1))};
            }
        } else {
            if (rank == '1') {
                return new Square[0];
            } else if (rank == '7') {
                return new Square[]{new Square(file, '5'),
                    new Square(file, '6')};
            } else {
                return new Square[]{new Square(file, (char) (rank - 1))};
            }
        }
    }
}